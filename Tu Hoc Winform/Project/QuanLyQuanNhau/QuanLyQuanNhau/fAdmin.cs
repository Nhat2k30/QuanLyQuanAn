using QuanLyCafe.DAO;
using QuanLyCafe.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyCafe
{
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();
            
        }

        private void fAdmin_Load(object sender, EventArgs e)
        {
            LoadListFood();
            AddFoodBinding();
            LoadCategoryCombobox(comboBox1);
        }
        void LoadBill(DateTime checkin, DateTime checkout)
        {
            dtgvBill.DataSource = BillDAO.Instance.GetListBill(checkin, checkout);
        }
        private void btnViewBill_Click(object sender, EventArgs e)
        {
            LoadBill(dtpkFromDate.Value, dtpkToDate.Value);
        }

        void LoadListFood()
        {
            dtgvFood.DataSource = FoodDAO.Instance.GetListFood();
        }
        private void btnShowFood_Click(object sender, EventArgs e)
        {
            LoadListFood();
        }

        void LoadBillInfo()
        {
            dtgvBillinfo.DataSource = BillInfoDAO.Instance.GetListBillInfo();
        }

        void AddFoodBinding()
        {
            txbFoodName.DataBindings.Add(new Binding("Text", dtgvFood.DataSource, "Name"));
            txbFoodID.DataBindings.Add(new Binding("Text", dtgvFood.DataSource, "Id"));
            nmFoodPrice.DataBindings.Add(new Binding("Value", dtgvFood.DataSource, "Price"));
        }

        void LoadCategoryCombobox(ComboBox cb)
        {
            cb.DataSource = CategoryDAO.Instance.GetListCtg();
            cb.DisplayMember = "Name";
        }

        private void dtgvBill_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnAddFood_Click(object sender, EventArgs e)
        {
            string name = txbFoodName.Text;
            int categoryid = (comboBox1.SelectedItem as Category).Id;
            float price = (float)nmFoodPrice.Value;

            if (FoodDAO.Instance.InsertFood(name, categoryid, price))
            {
                MessageBox.Show("Them mon thanh cong!");
                LoadListFood();
            }
            else
            {
                MessageBox.Show("Co loi khi them mon!");
            }
        }

        private void txbFoodID_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (dtgvFood.SelectedCells.Count > 0)
                {
                    int id = (int)dtgvFood.SelectedCells[0].OwningRow.Cells["IDCategory"].Value;

                    Category ctg = CategoryDAO.Instance.GetCategorybyID(id);
                    comboBox1.SelectedItem = ctg;
                    int index = -1;
                    int i = 0;
                    foreach (Category item in comboBox1.Items)
                    {
                        if (item.Id == ctg.Id)
                        {
                            index = i;
                            break;
                        }
                        i++;
                    }

                    comboBox1.SelectedIndex = index;
                }
            }
            catch { }
        }

        private void btnEditFood_Click(object sender, EventArgs e)
        {
            string name = txbFoodName.Text;
            int categoryid = (comboBox1.SelectedItem as Category).Id;
            float price = (float)nmFoodPrice.Value;
            int id = Convert.ToInt32(txbFoodID.Text);

            if (FoodDAO.Instance.UpdateFood(id, name, categoryid, price))
            {
                MessageBox.Show("Sua mon thanh cong!");
                LoadListFood();
            }
            else
            {
                MessageBox.Show("Co loi khi sua mon!");
            }
        }

        private void btnDeleteFood_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txbFoodID.Text);

            if (FoodDAO.Instance.DeleteFood(id))
            {
                MessageBox.Show("Xoa mon thanh cong!");
                LoadListFood();
            }
            else
            {
                MessageBox.Show("Co loi khi xoa mon!");
            }
        }

        private void btnSearchFood_Click(object sender, EventArgs e)
        {
            dtgvFood.DataSource = SearchFoodByName(textBox1.Text);
        }

        List<Food> SearchFoodByName(string name)
        {
            List<Food> listFood = FoodDAO.Instance.SearchFoodByName(name);
            return listFood;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //string que = string.Format("delete from BillInfo");
            //DataTable dt = DataProvider.Instance.ExecuteQuery(que);
            //LoadBillInfo();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            LoadBillInfo();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            //string que = string.Format("delete from Bill");
            //DataTable dt = DataProvider.Instance.ExecuteQuery(que);
            //LoadBill(dtpkFromDate.Value, dtpkToDate.Value);
        }
    }
}
