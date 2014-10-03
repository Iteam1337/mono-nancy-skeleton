namespace Nancy.Demo.Hosting.Self
{
    using System;
    using System.Diagnostics;

    using Nancy.Hosting.Self;

    class Program
    {
        static void Main()
        {
            var port = System.Environment.GetEnvironmentVariable("PORT");
            var uri = new Uri("http://0.0.0.0:" + port);
            var nancyHost = new NancyHost(uri);
            nancyHost.Start();

            Console.WriteLine("Nancy now listening - " + uri.ToString());

            var line = Console.ReadLine();
            while(line != "quit") {
              line = Console.ReadLine();
            }
        }
    }
}
