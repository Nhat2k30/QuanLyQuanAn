using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCafe.DTO
{
    public class BillInfo
    {
        public BillInfo(int id, int idbill, int idfood, int food)
        {
            this.ID = id;
            this.Idbill = idbill;
            this.Idfood = idfood;
            this.Count = count;
        }
        public BillInfo(DataRow row)
        {
            this.ID = (int)row["id"];
            this.Idbill = (int)row["idbill"];
            this.Idfood = (int)row["idfood"];
            this.Count = (int)row["count"];
        }
        private int iD;
        private int idbill;
        private int idfood;
        private int count;

        public int ID { get => iD; set => iD = value; }
        public int Idbill { get => idbill; set => idbill = value; }
        public int Idfood { get => idfood; set => idfood = value; }
        public int Count { get => count; set => count = value; }
    }
}
