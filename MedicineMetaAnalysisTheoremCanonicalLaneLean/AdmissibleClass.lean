import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  WitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse
