using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Net;
using Newtonsoft.Json;
using System.Net.Http;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            if (!this.DesignMode)
            {
                RefreshLabel();
            }
        }

        private async void RefreshLabel()
        {
            await Task.Run(async () => {
                while (true)
                {
                    try
                    {
                        using (HttpClient client = new HttpClient())
                        {
                            var response = await client.GetAsync("http://127.0.0.1:5000");
                            if (response != null)
                            {
                                var jsonString = await response.Content.ReadAsStringAsync();
                                dynamic xd = JsonConvert.DeserializeObject<object>(jsonString);
                                foreach (var x in xd)
                                {
                                    ChangeLabelText(x[3].ToString());
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex);
                    }

                    Thread.Sleep(750); // time to sleep thread
                }
            });
        }

        public void ChangeLabelText(string value)
        {
            label1.Invoke((MethodInvoker)(() => label1.Text = value));
        }
    }
}
