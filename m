From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the device-mapper tree
Date: Tue, 23 Apr 2019 07:34:12 +1000
Message-ID: <20190423073412.01c6376a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N2s5W2ifAqi=VcYKPBRHU/O"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikos Tsironis <ntsironis@arrikto.com>
List-Id: linux-next.vger.kernel.org

--Sig_/N2s5W2ifAqi=VcYKPBRHU/O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e28adc3bf34e ("dm cache metadata: Fix loading discard bitset")

Fixes tag

  Fixes: ae4a46a1f6 ("dm cache metadata: use bitset cursor api to load disc=
ard bitset")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/N2s5W2ifAqi=VcYKPBRHU/O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+M1QACgkQAVBC80lX
0GyI2Af+OvmatQ7Sy71kjrrDoXjdz/l0hjYnj30x8DLP22JF+NQbxd4ShA7KoPh9
qegKMHykDKDdKP3A67/yVyt3R+GAaAQe5SA8ab61e3oZKvUfRHpV0YP8ljBn9c/D
Q/4NORJL3YuV4f0EJ9hx634OvqdUQhock79kMGkM8Pn6KiughubyY9yro1dex5P8
0SzIPvw3kta6GjbepTI1WJd0xwPe8A572EcGboZg+Zc17hg+cz2YuaxPxYNRr4ZE
5c0TQ2Qr93k0GO/Umtwve1TKbNkpE2aDVK7BsK8WTuMgmA799oD6WT6yxGftOmSM
Lnqezi++yIBsm7GPLMNM2Na1RuE6kA==
=GWpp
-----END PGP SIGNATURE-----

--Sig_/N2s5W2ifAqi=VcYKPBRHU/O--
