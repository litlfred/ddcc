Alias: $LOINC = http://loinc.org


Profile:        SVC_Composition
Parent:         Composition
Id:             svc-composition
Title:          "SVC Composition"
Description:    """ 
Container for the health content contained on a Paper SVC.  This profile is not intended to be instantiated directly, rather a [New SVC Composition](StructureDefinition-svc-composition-new.html) or a [Updated SVC Composition](StructureDefinition-svc-composition-updated.html) should be used.

A [SVC Composition](StructureDefinition-svc-composition.html) should:
 * be accessible from a SVC Registry as located via the WHO SMART Directory for the PHA referenced in the [author](StructureDefinition-svc-composition-definitions.html#Composition.agent).
"""
* title = "International Certificate of Vaccination or Prophylaxis"
* author only Reference(SVC_Organization)
* subject 1..1
* subject only Reference(SVC_Patient)
* status 1..1
* identifier 1..1 MS
* identifier.system 1..1
* identifier.value 1..1 MS
* identifier.system = "urn:uuid"
* section 1..
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code.coding.code"
* section ^slicing.rules = #open
* section ^slicing.ordered = true
* section contains Section_Vaccinations 1..1
* section[Section_Vaccinations].code.coding.system  = $LOINC
* section[Section_Vaccinations].code.coding.code  = #11369-6
* section[Section_Vaccinations].code MS
* section[Section_Vaccinations].entry 1..
* section[Section_Vaccinations].entry ^slicing.discriminator.type = #type
* section[Section_Vaccinations].entry ^slicing.discriminator.path = ""
* section[Section_Vaccinations].entry ^slicing.rules = #open
* section[Section_Vaccinations].entry ^slicing.ordered = true
* section[Section_Vaccinations].entry contains Section_Vaccinations_Entry 1.. MS
* section[Section_Vaccinations].entry[Section_Vaccinations_Entry] only Reference(SVC_Immunization)
* type.coding.system =  "urn:EXAMPLE-who.int:smart-vaccine-certificate" 
* type.coding.code =  #RC1
* ^abstract = true



Profile:        SVC_Composition_New
Parent:         SVC_Composition
Id:             svc-composition-new
Title:          "New SVC Composition"
Description:    """ 
Empty container for the health content contained on a new Paper SVC.

When a new Paper SVC is issued, the following rules apply to a [New SVC Composition](StructureDefinition-svc-composition-new.html):
  * a [Person.identifier](StructureDefinition-svc-person-definitions.html#Person.identifier)  entry is generated for a [SVC Patient](StructureDefinition-svc-patient.html) with system set to 'urn:uuid' and value set to a v4 UUID.
  * [Composition.author](StructureDefinition-svc-composition-new-definitions.html#Composition.author) is set to reference the Organization resource associated to the PHA via the WHO Smart Directory
  * set the [status](StructureDefinition-svc-composition-new-definitions.html#Composition.status) to #preliminary
  * for each row of the Paper SVC, an [New SVC Immunization](StructureDefinition-svc-immunization-new.html) should be generated and an entry should be created to reference this

"""
* status  = #preliminary
* subject only Reference(SVC_Patient_New)
* ^abstract = false

Profile:        SVC_Composition_Updated
Parent:         SVC_Composition
Id:             svc-composition-updated
Title:          "Updated SVC Composition"
Description:    """ 
Populated container for the health content contained on a reissued Paper SVC which

When a Paper SVC is reissued, the following rules apply:
  * [status](StructureDefinition-svc-composition-new-definitions.html#Composition.status)  is set to #final
  * each row in the Vaccination Events section of the Paper SVC should contain a QR-code encoding an [SVC Immunization](StructureDefinition-svc-immunization.html)
  * transfer written content from the Vaccination Events section of the existing Paper SVC into corresponding [Updated SVC Immunizations](StructureDefinittion-svc-immunization.html)
  * preserve entries in the from the external SVC Composition that correspond to [Updated SVC Immunizations](StructureDefintion-svc-composition-updated.html)


An Update SVC Composition may:
 * contain any other relevant health information appropriate to share (e.g. test results) according to the policy of the PHA.  It is up to the PHAs to define and manage bilateral data access policies.

"""
* status = #final
* subject only Reference(SVC_Patient_Updated)
* ^abstract = false

Profile:        SVC_Composition_Ingested
Parent:         SVC_Composition
Id:             svc-composition-ingested
Title:          "Ingested SVC Composition"
Description:    """ 
Populated container for the health content contained on a  Paper SVC issued by a PHA when ingesting an SVC issued by an external PHA

An Ingested SVC Composition should:
  * set [status](StructureDefinition-svc-composition-new-definitions.html#Composition.status) to #final
  * be accessible from a SVC Registry as located via the WHO SMART Directory for the associated PHA  
  * transfer written content from the Vaccination Events section of the existing Paper SVC into corresponding [Updated SVC Immunizations](StructureDefinition-svc-immunization.html)
  * preserve entries in the from the external [SVC Composition](StructureDefinition-svc-composition.html) that correspond to [Updated SVC Immunizations](StructureDefinition-svc-immunization.html)

An Ingested SVC Composition may be:
  * derived from a [New SVC Compostion](StructureDefinition-svc-composition-new.html) generated by the PHA
  * derived from located an existing Updated SVC Composition under the provenace of the PHA
  * contain any other relevant health information appropriate to share (e.g. test results) according to the policy of the PHA.  It is up to the PHAs to define and manage bilateral data access policies.

"""
* status = #final
* subject only Reference(SVC_Patient_Ingested)
* ^abstract = false