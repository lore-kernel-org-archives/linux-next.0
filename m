From: Austin S Hemmelgarn <ahferroin7@gmail.com>
Subject: Re: [PATCH] mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Fri, 17 Jul 2015 14:39:14 -0400
Message-ID: <55A94BD2.5040603@gmail.com>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org> <20150717172726.GA30443@redhat.com> <20150717173757.GD2779@kvack.org> <20150717175542.GA31888@redhat.com> <55A94578.5050306@gmail.com> <20150717181940.GA946@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms080100000305000807000003"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:34633 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752085AbbGQSjb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2015 14:39:31 -0400
In-Reply-To: <20150717181940.GA946@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms080100000305000807000003
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2015-07-17 14:19, Oleg Nesterov wrote:
> On 07/17, Austin S Hemmelgarn wrote:
>>
>> On 2015-07-17 13:55, Oleg Nesterov wrote:
>>> On 07/17, Benjamin LaHaise wrote:
>>>>
>>>> Don't add BUG().  It's the equivalent approach of saying "I think th=
is code
>>>> isn't needed, but I'm lazy and not going to remove it properly."
>>>
>>> There is another interpretation: I think this code must be never call=
ed,
>>> if it is actually called we have a serious problem which should be lo=
udly
>>> reported.
>>>
>> And not compiling it at all _will_ loudly report it, it'll just report=

>> it during linking instead of at run-time, which is a much better time =
to
>> shout about it.
>
> And how can we do this?
>
If a function that isn't defined (for example, you use a #if block to=20
comment it out under certain circumstances), then the link will fail=20
rather noisily something references it.  We already know during the=20
compile that it's a NOMMU kernel, so anything that calls it on a MMU=20
enabled kernel can have a compile time check added instead of doing the=20
check at runtime (or even just calling it without checking), thus even=20
further reducing code size.



