From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the regulator tree
Date: Tue, 19 Mar 2019 08:31:04 +1100
Message-ID: <20190319083104.1503e2ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/yeuk0cepF09Ag_WRB8Q0BYS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Axel Lin <axel.lin@ingics.com>
List-Id: linux-next.vger.kernel.org

--Sig_/yeuk0cepF09Ag_WRB8Q0BYS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d1a6cbdf1e59 ("regulator: lp87565: Fix missing register for LP87565_BUCK_=
0")

Fixes tag

  Fixes: f0168a9bf ("regulator: lp87565: Add support for lp87565 PMIC regul=
ators")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/yeuk0cepF09Ag_WRB8Q0BYS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQDhgACgkQAVBC80lX
0GySHggAjYdT2ySHL8s+1o4QM4JG2ZE71slYIMRiYEkkCG6TNOjXF0pbbk+px2SH
0cXOBwb0uAH6wQokLpCiRIA4v2gA6l/t4JmPY8QP//F7StGkUc3wnZDTKEZCT1vB
/8Ohil2WB0ffJJbk6B3PePVj2Alhy4SwQkj6cNDw6WJIGlcypzmwBwBgAVWWiwzB
I6cJe7M0TP2eNpQgnPcDB1/B3EA4EtJN2j+EN4vCZMl0XF+Eg8tkiqT1zIHVzGTX
Jvo2z6gh3O1VDALRMPv+qRRltGmYSCnGslOli8m4zJ3Fro903+EoNJKbAa3KvHOh
DfQEWM9sGu9cSfnQ8vj00ViczDBJHQ==
=XELr
-----END PGP SIGNATURE-----

--Sig_/yeuk0cepF09Ag_WRB8Q0BYS--
