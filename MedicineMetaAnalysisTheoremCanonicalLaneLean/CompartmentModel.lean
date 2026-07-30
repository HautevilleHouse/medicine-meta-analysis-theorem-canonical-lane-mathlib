import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  transferRates : Type
  initialConcentrations : Type
  solutionFamily : Prop
  identificationCondition : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  solutionFamilyClosed : C.solutionFamily
  identificationConditionClosed : C.identificationCondition

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.solutionFamily ∧ C.identificationCondition

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.solutionFamilyClosed E.identificationConditionClosed

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse
