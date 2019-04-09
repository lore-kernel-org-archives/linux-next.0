From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the nvdimm-fixes tree
Date: Wed, 10 Apr 2019 07:15:55 +1000
Message-ID: <20190410071555.6a283e81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Lh_f5ZKb7voCN2YyW9N7roG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Lh_f5ZKb7voCN2YyW9N7roG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

In commit

  631804370762 ("tools/testing/nvdimm: Retain security state after overwrit=
e")

Fixes tag

  Fixes: 926f74802cb ("tools/testing/nvdimm: Add overwrite support for nfit=
_test")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Lh_f5ZKb7voCN2YyW9N7roG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlytC4sACgkQAVBC80lX
0GwrPQf/cxotoDN5+QHPjWSNJ1vkJYZRiAmUIAa0RMJMbJhdRCpUtjZDCAKuu/EB
aRrnCIO6eftLIR6my8lrzpDeqxHT0omHY9AWJI791mcvjIqcqmVF0mskGd6DJpGy
VxvleYMuWo1ReJM84bplc2vu25JrgT2AGl9svOVE5fPXCEOHk7gGog8Jzov8uQfu
Os6SaVf2Xjvyr9M9umf8Q9apzvmoSsN0Ebxr3zNfO8seYaZgEJ64mQQ+tuXdTW2k
IgkAuu9OS47L/XGYaLJucHhylQ9ZpD+syiglw0V6cLyblYTEIFqvG6lGX+2iBmle
PGz9mOfLt5+truOrhqxlA6NwcMOS4w==
=PjQh
-----END PGP SIGNATURE-----

--Sig_/Lh_f5ZKb7voCN2YyW9N7roG--
