From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Date: Tue, 19 Mar 2019 10:55:28 +1100
Message-ID: <20190319105528.115f0a88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z_JOi7uQlBwHhx=TkNMJKXv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Dave Airlie <airlied@redhat.com>, Mario Kleiner <mario.kleiner.de@gmail.com>, David Francis <David.Francis@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Z_JOi7uQlBwHhx=TkNMJKXv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commits:

  d63716658ac1 ("drm/amd/display: Use vrr friendly pageflip throttling in D=
C.")
  634092b1b9f6 ("drm/amd/display: Use vrr friendly pageflip throttling in D=
C.")

from Linus' tree and commit:

  7b19bba58f77 ("drm/amd/display: Use vrr friendly pageflip throttling in D=
C.")

and following commits from the amdgpu tree.

I fixed it up (I used the version from the amdgpu tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z_JOi7uQlBwHhx=TkNMJKXv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQL/AACgkQAVBC80lX
0GzcxAgAmKauUZUsKk0MC6nhciAMHKjHyRAmh1wq3xRwLeI66GMUf5dvNqI5q9mv
x8KKkqCuDrUWy+MiGSMICX/m3JrGKifwAZltxSSTEjcVav3N0+DGHrsyNMT+7V1a
PDb43IO5MtW+6OERkEVXXVEEbZb2Ku+bljLabDqth5vPehs1PKJBDfgWgBmlOfNu
thIcciCIr84dXuJsQvSMsAKES+wkazNkZ8xxxMl4gEC/vFkCcOUJrJb0+fjXCIfc
+V89nCGWAZ4UL2TCJFWwHyjqlpPp0xeD04M6mzovX2ilmDT9UYvxJXzvV9mzGqlL
s5BKXleCzNYc13XdXRzo7uuwh6OW9A==
=Nooh
-----END PGP SIGNATURE-----

--Sig_/Z_JOi7uQlBwHhx=TkNMJKXv--
