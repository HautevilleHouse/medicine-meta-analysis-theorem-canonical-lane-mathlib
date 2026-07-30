import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure SubgroupAnalysisPackage where
  subgroupVariable : String
  interactionTestStatistic : ℚ
  interactionPValue : ℚ
  subgroupEffectSizes : List ℚ
  subgroupCIs : List (ℚ × ℚ)

def SubgroupAnalysisClosed (P : SubgroupAnalysisPackage) : Prop :=
  P.subgroupEffectSizes.length = P.subgroupCIs.length

structure SubgroupAnalysisEvidence (P : SubgroupAnalysisPackage) where
  lengthMatch : P.subgroupEffectSizes.length = P.subgroupCIs.length

theorem subgroup_analysis_closed_from_evidence (P : SubgroupAnalysisPackage) (E : SubgroupAnalysisEvidence P) :
    SubgroupAnalysisClosed P := E.lengthMatch

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse