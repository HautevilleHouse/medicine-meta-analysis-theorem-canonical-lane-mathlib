import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure PatientPopulationModel where
  definition : String
  inclusionCriteria : String
  exclusionCriteria : String
  sampleSize : Nat
  baselineCharacteristics : Prop

structure PatientPopulationEvidence (P : PatientPopulationModel) where
  definitionClosed : P.definition = "Randomized controlled trials"
  inclusionClosed : P.inclusionCriteria = "Adults >= 18 years"
  exclusionClosed : P.exclusionCriteria = "Pregnancy"
  sampleSizeClosed : P.sampleSize > 100
  baselineClosed : P.baselineCharacteristics

structure PatientPopulationClosed (P : PatientPopulationModel) : Prop :=
  definitionClosed : P.definition = "Randomized controlled trials"
  inclusionClosed : P.inclusionCriteria = "Adults >= 18 years"
  exclusionClosed : P.exclusionCriteria = "Pregnancy"
  sampleSizeClosed : P.sampleSize > 100
  baselineClosed : P.baselineCharacteristics

theorem patient_population_closed_from_evidence (P : PatientPopulationModel) (E : PatientPopulationEvidence P) : PatientPopulationClosed P := by
  exact {
    definitionClosed := E.definitionClosed
    inclusionClosed := E.inclusionClosed
    exclusionClosed := E.exclusionClosed
    sampleSizeClosed := E.sampleSizeClosed
    baselineClosed := E.baselineClosed
  }

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse