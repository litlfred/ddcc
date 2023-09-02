Alias: $TrustNetworkGatewayContracts = http://worldhealthorganization.github.io/smart-trust/ValueSet/TrustNetworkGatewayContracts


Profile: TrustNetworkGatewayDDCC
Id: TrustNetworkGatewayDDCC
Parent: TrustNetworkGateway
Title: "GDHCN DDCC Onboarding"
Description: """A representation that a  Eligible Participant has onboarded onto WHO's Global Digital Health Certification Network (GDHCN) and in the DDCC Trust Domain.  A Trust Domain is defined by a Terms of Reference that is maintained by the WHO GDHCN Secreariat and defines a set of use cases for data sharing in a particular clinical health, public health, or health system domain.  A Trust Network Paricipant is by agreeing to:
 * endevour to adhere to the goverance, data scurity and privacy prinicples as indicated in the Terms of Reference for the Trust Domain that is the subject of this contract; 
 * meet the technical standards required for the interoperable exhange of Verfiable Digital Health Certificates for the Trust Domain ;
 * and share Public Key Material that allows ther verification of Verifiable Digital Health Certificates for the Trust Domain.

A Eligible Participant requests to join the GDHCN by sending a Letter of Applicaiton for that Trust Domain that includes information about the Business Owner for the Trust Network Gateway Participant.   The organization of this Business Owner should be referenced as the subject the contract.

The Letter of Application should be available under the legal context data field"
"""



* publisher = 1..1 MS
* publisher = "World Health Organization (WHO)"

* scope = $TrustNetworkGatewayContracts#DDCC

