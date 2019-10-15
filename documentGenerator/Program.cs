using NLua;
using System;
using System.Collections;
using System.IO;
using System.Linq;
using System.Text;

namespace documentGenerator
{
    class Program
    {
        static void Main(string[] args)
        {
            string libFolder = args[0];
            Console.WriteLine($"lib folder: {libFolder}");

            //获取早八时区时间
            DateTime now = DateTime.UtcNow.AddHours(8);
            

            //注册编码模块
            System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);

            string wikiLua = @"# Luat API接口 （2G）
!!!important
	本页面依据Github代码自动更新，最后更新时间：" + now.ToString("yyyy-MM-dd HH:mm:ss") + @"

Luat的API分为三种：第一种直接用Lua语言实现的，在lib目录下，对开发者可见，。第二种是在用C语言实现的，在lod里面，对开发者不可见。这儿称前者为API，后者为扩展API，前两个库为Luat专用。第三种是Lua标准库，也就是Lua语言自带的，Lua语言通用。

";
            var files = GetFiles(libFolder, "lua");
            files = files.OrderBy(p => p).ToArray();//排序
            foreach (var i in files)
            {
                Console.WriteLine(i);
                wikiLua += GetComments(i, "UTF-8")+"\r\n";
            }
            
            //Console.WriteLine(wikiLua);
            File.WriteAllText("luatApi.md", wikiLua + File.ReadAllText("static.md"));

            //////////////////////////////////////////////////////////

            libFolder = args[1];
            Console.WriteLine($"4G lib folder: {libFolder}");
            wikiLua = @"# Luat API接口 （4G）

!!!important
	本页面依据Github代码自动更新，最后更新时间：" + now.ToString("yyyy-MM-dd HH:mm:ss") + @"

Luat的API分为三种：第一种直接用Lua语言实现的，在lib目录下，对开发者可见，。第二种是在用C语言实现的，在blf里面，对开发者不可见。这儿称前者为API，后者为扩展API，前两个库为Luat专用。第三种是Lua标准库，也就是Lua语言自带的，Lua语言通用。

";
            files = GetFiles(libFolder, "lua");
            files = files.OrderBy(p => p).ToArray();//排序
            foreach (var i in files)
            {
                Console.WriteLine(i);
                wikiLua += GetComments(i, "UTF-8") + "\r\n";
            }
            File.WriteAllText("luatApi4G.md", wikiLua + File.ReadAllText("static4G.md"));

            Console.WriteLine("done!");
        }


        /// <summary>
        /// 获取文件夹下所有符合标准的文件
        /// 包括子文件夹
        /// </summary>
        /// <param name="path">路径</param>
        /// <param name="type">拓展名</param>
        /// <returns></returns>
        private static string[] GetFiles(string path,string type)
        {
            ArrayList files = new ArrayList();
            if (!Directory.Exists(path))
            {
                Console.WriteLine($"folder {path} not exist");
                return (string[])files.ToArray(typeof(string));
            }

            foreach(var i in Directory.GetDirectories(path))
            {
                files.AddRange(GetFiles(i, type));
            }
            foreach(var i in Directory.GetFiles(path))
            {
                if(i.LastIndexOf("."+type) == i.Length-type.Length-1)
                    files.Add(i);
            }
            return (string[])files.ToArray(typeof(string));
        }

        private static string GetComments(string path,string encoding)
        {
            var lua = new Lua();
            lua.State.Encoding = Encoding.UTF8;
            lua["result"] = "";
            lua.DoString("lines = {}");
            LuaTable t = (LuaTable)lua["lines"];
            
            int count = 1;
            if(!File.Exists(path))
            {
                Console.WriteLine($"file {path} not exist");
                return "";
            }
            foreach(var i in File.ReadAllLines(path, System.Text.Encoding.GetEncoding(encoding)))
            {
                t[count++] = i;
            }
            lua.DoFile("run.lua");

            return lua["result"].ToString();
        }
    }
}
