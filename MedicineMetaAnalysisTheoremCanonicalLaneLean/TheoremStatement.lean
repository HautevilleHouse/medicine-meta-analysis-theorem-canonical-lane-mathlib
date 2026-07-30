import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure AdmittedObject where
  trial : String
  analysisType : String
  conclusion : Prop

def WitnessClosed (O : AdmittedObject) : Prop := O.conclusion

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse
