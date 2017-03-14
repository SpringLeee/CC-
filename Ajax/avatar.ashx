<%@ WebHandler Language="C#" CodeBehind="avatar.ashx.cs" Class="AvatarHandler" %>
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using BLL;
using Model;

/// <summary>
/// 头像处理程序
/// </summary>
public class AvatarHandler : IHttpHandler,System.Web.SessionState.IRequiresSessionState
{
   
    /// <summary>
    /// 请求处理方法
    /// </summary>
    /// <param name="context">HTTP上下文</param>
    public void ProcessRequest(HttpContext context)
    {
       
      
       
        
        context.Response.ContentType = "text/plain";
        var action = context.Request["action"];
        switch (action)
        {
            case "upload":
                AvatarUpload(context);
                break;
            default:
                break;
        }
    }
    /// <summary>
    /// 头像上传
    /// </summary>
    /// <param name="context">HTTP上下文</param>
    private void AvatarUpload(HttpContext context)
    {
        // 获取上传文件列表
        var files = context.Request.Files;
        // 创建一个结果的结构体以用于给客户端响应;
        Result result = new Result();
        result.avatarUrls = new List<string>();
        result.success = false;
        result.msg = "Failure!";
        
        // 取默认文件
        var sourceFile = files["__source"];
        sourceFile = sourceFile == null ? files[0] : sourceFile;
        if (sourceFile==null)
        {
            // 如果没有拿到文件 直接返回失败JSON
            context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(result));
        }
        // 以源文件的MD5值作为文件名，确保文件名无重复。其他唯一标识也可以, MD5最好
        var fileName = GetMD5(sourceFile.InputStream);
        
        //定义一个变量用以储存当前头像的序号
        int avatarNumber = 1;
        //遍历所有文件域
        foreach (string fieldName in files.AllKeys)
        {
            HttpPostedFile file = files[fieldName];
            // 处理原始图片（默认的 file 域的名称是__source，可在插件配置参数中自定义。参数名：src_field_name）
            // 如果在插件中定义可以上传原始图片的话，可在此处理，否则可以忽略。
            if (fieldName == "__source")
            {
                //文件名，如果是本地或网络图片为原始文件名（不含扩展名）、如果是摄像头拍照则为 *FromWebcam
                //fileName = file.FileName;
                //当前头像基于原图的初始化参数（即只有上传原图时才会发送该数据），用于修改头像时保证界面的视图跟保存头像时一致，提升用户体验度。
                //修改头像时设置默认加载的原图url为当前原图url+该参数即可，可直接附加到原图url中储存，不影响图片呈现。
                //string initParams = context.Request.Form["__initParams"];
                //result.sourceUrl = string.Format("userimg/avatar_{0}.jpg", fileName);
                //file.SaveAs(context.Server.MapPath(result.sourceUrl));
                //result.sourceUrl += initParams;
                /*
                    可在此将 result.sourceUrl 储存到数据库，如果有需要的话。
                */
            }
            //处理头像图片(默认的 file 域的名称：__avatar1,2,3...，可在插件配置参数中自定义，参数名：avatar_field_names)
            else if (fieldName.StartsWith("__avatar"))
            {
                if (avatarNumber==1)
                {
                   
                    string virtualPath = string.Format("/user/{0}.jpg", fileName);
                    result.avatarUrls.Add(virtualPath);
                    file.SaveAs(context.Server.MapPath(virtualPath));

                    
                   
                }
                
                
                /*
                    可在此将 virtualPath 储存到数据库，如果有需要的话。
                */
                avatarNumber++;
            }
            /*
            else
            {
                如下代码在上传接口Upload.aspx中定义了一个user=xxx的参数：
                var swf = new fullAvatarEditor('swf', {
                    id: 'swf',
                    upload_url: 'Upload.aspx?user=xxx'
                });
                在此即可用Request.Form["user"]获取xxx。
            }
            */
        }
       
        result.success = true;
        result.msg = "Success!";
        
        //返回图片的保存结果（返回内容为json字符串，可自行构造，该处建议使用Newtonsoft.Json构造）
        context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(result));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    #region 获取流的MD5值 +static string MD5(this Stream stream)

    /// <summary>
    /// 获取流的MD5值
    /// </summary>
    /// <remarks>
    ///  2013-11-18 18:53 Created By iceStone
    /// </remarks>
    /// <param name="stream">流</param>
    /// <returns>MD5值</returns>
    public static string GetMD5(Stream stream)
    {
        var oMd5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
        var arrbytHashValue = oMd5Hasher.ComputeHash(stream);

        // 由以连字符分隔的十六进制对构成的String，其中每一对表示value 中对应的元素；例如“F-2C-4A”
        string strHashData = BitConverter.ToString(arrbytHashValue);

        // 替换-
        return strHashData.Replace("-", string.Empty).ToLower();
    }
    #endregion
}
/// <summary>
/// 表示图片的上传结果。
/// </summary>
struct Result
{
    /// <summary>
    /// 表示图片是否已上传成功。
    /// </summary>
    public bool success;
    /// <summary>
    /// 自定义的附加消息。
    /// </summary>
    public string msg;
    /// <summary>
    /// 表示原始图片的保存地址。
    /// </summary>
    public string sourceUrl;
    /// <summary>
    /// 表示所有头像图片的保存地址，该变量为一个数组。
    /// </summary>
    public IList<string> avatarUrls;
}