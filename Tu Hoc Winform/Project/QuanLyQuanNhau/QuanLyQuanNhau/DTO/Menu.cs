using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCafe.DTO
{
    public class Menu
    {
        public Menu(string foodname, int count, float price, float totalprice)
        {
            this.Foodname = foodname;
            this.Count = count;
            this.Price = price;
            this.Totalprice = totalprice;
        }

        public Menu(DataRow row)
        {
            this.Foodname = row["name"].ToString();
            this.Count = (int)row["count"];
            this.Price = (float)Convert.ToDouble(row["price"].ToString());
            this.Totalprice = (float)Convert.ToDouble(row["totalprice"].ToString());
        }

        private string foodname;
        private int count;
        private float price;
        private float totalprice;
        private DataRow item;

        public string Foodname { get => foodname; set => foodname = value; }
        public int Count { get => count; set => count = value; }
        public float Price { get => price; set => price = value; }
        public float Totalprice { get => totalprice; set => totalprice = value; }
    }
}
