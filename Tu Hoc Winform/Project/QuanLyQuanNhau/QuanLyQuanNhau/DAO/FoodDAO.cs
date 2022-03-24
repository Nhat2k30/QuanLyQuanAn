using QuanLyCafe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCafe.DAO
{
    public class FoodDAO
    {
        public static FoodDAO instance;
        public static FoodDAO Instance
        {
            get { if (instance == null) instance = new FoodDAO(); return FoodDAO.instance; }
            private set { FoodDAO.instance = value; }
        }

        private FoodDAO() { }

        public List<Food> GetListFood(int id)
        {
            List<Food> li = new List<Food>();
            string que = "SELECT * FROM dbo.Food WHERE idCategory = " + id;
            DataTable dt = DataProvider.Instance.ExecuteQuery(que);
            foreach (DataRow item in dt.Rows)
            {
                Food f = new Food(item);
                li.Add(f);
            }
            return li;
        }

        public List<Food> GetListFood()
        {
            List<Food> li = new List<Food>();
            string que = "SELECT * FROM dbo.Food";
            DataTable dt = DataProvider.Instance.ExecuteQuery(que);
            foreach (DataRow item in dt.Rows)
            {
                Food f = new Food(item);
                li.Add(f);
            }
            return li;
        }

        public bool InsertFood(string name, int id, float price)
        {
            string query = string.Format("insert Food(name, idCategory, price) values(N'{0}', {1}, {2})", name, id, price);
            int kq = DataProvider.Instance.ExecuteNonQuery(query);
            return kq > 0;
        }

        public bool UpdateFood(int idFood, string name, int id, float price)
        {
            string query = string.Format("update Food set name = N'{0}', idCategory = {1}, price = {2} where id = {3}", name, id, price, idFood);
            int kq = DataProvider.Instance.ExecuteNonQuery(query);
            return kq > 0;
        }

        public bool DeleteFood(int idFood)
        {
            BillInfoDAO.Instance.DeleteBillInfoByFoodID(idFood);
            string query = string.Format("delete Food where id = {0}", idFood);
            int kq = DataProvider.Instance.ExecuteNonQuery(query);
            return kq > 0;
        }

        public List<Food> SearchFoodByName(string name)
        {
            List<Food> li = new List<Food>();
            string que = string.Format("SELECT * FROM Food where name like N'%{0}%'", name);
            DataTable dt = DataProvider.Instance.ExecuteQuery(que);
            foreach (DataRow item in dt.Rows)
            {
                Food f = new Food(item);
                li.Add(f);
            }
            return li;
        }
    }
}
