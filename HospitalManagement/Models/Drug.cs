using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class Drug
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int DrugId { get; set; }
        public string DrugName { get; set; }
        public string DrugDescription { get; set; }


        public Drug(string name,string desc)
        {
            this.DrugName = name;
            this.DrugDescription = desc;
        }
        public Drug()
        {

        }
    }
}
