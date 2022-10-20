﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Chloe.Annotations;

namespace WaterCloud.Domain.ProcessManage
{
    /// <summary>
    /// 创 建：超级管理员
    /// 日 期：2020-12-07 12:14
    /// 描 述：工单明细实体类
    /// </summary>
    [TableAttribute("mes_WorkOrderDetail")]
    public class WorkOrderDetailEntity : IEntity<WorkOrderDetailEntity>,ICreationAudited,IModificationAudited,IDeleteAudited
    {
        /// <summary>
        /// id
        /// </summary>
        /// <returns></returns>
        [Column("F_Id", IsPrimaryKey = true)]
        public string F_Id { get; set; }
        /// <summary>
        /// 工单编号
        /// </summary>
        /// <returns></returns>
        public string F_WorkOrderId { get; set; }
        /// <summary>
        /// 料号Id
        /// </summary>
        /// <returns></returns>
        public string F_MaterialId { get; set; }
        /// <summary>
        /// 计划数量
        /// </summary>
        /// <returns></returns>
        public float? F_PlanNum { get; set; }
        /// <summary>
        /// 完成数量
        /// </summary>
        /// <returns></returns>
        public float? F_DoneNum { get; set; }
        /// <summary>
        /// 不良数量
        /// </summary>
        /// <returns></returns>
        public float? F_BadNum { get; set; }
        /// <summary>
        /// 工单状态
        /// </summary>
        /// <returns></returns>
        public int? F_WorkOrderState { get; set; }
        /// <summary>
        /// 计划开始时间
        /// </summary>
        /// <returns></returns>
        public DateTime? F_PlanStartTime { get; set; }
        /// <summary>
        /// 计划结束时间
        /// </summary>
        /// <returns></returns>
        public DateTime? F_PlanEndTime { get; set; }
        /// <summary>
        /// 开始时间
        /// </summary>
        /// <returns></returns>
        public DateTime? F_RealStartTime { get; set; }
        /// <summary>
        /// 结束时间
        /// </summary>
        /// <returns></returns>
        public DateTime? F_RealEndTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public bool? F_DeleteMark { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public bool? F_EnabledMark { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        /// <returns></returns>
        public string F_Description { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DateTime? F_CreatorTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string F_CreatorUserId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DateTime? F_LastModifyTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string F_LastModifyUserId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DateTime? F_DeleteTime { get; set; }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string F_DeleteUserId { get; set; }
        /// <summary>
        /// 执行顺序
        /// </summary>
        /// <returns></returns>
        public int? F_RunSort { get; set; }
        [NotMapped]
        public float? F_SonNum { get; set; }
        [NotMapped]
        public string F_SonMaterialId { get; set; }
        [NotMapped]
        public string F_ProcessId { get; set; }
        [NotMapped]
        public string F_ProcessName { get; set; }
        [NotMapped]
        public string F_WorkOrderCode { get; set; }
    }
}
