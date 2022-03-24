using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCafe.DAO
{
    public class Bill
    {
        public Bill(int id, DateTime? dateCheckin, DateTime? dateCheckout, int status, int totalPrice = 0)
        {
            this.ID  = id;
            this.Datecheckin = dateCheckin;
            this.Datecheckout = dateCheckout;
            this.Status = status;
            this.TotalPrice = totalPrice;
        }

        public Bill(DataRow row)
        {
            this.ID = (int)row["id"];
            this.Datecheckin = (DateTime?)row["dateCheckin"];

            var datacheck = row["dateCheckout"];
            if (datacheck.ToString() != "")
            {
                this.Datecheckout = (DateTime?)datacheck;
            }
            this.Status = (int)row["status"];
            this.TotalPrice = (int)row["totalPrice"];
        }

        private DateTime? datecheckin;
        private DateTime? datecheckout;
        private int status;
        private int iD;
        private int totalPrice;

        public int ID { get => iD; set => iD = value; }
        public DateTime? Datecheckin { get => datecheckin; set => datecheckin = value; }
        public DateTime? Datecheckout { get => datecheckout; set => datecheckout = value; }
        public int Status { get => status; set => status = value; }
        public int TotalPrice { get => totalPrice; set => totalPrice = value; }
    }
}
