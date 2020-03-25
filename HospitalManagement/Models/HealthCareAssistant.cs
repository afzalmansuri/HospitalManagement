using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class HealthCareAssistant
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int HealthCareAssistantId { get; set; }
        public string HealtCareAssistantName { get; set; }
        public string HealtCareAssistantPhoneNumber { get; set; }

        [ForeignKey(nameof(Department))]
        public int DepartmentId { get; set; }
        public HealthCareAssistant(string name,string phonenumber,int id)
        {
            this.HealtCareAssistantName = name;
            this.HealtCareAssistantPhoneNumber = phonenumber;
            this.DepartmentId = id;


        }
        public HealthCareAssistant()
        {

        }
    }
}
