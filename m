From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the thermal-soc tree with the thermal
 tree
Date: Tue, 24 Mar 2015 13:11:25 +1100
Message-ID: <20150324131125.309811e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vz+.pkkLNUc92FceL6.YRsy"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39922 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752395AbbCXCLc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Mar 2015 22:11:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kapileshwar Singh <kapileshwar.singh@arm.com>

--Sig_/vz+.pkkLNUc92FceL6.YRsy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eduardo,

Today's linux-next merge of the thermal-soc tree got a conflict in
include/linux/thermal.h between commit 33f1e05e1536 ("Thermal:
initialize thermal zone device correctly") from the thermal tree and
commit f7e41876c4b2 ("thermal: of: fix cooling device weights in device
tree") from the thermal-soc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/thermal.h
index 8650b0b14da4,6bbe11c97cea..000000000000
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@@ -40,9 -40,9 +40,12 @@@
  /* No upper/lower limit requirement */
  #define THERMAL_NO_LIMIT	((u32)~0)
 =20
 +/* Invalid/uninitialized temperature */
 +#define THERMAL_TEMP_INVALID	-27400
 +
+ /* Default weight of a bound cooling device */
+ #define THERMAL_WEIGHT_DEFAULT 0
+=20
  /* Unit conversion macros */
  #define KELVIN_TO_CELSIUS(t)	(long)(((long)t-2732 >=3D 0) ?	\
  				((long)t-2732+5)/10 : ((long)t-2732-5)/10)

--Sig_/vz+.pkkLNUc92FceL6.YRsy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVEMfSAAoJEMDTa8Ir7ZwV0qIQAJGH7sRq4XnN18bhWDef/QgJ
Q1IxItRpCIS6wS0joBVHaweIAA5h097qEdgUfj4Nt0SKnj3bn/rIFDQYII7sRJ9W
ciFeRPwfmShRGdGE6dKVNplkn3NtXKxXaAhBkPfdH8g/BgKKFyj7YmxR3W+3kC2/
fwTi6WgPQPAL2Ep4GgzvDGJkVFlMI6yHzULxt4q5nKjHIDdy7lkUfXL9+IC2vMuy
Kh9aheZcmeBXxOpSLb7X7CcVA342lQ9ais08hbCL8z+Nb5PVDF7Mcfol0xfg3uCj
hjohYQxvApIhwXSjRFmM6cazjCtMJNoEhQeQCf/9wj/46XC58TSRB0ze4QTOtJBY
z6ylpgG2XjlY4lEUS6b48BqgYmGPWhtwxbDo9kvXpjAc1jmp108HcSAetVKfYXYm
d7ZZa2oqG/LewaR6z3RaJbeIngDyuZ1q5MMHcQyCbO4g0bnQ780LcXLBp3B7QSsx
uExDs6va2n+qxy6k3xXAKbQ4R/JaX6COHAvQ2kr1ns+j+NgFYTxlYEp3HQUidcWp
Len2gY6j756cIZ7X2ztK7cSxbxj+i4N3+U3KBFU6wcMcPnUM/h2VuTM9YtNkATZK
daTEBDzBxlYqvSBgTn5zuGu4nHpt4qp6MFZiSfkH7wFrJ060V16HzelXxdPtvDxi
D8HF5RvIyJd5Id9wyDvM
=x3BE
-----END PGP SIGNATURE-----

--Sig_/vz+.pkkLNUc92FceL6.YRsy--
