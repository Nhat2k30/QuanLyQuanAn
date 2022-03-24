using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCafe.DTO
{
    public class Account
    {
        public Account(string username, string displayname, int type, string password = null)
        {
            this.Username = username;
            this.Displayname = displayname;
            this.Type = type;
            this.Password = password;
        }

        public Account(DataRow row)
        {
            this.Username = row["username"].ToString();
            this.Displayname = row["displayname"].ToString();
            this.Type = (int)row["type"];
            this.Password = row["password"].ToString();
        }
        private int type;
        public int Type
        {
            get { return type; }
            set { type = value; }
        }
        private string password;
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string displayname;
        public string Displayname
        {
            get { return displayname; }
            set { displayname = value; }
        }

        private string username;

        public string Username
        {
            get { return username; }
            set { username = value; }
        }
    }
}
