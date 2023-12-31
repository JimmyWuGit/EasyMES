﻿/*******************************************************************************
 * Copyright © 2020 WaterCloud.Framework 版权所有
 * Author: WaterCloud
 * Description: WaterCloud快速开发平台
 * Website：
*********************************************************************************/
using Chloe.Annotations;
using System;
using System.ComponentModel.DataAnnotations;

namespace WaterCloud.Domain.SystemOrganize
{
    [TableAttribute("sys_User")]
    public class UserEntity : IEntity<UserEntity>, ICreationAudited, IDeleteAudited, IModificationAudited
    {
        [ColumnAttribute("F_Id", IsPrimaryKey = true)]
        public string F_Id { get; set; }
        [Required(ErrorMessage = "账户不能为空")]
        public string F_Account { get; set; }
        [Required(ErrorMessage = "姓名不能为空")]
        public string F_RealName { get; set; }
        public string F_NickName { get; set; }
        public string F_HeadIcon { get; set; }
        [Required(ErrorMessage = "性别不能为空")]
        public bool? F_Gender { get; set; }
        public DateTime? F_Birthday { get; set; }
        public string F_MobilePhone { get; set; }
        public string F_Email { get; set; }
        public string F_WeChat { get; set; }
        public string F_ManagerId { get; set; }
        public int? F_SecurityLevel { get; set; }
        public string F_Signature { get; set; }
        [Required(ErrorMessage = "公司不能为空")]
        public string F_OrganizeId { get; set; }
        [Required(ErrorMessage = "部门不能为空")]
        public string F_DepartmentId { get; set; }
        [Required(ErrorMessage = "角色不能为空")]
        public string F_RoleId { get; set; }
        [Required(ErrorMessage = "职位不能为空")]
        public string F_DutyId { get; set; }
        public bool? F_IsAdmin { get; set; }
        public bool? F_IsBoss { get; set; }
        public bool? F_IsSenior { get; set; }
        public bool? F_IsLeaderInDepts { get; set; }
        public int? F_SortCode { get; set; }
        public bool? F_DeleteMark { get; set; }
        public bool? F_EnabledMark { get; set; }
        public string F_Description { get; set; }
        public DateTime? F_CreatorTime { get; set; }
        public string F_CreatorUserId { get; set; }
        public DateTime? F_LastModifyTime { get; set; }
        public string F_LastModifyUserId { get; set; }
        public DateTime? F_DeleteTime { get; set; }
        public string F_DeleteUserId { get; set; }
        // 拓展字段，2019-03-03
        public string F_DingTalkOpenId { get; set; }
        public string F_DingTalkNick { get; set; }
        public string F_DingTalkUnionId { get; set; }
        public string F_WxOpenId { get; set; }
        public string F_WxNickName { get; set; }
        public string F_HeadImgUrl { get; set; }
        public bool? F_IsPlanMan { get; set; }
        [NotMapped]
        //多选显示字段
        public string F_DepartmentName { get; set; }
        [NotMapped]
        //多选显示字段
        public string F_RoleName { get; set; }
        [NotMapped]
        //tablecheck字段
        public bool LAY_CHECKED { get; set; }
        [NotMapped]
        //tablecheck字段
        public int MsgCout { get; set; }
        /// <summary>
        /// 打印端口
        /// </summary>
        public string F_WebSocketPort { get; set; }
        
    }
}
