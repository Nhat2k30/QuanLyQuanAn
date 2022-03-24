using QuanLyCafe.DAO;
using QuanLyCafe.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Globalization;
using System.Threading;

namespace QuanLyCafe
{
    public partial class fTableManager : Form
    {
        private Account logi;

        public Account Logi
        {
            get { return logi; }
            set { logi = value; ChangeAcc(logi.Type); }
        }
        public fTableManager(Account acc)
        {
            InitializeComponent();
            this.Logi = acc;
            LoadTabel();
            LoadCtg();
            //LoadCBTable(cbSwitchTabe);
        }

        void ChangeAcc(int type)
        {
            adminToolStripMenuItem.Enabled = type == 1;
        }
        void LoadCtg()
        {
            List<Category> lictg = CategoryDAO.Instance.GetListCtg();
            cbCategory.DataSource = lictg;
            cbCategory.DisplayMember = "name";
        }

        void LoadFoodList(int id)
        {
            List<Food> lif = FoodDAO.Instance.GetListFood(id);
            cbFood.DataSource = lif;
            cbFood.DisplayMember = "name";
        }


        void LoadTabel()
        {
            flpTable.Controls.Clear();
            List<Table> tableList =  TableDAO.Instance.LoadTableList();

            foreach (Table item in tableList)
            {
                Button btn = new Button() { Width = TableDAO.TableWidth, Height = TableDAO.TableHeigth};
                btn.Text = item.Name + Environment.NewLine + item.Status;
                btn.Click += btn_Click;
                btn.Tag = item;

                switch (item.Status)
                {
                    case "Trống":
                        btn.BackColor = Color.Aqua;
                        break;
                    default:
                        btn.BackColor = Color.Red;
                        break;
                }
                flpTable.Controls.Add(btn);
            }
        }

        void ShowBill(int id)
        {
            listViewBill.Items.Clear();
            List<QuanLyCafe.DTO.Menu> lbinfo = MenuDAO.Instance.GetListMenuByTable(id);
            float totalPrice = 0;
            foreach (QuanLyCafe.DTO.Menu item in lbinfo)
            {
                ListViewItem lsvItem = new ListViewItem(item.Foodname.ToString());
                lsvItem.SubItems.Add(item.Count.ToString());
                lsvItem.SubItems.Add(item.Price.ToString());
                lsvItem.SubItems.Add(item.Totalprice.ToString());
                totalPrice += item.Totalprice;
                listViewBill.Items.Add(lsvItem);
            }
            CultureInfo culture = new CultureInfo("vi-VN");
            //Thread.CurrentThread.CurrentCulture = culture;
            textBox1.Text = totalPrice.ToString("c", culture);

        }

        private void btn_Click(object sender, EventArgs e)
        {
            int tableID = ((sender as Button).Tag as Table).ID;
            listViewBill.Tag = (sender as Button).Tag;
            ShowBill(tableID);
        }

        private void dangXuatToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //this.Close();
        }

        private void thongTinTaiKhoanToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void thongTinCaNhanToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //fAccountProfile fa = new fAccountProfile();
            //fa.ShowDialog();
        }

        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fAdmin a = new fAdmin();
            a.ShowDialog();
        }

        private void fTableManager_Load(object sender, EventArgs e)
        {

        }

        private void buttonAddFood_Click(object sender, EventArgs e)
        {
            Table tb = listViewBill.Tag as Table;
            int idbill = BillDAO.Instance.GetBillIDByTableID(tb.ID);
            int foodid = (cbFood.SelectedItem as Food).Id;
            int count = (int)numeFoodCount.Value;
            if (idbill == -1)
            {
                BillDAO.Instance.InsertBill(tb.ID);
                BillInfoDAO.Instance.InsertBillinfo(BillDAO.Instance.MaxBill(), foodid, count);
            }
            else
            {
                BillInfoDAO.Instance.InsertBillinfo(idbill, foodid, count);
            }

            ShowBill(tb.ID);
            LoadTabel();
        }

        private void cbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = 0;
            ComboBox cb = sender as ComboBox;
            if (cb.SelectedItem == null)
                return;
            Category se = cb.SelectedItem as Category;
            id = se.Id;
            LoadFoodList(id);
        }

        private void buttonCheckOut_Click(object sender, EventArgs e)
        {
            Table t = listViewBill.Tag as Table;
            int idbi = BillDAO.Instance.GetBillIDByTableID(t.ID);
            int totalprice = (int)numericUpDown1.Value;

            double ttp = Convert.ToDouble(textBox1.Text.Split(',')[0]);
            double final = ttp - (ttp / 100) * totalprice;

            if (idbi != -1)
            {
                if(MessageBox.Show(string.Format("Bạn muốn thanh toán hóa đơn cho {0}\nTong Tien - ((Tong Tien/100) x Giam Gia) => {1} - (({1}/100) x {2}) = {3}" , t.Name, ttp, totalprice, final), "Thông Báo", MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.Yes )
                {
                    BillDAO.Instance.CheckOut(idbi, totalprice);
                    ShowBill(t.ID);
                    LoadTabel();
                }
            }
        }

        private void buttonSwitchTable_Click(object sender, EventArgs e)
        {
            //int id1 = (listViewBill.Tag as Table).ID;
            //int id2 = (cbSwitchTabe.SelectedItem as Table).ID;
            //if (MessageBox.Show(string.Format("Bạn muốn chuyển bàn {0} qua bàn {1} à", (listViewBill.Tag as Table).Name, (cbSwitchTabe.SelectedItem as Table).Name), "Thông báo", MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.OK)
            //{
             //   TableDAO.Instance.SwitchTable(id1, id2);
              //  LoadTabel();
           // }    
        }

        private void cbSwitchTabe_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void LoadCBTable(ComboBox cb)
        {
            cb.DataSource = TableDAO.Instance.LoadTableList();
            cb.DisplayMember = "Name";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
