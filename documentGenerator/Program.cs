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
            string libFolder = @"D:\Luat_Air202\script_LuaTask\lib";//args[0];
            Console.WriteLine($"lib folder: {libFolder}");

            //注册编码模块
            System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);

            string wikiLua = @"# Luat API接口

Luat的API分为三种：第一种直接用Lua语言实现的，在lib目录下，对开发者可见，。第二种是在用C语言实现的，在lod里面，对开发者不可见。这儿称前者为API，后者为扩展API，前两个库为Luat专用。第三种是Lua标准库，也就是Lua语言自带的，Lua语言通用。

";

            foreach (var i in GetFiles(libFolder, "lua"))
            {
                wikiLua += GetComments(i, "UTF-8")+"\r\n";
            }
            
            Console.WriteLine(wikiLua);
            File.WriteAllText("luatApi.md", wikiLua + File.ReadAllText("static.md"));

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
