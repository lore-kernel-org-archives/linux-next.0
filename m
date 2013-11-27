From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 27 Nov 2013 13:01:44 +1100
Message-ID: <20131127130144.8db67b95b9c1a0141ab58a4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__27_Nov_2013_13_01_44_+1100_IavDiY/BYPXejUdt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rashika Kheria <rashika.kheria@gmail.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__27_Nov_2013_13_01_44_+1100_IavDiY/BYPXejUdt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in
drivers/staging/tidspbridge/pmgr/cmm.c,
drivers/staging/tidspbridge/pmgr/dbll.c,
drivers/staging/tidspbridge/pmgr/dev.c,
drivers/staging/tidspbridge/pmgr/dmm.c and
drivers/staging/tidspbridge/pmgr/dspapi.c between commit cb45065428b7
("staging: delete tidspbridge driver") from the staging.current tree and
various commits from the staging tree.

I just removed the files and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__27_Nov_2013_13_01_44_+1100_IavDiY/BYPXejUdt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSlVKMAAoJEMDTa8Ir7ZwVyzgQAJR4dW3Dmk8snfDxNhJuD3f2
HK5sq/nW67dg0LPqZzfduQ0A7A0hbCte4QHvkqmhklfzUXIFu/jCTbnYky32TWvI
8TdhoaihbB5JAQpeW3UPixu9e2DsXybalSOpB/EsKvnwTA1hav/bLR9doQzQ2IlR
Ct28w70P/D5b2hWWO0Xgz4bU13HOIDZEFAsYyuMIeIncVnnwOTofB6KhOmrPLUdY
TWiL3NppzuqqfO7z1Z4trllJWn10LMLtsjJmusXJ5yk0v8Q0uxcWBre90vBQnBu4
UdbcChIg9Wx0ytfPYMwYexyqAHNCwopPOxerbyrcEZ/2ZOmlLzmLM15gBcNBiH+l
YsV6Pn1vtJpisI2wMQigMgw+arLLzekH2rkEZU6z5/15ZLjSHyouGAoj1Y9BC+SW
CY/Wb1gjTnFowthv9mN4Iae/a02IDd2xnmRunwrK7pLkLGOKGOoHxN+uTOKa802H
b76mmf8lLSbk/VUMnZvb1EHj5SrX48GF86la+N0WRkCtFhVvJFpA0tQTz4GlUS8u
kTwY7upq/SfbMCAxj571ZEy82xinTrYJWTk+dRcAMYe2V+aZQeQ2QcCcIIJVOoY3
BzvLbRbxGUZN2+Mw0k4MX2Nmui4MF/K5+0FJjMZjY16U3iZJggDlOzhwRL2kQplF
5JbQLKtWScc2Q2MeDGoZ
=A8Pm
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Nov_2013_13_01_44_+1100_IavDiY/BYPXejUdt--
