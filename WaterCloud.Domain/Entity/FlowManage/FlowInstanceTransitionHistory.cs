﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a CodeSmith Template.
//
//     DO NOT MODIFY contents of this file. Changes to this
//     file will be lost if the code is regenerated.
//     Author:Yubao Li
// </autogenerated>
//------------------------------------------------------------------------------
using System;
using Chloe.Annotations;

namespace WaterCloud.Domain.FlowManage
{
    /// <summary>
	/// 工作流实例流转历史记录
	/// </summary>
      [Table("oms_FlowinstanceHis")]
    public class FlowInstanceTransitionHistory
    {
        /// <summary>
        /// 主键Id
        /// </summary>
        /// <returns></returns>
        [ColumnAttribute("F_Id", IsPrimaryKey = true)]
        public string F_Id { get; set; }
        /// <summary>
        /// 实例Id
        /// </summary>
        public string F_InstanceId { get; set; }
        /// <summary>
	    /// 开始节点Id
	    /// </summary>
        public string F_FromNodeId { get; set; }
        /// <summary>
	    /// 开始节点类型
	    /// </summary>
        public int? F_FromNodeType { get; set; }
        /// <summary>
	    /// 开始节点名称
	    /// </summary>
        public string F_FromNodeName { get; set; }
        /// <summary>
	    /// 结束节点Id
	    /// </summary>
        public string F_ToNodeId { get; set; }
        /// <summary>
	    /// 结束节点类型
	    /// </summary>
        public int? F_ToNodeType { get; set; }
        /// <summary>
	    /// 结束节点名称
	    /// </summary>
        public string F_ToNodeName { get; set; }
        /// <summary>
	    /// 转化状态
	    /// </summary>
        public bool F_TransitionSate { get; set; }
        /// <summary>
	    /// 是否结束
	    /// </summary>
        public bool F_IsFinish { get; set; }
        /// <summary>
	    /// 转化时间
	    /// </summary>
        public DateTime? F_CreatorTime { get; set; }
        /// <summary>
        /// 创建用户主键
        /// </summary>
        public string F_CreatorUserId { get; set; }
        /// <summary>
        /// 创建用户
        /// </summary>
        public string F_CreatorUserName { get; set; }

    }
}