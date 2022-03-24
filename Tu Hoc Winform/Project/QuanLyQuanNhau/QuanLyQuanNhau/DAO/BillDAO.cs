using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCafe.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;

        public static BillDAO Instance 
        { get { if (instance == null) instance = new BillDAO(); return BillDAO.instance; }
          private set { BillDAO.instance = value; }
        }

        private BillDAO() { }
        /// <summary>
        /// thành công => bill ID
        /// thất bại : -1
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int GetBillIDByTableID(int id)
        {
            DataTable dt = DataProvider.Instance.ExecuteQuery("select * from Bill where idTable = "+ id +" and status = 0");
            if (dt.Rows.Count > 0)
            {
                Bill b = new Bill(dt.Rows[0]);
                return b.ID;
            }
            return -1;
        }

        public void InsertBill(int id)
        {
            DataProvider.Instance.ExecuteNonQuery("exec USP_InsertBill @idtable", new object[]{id});
        }

        public int MaxBill()
        {
            try
            {
                return (int)DataProvider.Instance.ExecuteScalar("SELECT MAX(id) FROM Bill");
            }
            catch
            {
                return 1;
            }
        }

        public void CheckOut(int id, int totalPrice)
        {
            string qry = "update Bill set DateCheckOut = GETDATE(), status = 1," + "totalprice = " + totalPrice + " where id = " + id ;
            DataProvider.Instance.ExecuteNonQuery(qry);
        }

        public DataTable GetListBill(DateTime checkin, DateTime checkout)
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListBill @checkin , @checkout", new object[] { checkin, checkout });
        }

        //public DataTable GetListBillAndPage(DateTime checkin, DateTime checkout, int pageNum)
        //{
        //    return DataProvider.Instance.ExecuteQuery("exec USP_GetListBillAndPage @checkin , @checkout , @page", new object[] { checkin, checkout, pageNu });
        //}
    }
}
