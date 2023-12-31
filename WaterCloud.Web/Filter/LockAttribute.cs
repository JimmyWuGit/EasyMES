using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using WaterCloud.Code;

namespace WaterCloud.Web
{
	/// <summary>
	/// 防重复提交
	/// </summary>
	public class LockAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// 拦截
        /// </summary>
        /// <param name="context"></param>
        /// <param name="next"></param>
        /// <returns></returns>
        public override async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            Stopwatch sw = new Stopwatch();
            sw.Start();
            if (OperatorProvider.Provider.GetCurrent() == null)
            {
                context.Result = new JsonResult(new AlwaysResult { state = ResultType.error.ToString(), message = "抱歉，没有操作权限" });
                return;
            }
            else
            {
                string token = context.HttpContext.Request.Headers[GlobalContext.SystemConfig.TokenName].ParseToString();
                if (string.IsNullOrWhiteSpace(token))
                {
                    context.Result = new JsonResult(new AlwaysResult { state = ResultType.error.ToString(), message = "toekn不能空" });
                    return;
                }
                //固定加锁2秒
                bool result = CacheHelper.SetNx(token, token, 2).GetAwaiter().GetResult();
                if (!result)
                {
                    context.Result = new JsonResult(new AlwaysResult { state = ResultType.error.ToString(), message = "请求太频繁，请稍后" });
                    return;
                }
            }
            var resultContext = await next();

            sw.Stop();

        }
    }
}
