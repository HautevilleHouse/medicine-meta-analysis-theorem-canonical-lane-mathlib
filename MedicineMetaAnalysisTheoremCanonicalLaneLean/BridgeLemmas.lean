import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  WitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse
