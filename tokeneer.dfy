/*
 Dafny version of Praxis tokeneer ID station model
 (abstract model)

 See coursework specification (question C) for detail on how to
 extend the model.
 */

 // basic types
 type optional<T> = ts: set<T> | |ts| <= 1   // optional type is modelled as a set with either zero or one element

 type TIME = nat

 const zeroTime := 0

 datatype PRESENCE = present | absent 

 datatype CLEARANCE_CLASS = unmarked | unclassified | restricted | confidential | secret | topsecret

 class Clearance 
 {
    var cClass: CLEARANCE_CLASS
    constructor()
 }

ghost function minClearance (c1: Clearance, c2: Clearance): Clearance 

datatype PRIVILEGE = userOnly | guard | securityOfficer | auditManager

type USER

type ISSUER = USER

type FINGERPRINT

type FINGERPRINTTEMPLATE

class FingerprintTemplate
{
    var template: FINGERPRINTTEMPLATE
    constructor()
}

// Keys and Certificates
type KEYPART(==)  // can only be instantiated by a type that supports equality

class CertificateId
{
    var issuer: ISSUER
    constructor()
}

trait Certificate
// A certificate is signed, with a certificate id, and has a validity period modelled as a 
// set of times for which it is valid. It can be validated using a key.
{
    var id: CertificateId
    var validityPeriod: set<TIME>
    var isValidatedBy: optional<KEYPART>
}

class IDCert extends Certificate
// An ID certificate also states the subject (user identified by the certificate) and 
// their public key
{
    var subject: USER
    var subjectPubK: KEYPART

    constructor()
}

trait AttCertificate extends Certificate
// All attribute certificates contain the ID of the token and the identification of the 
// ID certificate. 
{
    var baseCertId: CertificateId
    var tokenID: TOKENID
}

class PrivCert extends AttCertificate
// A privilege certificate also contains a role and a clearance
{
    var role: PRIVILEGE
    var clearance: Clearance
    constructor()
}

class AuthCert extends AttCertificate
// Authorisation certificate has the same structure as a privilege 
// certificate
{
    var role: PRIVILEGE
    var clearance: Clearance
    constructor()
}

class IandACert extends AttCertificate
// Identification and Authentication (I and A) certificate also 
// contains a fingerprint template
{
    var template: FingerprintTemplate
    constructor()
}

// Tokens
type TOKENID(==)

class Token
{
    var tokenID: TOKENID
    var idCert: IDCert
    var privCert: PrivCert
    var iandACert: IandACert
    var authCert: optional<AuthCert>

    constructor()

    predicate ValidToken()

    predicate TokenWithValidAuth()

    predicate CurrentToken(now: TIME)


}