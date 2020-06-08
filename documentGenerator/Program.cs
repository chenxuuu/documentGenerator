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
            if(args[0] == "vscode")
            {
                Console.WriteLine("start vscode plugin json");
                File.WriteAllText("lua.json", vscodeMaker(File.ReadAllText(args[1])));
                return;
            }

            if (args[0] == "moon")
            {
                Console.WriteLine("start vscode plugin json moon");
                File.WriteAllText("moon.json", vscodeMaker(File.ReadAllText(args[1]),"moon.lua"));
                return;
            }

            string libFolder2g = null;
            string libFolder4g = null;
            switch (args[0].ToUpper())
            {
                case "2G":
                    libFolder2g = args[1];
                    break;
                case "4G":
                    libFolder4g = args[1];
                    break;
                default:
                    libFolder2g = args[0];
                    libFolder4g = args[1];
                    break;
            }
            //获取早八时区时间
            DateTime now = DateTime.UtcNow.AddHours(8);

            if (libFolder2g != null)
            {
                Console.WriteLine($"lib folder: {libFolder2g}");



                //注册编码模块
                System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);

                string wikiLua = @"# Luat API接口 （2G）

!!!important
	本页面依据[Github代码](https://github.com/openLuat/Luat_2G_RDA_8955)自动更新，最后更新时间：[" + now.ToString("yyyy-MM-dd HH:mm:ss") + @"](https://ci.appveyor.com/project/chenxuuu/luat-2g-rda-8955)

Luat的API分为三种：第一种直接用Lua语言实现的，在lib目录下，对开发者可见，。第二种是在用C语言实现的，在lod里面，对开发者不可见。这儿称前者为API，后者为扩展API，前两个库为Luat专用。第三种是Lua标准库，也就是Lua语言自带的，Lua语言通用。

";
                var files = GetFiles(libFolder2g, "lua");
                files = files.OrderBy(p => p).ToArray();//排序
                foreach (var i in files)
                {
                    Console.WriteLine(i);
                    wikiLua += GetComments(i, "UTF-8") + "\r\n";
                }

                //Console.WriteLine(wikiLua);
                File.WriteAllText("luatApi.md", wikiLua + File.ReadAllText("static.md"));
            }


            //////////////////////////////////////////////////////////

            if (libFolder4g != null)
            {
                Console.WriteLine($"4G lib folder: {libFolder4g}");
                string wikiLua = @"# Luat API接口 （4G）

!!!important
	本页面接口为CAT4模块（Air720x/Air720Sx）接口文档。本页面依据[Github代码](https://github.com/openLuat/Luat_4G_ASR_1802)自动更新，最后更新时间：[" + now.ToString("yyyy-MM-dd HH:mm:ss") + @"](https://ci.appveyor.com/project/chenxuuu/luat-4g-asr-1802)

Luat的API分为三种：第一种直接用Lua语言实现的，在lib目录下，对开发者可见，。第二种是在用C语言实现的，在blf里面，对开发者不可见。这儿称前者为API，后者为扩展API，前两个库为Luat专用。第三种是Lua标准库，也就是Lua语言自带的，Lua语言通用。

";
                var files = GetFiles(libFolder4g, "lua");
                files = files.OrderBy(p => p).ToArray();//排序
                foreach (var i in files)
                {
                    Console.WriteLine(i);
                    wikiLua += GetComments(i, "UTF-8") + "\r\n";
                }
                File.WriteAllText("luatApi4G.md", wikiLua + File.ReadAllText("static4G.md"));
            }


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

        /// <summary>
        /// 获取注释生成文档
        /// </summary>
        /// <param name="path"></param>
        /// <param name="encoding"></param>
        /// <returns></returns>
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


        /// <summary>
        /// 获取文档生成插件所需的json
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        private static string vscodeMaker(string text, string file = "vscode.lua")
        {
            var lua = new Lua();
            lua.State.Encoding = Encoding.UTF8;
            lua["result"] = "";
            lua["text"] = text;
            lua.DoFile(file);

            return lua["result"].ToString();
        }
    }
}
