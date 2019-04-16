From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drivers-x86-fixes tree
Date: Wed, 17 Apr 2019 07:17:54 +1000
Message-ID: <20190417071754.0fcdef3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ax4i8/oG68w.a6eeHy8nS9N"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ax4i8/oG68w.a6eeHy8nS9N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  57f634b76a95 ("platform/x86: dell-laptop: fix rfkill functionality")

Fixes tag

  Fixes: 549b49 ("platform/x86: dell-smbios: Introduce dispatcher for SMM c=
alls")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/ax4i8/oG68w.a6eeHy8nS9N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly2RoIACgkQAVBC80lX
0Gwd4gf/XK9fWs+FiqliM5SmT/5Vmdo6F6jpasC26Atf0Y23x5FTwX1zLO8EEaF4
WGLIExQaJ8mzIl2ktJpVxVK3sZZIOeu6bL7wupz+QqqDhz6kZbB86sHv7SmnkdXk
3ttr8/nmmGgW9tJTBn0iP9rAjAA0rel6wA/Ki2sCoS9xNMg8+taN3eg7Kh+kQDuM
HO/QxK+3iwx/gY+KpGuw7R8+1e0JpNKgtT9RWXrvnsRA2TDD+Z2LVAfLfxmK8miW
0/bQQCgOTmmH/N+Ouzlevk8Qft4r8Mat4PEadFmKL/RGcwirFvRsbkgitQOqpjsx
pZ0CRSo9FbqagCYQcCIgmPHXq/Q+cA==
=1Lar
-----END PGP SIGNATURE-----

--Sig_/ax4i8/oG68w.a6eeHy8nS9N--
