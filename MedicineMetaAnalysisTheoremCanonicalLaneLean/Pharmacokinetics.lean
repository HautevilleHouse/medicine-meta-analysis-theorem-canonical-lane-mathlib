import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure PharmacokineticModel where
  absorptionRate : Type u
  eliminationRate : Type v
  volumeDistribution : Type w
  bioavailability : Prop
  linearKinetics : Prop

structure PharmacokineticEvidence (P : PharmacokineticModel) where
  bioavailabilityClosed : P.bioavailability
  linearKineticsClosed : P.linearKinetics

def PharmacokineticClosed (P : PharmacokineticModel) : Prop :=
  P.bioavailability ∧ P.linearKinetics

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticModel)
    (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.bioavailabilityClosed E.linearKineticsClosed

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse