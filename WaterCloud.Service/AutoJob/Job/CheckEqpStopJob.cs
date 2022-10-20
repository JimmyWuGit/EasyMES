using Chloe;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WaterCloud.Code;
using WaterCloud.Domain.ClassTask;
using WaterCloud.Domain.EquipmentManage;
using WaterCloud.Domain.ProcessManage;
using WaterCloud.Domain.SystemManage;

namespace WaterCloud.Service.AutoJob
{

    /// <summary>
    /// 设备急停停机任务
    /// </summary>
    public class CheckEqpStopJob : IJobTask
    {
        private IWebHostEnvironment _hostingEnvironment;
        private IDbContext _context;

        public CheckEqpStopJob(IDbContext context)
        {
            _hostingEnvironment = GlobalContext.HostingEnvironment;
            _context = context;
        }

        public async Task<AlwaysResult> Start()
        {
            AlwaysResult obj = new AlwaysResult();
            string month = DateTime.Now.ToString("yyyyMM");
            string shift = "白班";
            string classnum = "A";
            int hour = DateTime.Now.Hour;
            int day = DateTime.Now.Day;
            DateTime date = DateTime.Now;
            string dateString = date.ToString("yyyyMMdd");

            DateTime datebgn = DateTime.Now.Date.AddHours(8);
            DateTime dateend = DateTime.Now.Date.AddHours(20);

            if (hour >= 20 && hour < 24)
            {
                shift = "夜班";
                classnum = "B";

                datebgn = DateTime.Now.Date.AddHours(20);
                dateend = DateTime.Now.Date.AddDays(1).AddHours(8);
            }
            else if (hour >= 0 && hour < 8)
            {
                day = day - 1;
                shift = "夜班";
                date = date.AddDays(-1);
                dateString = date.ToString("yyyyMMdd");
                classnum = "B";

                datebgn = DateTime.Now.Date.AddDays(-1).AddHours(20);
                dateend = DateTime.Now.Date.AddHours(8);

            }
            try
            {
                var stopConfig = _context.Query<ItemsEntity>(t => t.F_EnCode == "Mes_StopConfig")
                    .LeftJoin<ItemsDetailEntity>((a, b) => a.F_Id == b.F_ItemId && b.F_EnabledMark == true)
                    .Select((a, b) => b).ToList();

                foreach (var item in stopConfig)
                {
                    switch (item.F_ItemCode)
                    {
                        //质检异常
                        case "0":
                            await this.setEqpPqcCheckResult(day, dateString, shift);
                            //await this.setIsOpenWorkOrderResult(date, classnum, dateString, shift);
                            break;
                        //是否开立工单
                        case "1":
                            await this.setIsOpenWorkOrderResult(date, classnum, dateString, shift);
                            break;
                        //未及时上下料
                        case "2":
                            await this.setIsLoadingCompletedIntime(datebgn, dateend, dateString, shift);
                            break;
                        default:
                            break;
                    }
                }
                obj.state = ResultType.success.ToString();
                obj.message = "设备急停停机任务成功！";
            }
            catch (Exception ex)
            {
                obj.state = ResultType.error.ToString();
                obj.message = "设备急停停机任务失败！";
            }
            return obj;
        }


        private async Task setEqpStopRecord(List<stopResultEntity> list, string stopreason, string solution, string dateString, string shift)
        {
            if (list != null && list.Count > 0)
            {
                foreach (var item in list)
                {
                    var eqpRecord = _context.Query<EqpStopRecordEntity>(t => t.F_EqpId == item.F_EqpId && t.F_StopType == 3).FirstOrDefault();
                    if (eqpRecord != null && eqpRecord.F_Day == dateString && eqpRecord.F_Shift == shift && eqpRecord.F_StopReason != stopreason && eqpRecord.F_IsRecovery == "N")
                        continue;

                    if (((eqpRecord != null && eqpRecord.F_Day == dateString && eqpRecord.F_Shift == shift && (eqpRecord.F_StopReason == stopreason || (eqpRecord.F_StopReason != stopreason && eqpRecord.F_IsRecovery == "Y"))) || (eqpRecord != null && (eqpRecord.F_Day != dateString || eqpRecord.F_Shift != shift))) || eqpRecord == null)
                    {
                        if (item.result == "Y")
                        {
                            if (eqpRecord != null)
                            {
                                if (eqpRecord.F_IsRecovery == "N")
                                {
                                    eqpRecord.F_IsRecovery = "Y";
                                    eqpRecord.F_RealStopEndTime = DateTime.Now;
                                    eqpRecord.F_StopReason = stopreason;
                                    eqpRecord.F_Solution = solution;
                                    _context.Update<EqpStopRecordEntity>(eqpRecord);
                                }
                            }
                        }
                        else
                        {
                            if (eqpRecord != null)
                            {
                                if (eqpRecord.F_IsRecovery == "Y")
                                {
                                    eqpRecord.F_IsRecovery = "N";
                                    eqpRecord.F_StopReason = stopreason;
                                    eqpRecord.F_RealStopStartTime = DateTime.Now;
                                    eqpRecord.F_Solution = "";
                                    _context.Update<EqpStopRecordEntity>(eqpRecord);
                                }
                            }
                            else
                            {
                                EqpStopRecordEntity entity = new EqpStopRecordEntity();
                                entity.F_Id = Utils.CreateNo();
                                entity.F_EqpId = item.F_EqpId;
                                entity.F_EqpName = item.F_EqpName;
                                entity.F_IsRecovery = "N";
                                entity.F_StopType = 3;
                                entity.F_StopReasonType = "4";
                                entity.F_StopReason = stopreason;
                                entity.F_RealStopStartTime = DateTime.Now;
                                entity.F_Day = dateString;
                                entity.F_Shift = shift;
                                _context.Insert<EqpStopRecordEntity>(entity);

                            }
                        }
                    }


                }
            }
        }

