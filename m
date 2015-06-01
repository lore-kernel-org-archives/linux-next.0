From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the edac-amd tree
Date: Mon, 1 Jun 2015 17:07:42 +1000
Message-ID: <20150601170742.626210ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NjauolGQXl5LnmYPL8i4q=X"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58480 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751140AbbFAHHt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 03:07:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Loc Ho <lho@apm.com>, Arnd Bergmann <arnd@arndb.de>

--Sig_/NjauolGQXl5LnmYPL8i4q=X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

After merging the edac-amd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/edac/xgene_edac.c: In function 'xgene_edac_pmd_l2c_version1':
drivers/edac/xgene_edac.c:792:2: error: implicit declaration of function 'M=
IDR_VARIANT' [-Werror=3Dimplicit-function-declaration]
  switch (MIDR_VARIANT(read_cpuid_id())) {
  ^
drivers/edac/xgene_edac.c:792:2: error: implicit declaration of function 'r=
ead_cpuid_id' [-Werror=3Dimplicit-function-declaration]
drivers/edac/xgene_edac.c:794:3: error: implicit declaration of function 'M=
IDR_REVISION' [-Werror=3Dimplicit-function-declaration]
   switch (MIDR_REVISION(read_cpuid_id())) {
   ^
drivers/edac/xgene_edac.c:797:4: error: implicit declaration of function 'r=
ead_cpuid' [-Werror=3Dimplicit-function-declaration]
    switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
    ^
drivers/edac/xgene_edac.c:797:40: error: 'REVIDR_EL1' undeclared (first use=
 in this function)
    switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
                                        ^
drivers/edac/xgene_edac.c:790:37: note: in definition of macro 'REVIDR_MINO=
R_REV'
  #define REVIDR_MINOR_REV(revidr) ((revidr) & 0x00000007)
                                     ^
drivers/edac/xgene_edac.c:797:40: note: each undeclared identifier is repor=
ted only once for each function it appears in
    switch (REVIDR_MINOR_REV(read_cpuid(REVIDR_EL1))) {
                                        ^
drivers/edac/xgene_edac.c:790:37: note: in definition of macro 'REVIDR_MINO=
R_REV'
  #define REVIDR_MINOR_REV(revidr) ((revidr) & 0x00000007)
                                     ^

Caused by commit  ("EDAC: Add APM X-Gene SoC EDAC driver").  You can't
use COMPIlE_TEST for drivers that use arch specific APIs ...

I have used the edac-amd tree from next-20150529 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/NjauolGQXl5LnmYPL8i4q=X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbATDAAoJEMDTa8Ir7ZwVZ3cP/0C20JIeaN5eGSj9xD3ObYZ4
KBCuCPjqMWrjgqOijeVOzT+0CrM7T52DIDGBUaVrdJiXW05FNLQTeznARMny/a0j
kfUxDQRJwcl6JxUbGuV5BiQYR73PyM/u9iEzviE9KDsBjsvIJPHYpl30LxkseDnx
jzlCdqkMbIjpH3qKc+evUXbZsolDkYlLVzlv03tUO3k3MGioXpIgjhHw47pmVp2B
OdmxL/YqCojL9xF6q7wwdCJBfvHsZe5Vmo1SeQ9D7kvdLW4Ff2AoQ/c1VLGbZ0nb
C7YgLyu3PLB+Our8a5BYNzWZprbzNwt1E49M0thWlaV61EcIdWb4w+Ga7ZZ0TOnn
l9lOCRXR8QkNPKa8tVyrvKPJogrUKkiflgH/eycfvywaziR7BOGkNb97WDtho43m
fhTLTvcBtUXgOR2j3mDfIa3c6BDBUoGkU4D1lkZdhsLuh8jAwpM9FMEQm9qdDlRW
7mcZXMP7aeFcOEo8/ZkFa+GReWEirz32N5i8SPxTSuBKVcVgj5bmKXDFFCT3+S81
KOPHc+a4Jt04ZWbudOISsFVY9BvTZ/dUqPTa5pMJIpGUcqR9Cz0fHZIPbkRY8Kgt
oesvHjk0L45YEehnhw26KRlC04V4sI58uyThcFjqf+Qd9QgQIdZXXMCCOFdMyKR4
klrsluaMnPuzjF07SufS
=kHMk
-----END PGP SIGNATURE-----

--Sig_/NjauolGQXl5LnmYPL8i4q=X--