--------------ms080100000305000807000003
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIGuDCC
BrQwggScoAMCAQICAxBuVTANBgkqhkiG9w0BAQ0FADB5MRAwDgYDVQQKEwdSb290IENBMR4w
HAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmlu
ZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZzAeFw0xNTAz
MjUxOTM0MzhaFw0xNTA5MjExOTM0MzhaMGMxGDAWBgNVBAMTD0NBY2VydCBXb1QgVXNlcjEj
MCEGCSqGSIb3DQEJARYUYWhmZXJyb2luN0BnbWFpbC5jb20xIjAgBgkqhkiG9w0BCQEWE2Fo
ZW1tZWxnQG9oaW9ndC5jb20wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCdD/zW
2rRAFCLnDfXpWxU1+ODqRVUgzHvrRO7ADUxRo1CBDc3JSX5TIW2OGmQ3DAKGOACp8Z0sgxMc
B05tzAZ/M7m4jajVrwwdVCdrwVGxTdAai7Kwg4ZCVfyMVhcwo8R2eW3QahBx34G0RKumK9sZ
ZQSQ+zULAzpY6uz7T1sAk/erMoivRXF6u8WvOsLkOD1F/Xyv1ZccSUG5YeDgZgc0nZUBvyIp
zXSHjgWerFkrxEM3y2z/Ff3eL1sgGYecV/I1F+I5S01V7Kclt/qRW10c/4JEGRcI1FmrJBPu
BtMYPbg/3Y9LZROYN+mVIFxZxOfrmjfFZ96xt/TaMXo8vcEKtWcNEjhGBjEbfMUEm4aq8ygQ
4MuEcpJc8DJCHBkg2KBk13DkbU2qNepTD6Uip1C+g+KMr0nd6KOJqSH27ZuNY4xqV4hIxFHp
ex0zY7mq6fV2o6sKBGQzRdI20FDYmNjsLJwjH6qJ8laxFphZnPRpBThmu0AjuBWE72GnI1oA
aO+bs92MQGJernt7hByCnDO82W/ykbVz+Ge3Sax8NY0m2Xdvp6WFDY/PjD9CdaJ9nwQGsUSa
N54lrZ2qMTeCI9Vauwf6U69BA42xgk65VvxvTNqji+tZ4aZbarZ7el2/QDHOb/rRwlCFplS/
z4l1f1nOrE6bnDl5RBJyW3zi74P6GwIDAQABo4IBWTCCAVUwDAYDVR0TAQH/BAIwADBWBglg
hkgBhvhCAQ0ESRZHVG8gZ2V0IHlvdXIgb3duIGNlcnRpZmljYXRlIGZvciBGUkVFIGhlYWQg
b3ZlciB0byBodHRwOi8vd3d3LkNBY2VydC5vcmcwDgYDVR0PAQH/BAQDAgOoMEAGA1UdJQQ5
MDcGCCsGAQUFBwMEBggrBgEFBQcDAgYKKwYBBAGCNwoDBAYKKwYBBAGCNwoDAwYJYIZIAYb4
QgQBMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcwAYYWaHR0cDovL29jc3AuY2FjZXJ0Lm9y
ZzAxBgNVHR8EKjAoMCagJKAihiBodHRwOi8vY3JsLmNhY2VydC5vcmcvcmV2b2tlLmNybDA0
BgNVHREELTArgRRhaGZlcnJvaW43QGdtYWlsLmNvbYETYWhlbW1lbGdAb2hpb2d0LmNvbTAN
BgkqhkiG9w0BAQ0FAAOCAgEAGvl7xb42JMRH5D/vCIDYvFY3dR2FPd5kmOqpKU/fvQ8ovmJa
p5N/FDrsCL+YdslxPY+AAn78PYmL5pFHTdRadT++07DPIMtQyy2qd+XRmz6zP8Il7vGcEDmO
WmMLYMq4xV9s/N7t7JJp6ftdIYUcoTVChUgilDaRWMLidtslCdRsBVfUjPb1bF5Ua31diKDP
e0M9/e2CU36rbcTtiNCXhptMigzuL3zJXUf2B9jyUV8pnqNEQH36fqJ7YTBLcpq3aYa2XbAH
Hgx9GehJBIqwspDmhPCFZ/QmqUXCkt+XfvinQ2NzKR6P3+OdYbwqzVX8BdMeojh7Ig8x/nIx
mQ+/ufstL1ZYp0bg13fyK/hPYSIBpayaC76vzWovkIm70DIDRIFLi20p/qTd7rfDYy831Hjm
+lDdCECF9bIXEWFk33kA97dgQIMbf5chEmlFg8S0e4iw7LMjvRqMX3eCD8GJ2+oqyZUwzZxy
S0Mx+rBld5rrN7LsXwZ671HsGqNeYbYeU25e7t7/Gcc6Bd/kPfA+adEuUGFcvUKH3trDYqNq
6mOkAd8WO/mQadlc3ztS++XDMhmIpfBre9MPAr6usqf+wc+R8Nk9KLK39kEgrqVfzc/fgf8L
MaD4rHnusdg4gca6Yi+kNrm99anw7SwaBrBvULYBp7ixNRUhaYiNW4YjTrYxggShMIIEnQIB
ATCBgDB5MRAwDgYDVQQKEwdSb290IENBMR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5v
cmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEW
EnN1cHBvcnRAY2FjZXJ0Lm9yZwIDEG5VMAkGBSsOAwIaBQCgggH1MBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE1MDcxNzE4MzkxNFowIwYJKoZIhvcNAQkE
MRYEFLVrEKDCHhSehNUCZbDEpBs3SJ01MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgZEGCSsGAQQBgjcQBDGBgzCBgDB5MRAwDgYD
VQQKEwdSb290IENBMR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMT
GUNBIENlcnQgU2lnbmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRAY2Fj
ZXJ0Lm9yZwIDEG5VMIGTBgsqhkiG9w0BCRACCzGBg6CBgDB5MRAwDgYDVQQKEwdSb290IENB
MR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2ln
bmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZwIDEG5V
MA0GCSqGSIb3DQEBAQUABIICAEIVwk87GD5g4TR2cxIDl1YEjgfgZjxLpf/RDh4az6sPJV68
csZ0Kx39l8RhmkfNYhtGr58HlldTEJSlXnzgbtIVFibPKK4RDu4Gjid5/iuIDWqExvrowjL9
FsjrC8/btCUkaQnSWr29xkEG8YCp06Kg18z+xD0rJlqC96pMk1EN7jHtKjgiowdK924T/qwh
43SSxrH+Z6fN/nje5OSWmKNoHvy8PO7k/TLSZUq70UlRamGTtmDUQV5d4eFRAnYSgca6t5Fr
yqZpdflhJnOpKfUqc2viWwiH7LeqKx2FgKNN744NRUNUpbbT5QAhsyBBOKz/QHiOzppMnH1Z
GQExnjLBCraGgzf0uHWz+8L6ZF1DHUzf+BNfdlJAtkjy1w3sQD6paCD+kVXqPUtjMzZADUwy
VhFMozWUAMldNgV0X0HcqYkonxAQXFtPt6a0oWIixJQQk1HdY3/Ovu97GR+YMYeRLduF8zMM
9VFmvjyHsD7zi5uve/8U72BsCJfVNvksRc1Gtkj8zfedw15VoZ4g8OXhFwdhQv373tNZP55I
OEivqVV2XrdxkhMq9aNny17Cq5htekNGjzVV2zBjABO1b5KEaRzT1W2k9gfhSIxIVueQw6or
TvkB/D4I4z/MF1T3/HmB9N1Ldo3z0llG9qzx+FLKXQQYcemKxf2jUlSfi+ThAAAAAAAA
--------------ms080100000305000807000003--