        /// <summary>
        /// 日点检结果
        /// </summary>
        /// <param name="day"></param>
        /// <param name="shift"></param>
        /// <returns></returns>
        private async Task setEqpPqcCheckResult(int day, string dateString, string shift)
        {
            var sql = @$"select t.f_id,t.F_EqpName,ISNULL(g.f_id, 'Y') result from (select * from mes_Equipment where F_EqpUse in (2,6,9))t left join 
(select d.f_id, d.F_EqpName, count(1) as count from(select a.f_id, a.F_EqpName, b.F_Shift, c.f_day{day} from 
(select * from mes_Equipment where F_EqpUse in (2, 6, 9))a left join mes_EqpPqcMaster b on
a.f_id = b.F_EqpId and b.F_Shift = '{shift}' left join mes_EqpPqcDetail c on b.F_Id = c.F_PId where c.f_day{day} = 2 or c.f_day{day} is null)d 
GROUP BY d.f_id, d.F_EqpName)g on t.F_Id = g.f_id";

            var data = _context.SqlQuery<stopResultEntity>(sql);
            await this.setEqpStopRecord(data, "未正常完成日点检", "完成日点检", dateString, shift);


        }

        /// <summary>
        /// 是否开立工单
        /// </summary>
        /// <param name="date"></param>
        /// <param name="classnum"></param>
        /// <returns></returns>
        private async Task setIsOpenWorkOrderResult(DateTime date, string classnum, string dateString, string shift)
        {
            if (DateTime.Now.Hour == 8 || DateTime.Now.Hour == 20) return;

            var eqp = _context.Query<EquipmentEntity>(t => t.F_EqpUse == 2 || t.F_EqpUse == 6 || t.F_EqpUse == 9);
            var workplan = _context.Query<WorkPlanEntity>(t => Sql.DiffDays(t.F_Date, date) == 0 && classnum == t.F_ClassNum);

            var query = eqp.LeftJoin<WorkPlanEntity>(workplan, (a, b) => a.F_Id == b.F_EqpId).Select((a, b) => new stopResultEntity
            {
                F_WorkPlanId = b.F_Id,
                F_EqpName = a.F_EqpName,
                F_EqpId = a.F_Id,
                F_WorkPlanType = b.F_WorkPlanType,
                result = "N"
            }).ToList();

            foreach (var item in query)
            {
                if(string.IsNullOrEmpty(item.F_WorkPlanId))
                {
                    item.result = "Y";
                }
                else if (item.F_WorkPlanType == 1)
                {
                    item.result = "Y";
                }
                else if (item.F_WorkPlanType == 0)
                {
                    var work = _context.Query<WorkOrderEntity>(t => t.F_WorkPlanId == item.F_WorkPlanId).Select(t => t.F_Id).FirstOrDefault();
                    if (work != null)
                    {
                        item.result = "Y";
                    }
                }
            }

            await this.setEqpStopRecord(query, "未开立工单", "正常开立工单", dateString, shift);




        }

        /// <summary>
        /// 领料产出任务是否完成
        /// </summary>
        /// <param name="datebgn"></param>
        /// <param name="dateend"></param>
        /// <param name="dateString"></param>
        /// <param name="shift"></param>
        /// <returns></returns>
        public async Task setIsLoadingCompletedIntime(DateTime datebgn, DateTime dateend, string dateString, string shift)
        {
            var eqp = _context.Query<EquipmentEntity>(t => t.F_EqpUse == 2 || t.F_EqpUse == 6 || t.F_EqpUse == 9)
                .Select(t => new stopResultEntity
                {
                    F_EqpName = t.F_EqpName,
                    F_EqpId = t.F_Id,
                    result = "N"
                }).ToList();

            foreach (var item in eqp)
            {
                var job = _context.Query<ControlJobEntity>(t => Sql.DiffSeconds(datebgn, t.F_CreatorTime) > 0 && Sql.DiffSeconds(t.F_CreatorTime, dateend) > 0)
                                     .Where(t => t.F_JobType == 3 || t.F_JobType == 0)
                                     .Where(t => Sql.DiffSeconds(t.F_NeedTime, DateTime.Now) > 0 && t.F_JobState < 2)
                                     .Where(t => t.F_NeedEqpId == item.F_EqpId).Select(t => t.F_Id).FirstOrDefault();
                if (job == null)
                {
                    item.result = "Y";
                }
            }

            await this.setEqpStopRecord(eqp, "领料产出任务未及时完成", "领料产出任务完成", dateString, shift);

        }




    }

    public class stopResultEntity
    {
        public string result { get; set; }
        public string F_EqpId { get; set; }
        public string F_EqpName { get; set; }

        public string F_WorkPlanId { get; set; }

        public int? F_WorkPlanType { get; set; }
    }

}
