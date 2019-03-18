From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Date: Mon, 18 Mar 2019 15:54:19 +1100
Message-ID: <20190318155419.0e6d34f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JLSLO4MGfOk6rg94xHti=c2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/JLSLO4MGfOk6rg94xHti=c2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Commits

  b208c3a940b9 ("drm/amdkfd: avoid HMM change cause circular lock")
  8a3397a108e5 ("drm/amdgpu: use HMM callback to replace mmu notifier")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/JLSLO4MGfOk6rg94xHti=c2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyPJHsACgkQAVBC80lX
0Gz1ewgAmXaUNL20i6dWQ0uvPZo68J+vWkXDBSc/DCESjgsz606PaCxrMt/sj2jF
Tcy294QtNs1x41kYtVa5b0gqMMajToQYGNna/LTBy5SNfiiP2mIH/e9cLjHaSDky
MkMLs09yJVIlVY5KgQPjsBkuTuCe0kRL9Ti9QDK4qXBRieILNbsBgF9GOy/8Vi6y
PQ+3WskSAETJoVWsgA2szYQgsqm/UEjIH4R3YwxZ//glEqOL7dIIs+LJbzaqOFh8
pK31QpHtEnSAx7LmmDqNmyFqM/X/wFI/KupSV6SOcs2kBB9wSR1YbjLevPnRvIjB
1q7wkuKVXLkkVW/3GSzW0Dzr6AR9Cg==
=H66S
-----END PGP SIGNATURE-----

--Sig_/JLSLO4MGfOk6rg94xHti=c2--
