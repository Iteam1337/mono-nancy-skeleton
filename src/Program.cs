namespace Nancy.Demo.Hosting.Self
{
    using System;
    using System.Diagnostics;

    using Nancy.Hosting.Self;

    class Program
    {
        static void Main()
        {
            var host = System.Environment.GetEnvironmentVariable ("HOST") ?? "localhost";
            var port = System.Environment.GetEnvironmentVariable("PORT");
            var uri = new Uri("http://" + host + ":" + port);
            var nancyHost = new NancyHost(uri);
            nancyHost.Start();

            Console.WriteLine("Nancy now listening - " + uri.ToString());

            while (Console.ReadLine () != "quit");
            nancyHost.Stop();
        }
    }
}
