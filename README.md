<p></p>
<p></p>

----
# EasyMES 

#### 简介
- 请勿用于违反我国法律的web平台、如诈骗等非法平台网站。
- 不包含任何采集程序及接口，使用场景为零部件离散型生产
- 集成钉钉，才能完成钉钉消息推送，请知悉
- 讨论交流QQ群（1065447456）[![](https://pub.idqqimg.com/wpa/images/group.png)](https://jq.qq.com/?_wv=1027&k=51RHQVG)
- 数据库目前有Mysql的脚本，可以转其他的
- 由于历史原因，业务复杂，暂不修改ORM及升级底层版本
- 此产品为商业授权，授权、服务联系作者，作者QQ295228902
- 演示后台地址：http://106.75.169.226:8082/ 账号admin 密码13579
- 演示看板地址：http://106.75.169.226:8082/BoardLogin
- 钉钉邀请![输入图片说明](Image/dingding.png)


#### 框架说明
- MES功能：离散型零部件制造管理系统
- WMS功能：仓储管理系统，含入库、出库、盘点、移库，打印等功能。
- APS：自动排程系统，根据订单自动安排采购计划、交付计划、生产计划。
- 调度系统：协同操作调度系统，每一个节点都会触发通知下一个节点执行人。
- 追溯系统：通过批号、容器等信息追溯制造过程。
- 看板系统: 内置看板自适应模板，已实现轮播，定点投放，已包含工位操作看板、物流指示看板。

![输入图片说明](Image/mes.png.png)
![输入图片说明](Image/%E5%90%8E%E5%8F%B0.png)
![输入图片说明](Image/%E5%B0%8F%E7%A8%8B%E5%BA%8F.png)
![输入图片说明](Image/%E6%8E%A5%E5%8F%A3.png)

#### 整体流程
![输入图片说明](Image/image.png)

#### 生产流程
![输入图片说明](Image/%E7%94%9F%E4%BA%A7.png)

#### APS
![输入图片说明](Image/aps.png)

#### 部署方式
- Web项目和API项目一起部署，不同端口
- Web里设置API地址的跨域
- 设置主程序地址为Web的地址
- 钉钉程序内部设置Api地址，和Web服务器存放的图片地址

#### 捐赠支持

开源项目不易，若此项目能得到你的青睐，可以捐赠支持作者持续开发与维护，感谢所有支持开源的朋友。


![输入图片说明](https://images.gitee.com/uploads/images/2020/0331/144842_7cf04ad6_7353672.jpeg "1585637076201.jpg")          ![输入图片说明](https://images.gitee.com/uploads/images/2020/0331/144852_8b26c8cb_7353672.png "mm_facetoface_collect_qrcode_1585637044089.png")