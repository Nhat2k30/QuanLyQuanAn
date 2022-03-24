using QuanLyCafe.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCafe.DAO
{
    public class CategoryDAO
    {
        private static CategoryDAO instance;

        public static CategoryDAO Instance
        {
            get { if (instance == null) instance = new CategoryDAO(); return CategoryDAO.instance; }
            private set {CategoryDAO.instance = value;}
        }

        private CategoryDAO() { }

        public List<Category> GetListCtg()
        {
            List<Category> li = new List<Category>();
            string que = "SELECT * FROM dbo.FoodCategory";
            DataTable dt = DataProvider.Instance.ExecuteQuery(que);
            foreach (DataRow item in dt.Rows)
            {
                Category ct = new Category(item);
                li.Add(ct);
            }
            return li;
        }

        public Category GetCategorybyID(int id)
        {
            Category ctg = null;
            string que = "SELECT * FROM FoodCategory where id =" + id;
            DataTable dt = DataProvider.Instance.ExecuteQuery(que);
            foreach (DataRow item in dt.Rows)
            {
                ctg = new Category(item);
                return ctg;
            }
            return ctg;
        }
    }
}
