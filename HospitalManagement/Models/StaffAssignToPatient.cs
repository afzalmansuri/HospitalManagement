using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace HospitalManagement.Models
{
    public class StaffAssignToPatient
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int PatientsDoctorId { get; set; }

        [ForeignKey(nameof(Patient))]


        public int PatientId { get; set; }
        
        [ForeignKey(nameof(Doctor))]

        public int Doctorid { get; set; }

        [ForeignKey(nameof(HealthCareAssistant))]

        public int HealthCareAssistantId { get; set; }
        public  StaffAssignToPatient(int patientid,int doctorid,int healthcareassitantid)
        {
            this.PatientId = patientid;
            this.Doctorid = doctorid;
            this.HealthCareAssistantId = healthcareassitantid;
        }
        public  StaffAssignToPatient()
        {
        }
    }
}
