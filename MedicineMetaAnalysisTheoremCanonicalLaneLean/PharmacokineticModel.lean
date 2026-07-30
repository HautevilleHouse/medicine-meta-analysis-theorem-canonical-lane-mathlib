import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  absorptionRate : Prop
  eliminationRate : Prop
  volumeOfDistribution : Prop
  clearance : Prop
  halfLife : Prop
  areaUnderCurve : Prop

structure CompartmentModelEvidence (C : CompartmentModel) where
  absorptionRateClosed : C.absorptionRate
  eliminationRateClosed : C.eliminationRate
  volumeOfDistributionClosed : C.volumeOfDistribution
  clearanceClosed : C.clearance
  halfLifeClosed : C.halfLife
  areaUnderCurveClosed : C.areaUnderCurve

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.absorptionRate ∧ C.eliminationRate ∧ C.volumeOfDistribution ∧ C.clearance ∧ C.halfLife ∧ C.areaUnderCurve

theorem compartment_model_closed_from_evidence (C : CompartmentModel) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.eliminationRateClosed
      (And.intro E.volumeOfDistributionClosed
        (And.intro E.clearanceClosed
          (And.intro E.halfLifeClosed E.areaUnderCurveClosed))))

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse