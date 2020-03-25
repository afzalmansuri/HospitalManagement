using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class PatientDrugDetail
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int PatientDrugDetailId { get; set; }
        
        public string DrugDescription { get; set; }
        [ForeignKey(nameof(Drug))]
        public int DrugId { get; set; }
        [ForeignKey(nameof(Patient))]
        public int PatientId { get; set; }
        public PatientDrugDetail(string desc,int drugid,int patientid)
        {
            this.DrugDescription = desc;
            this.DrugId = drugid;
            this.PatientId = patientid;
        }

        public PatientDrugDetail()
        {

        }
    }
}
