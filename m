From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the powerpc tree
Date: Mon, 4 Mar 2019 07:38:31 +1100
Message-ID: <20190304073831.228d3bff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VQR8vZIc74a6hsBJZ4U8JoN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/VQR8vZIc74a6hsBJZ4U8JoN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  bd3524feac21 ("powerpc/64s: Fix unrelocated interrupt trampoline address =
test")

Fixes tag

  Fixes: ccd477028a ("powerpc/64s: Fix HV NMI vs HV interrupt recoverabilit=
y test")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/VQR8vZIc74a6hsBJZ4U8JoN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx8O0cACgkQAVBC80lX
0GyytAf/Z0tAAGHIvVIc8xBWFHBFgmFbZuycPMRvnV+8K8pHfN1wkGQr2KN1Nwsh
DdSR5ZVAxnn0gZJU9AXlpJCAetoDOxY/GRuoBJ3UD8UrAm7JLpoDKIaXWkaxKmpX
uxChu7WwEN1keYqDAqB6CspUrUDzS6Q0Qr1kjtsVvZ//FxfdBB2qLkRnPrGxIS8B
to0UK0pCX7W4juPiGnTKSINz9FeWOk1aNDZQz69iz9hQQaUYKVGwbPXrd52phrbb
SAI6DPeSX+zTcX5eSiWNo7fjaM4i6ufSRcZjuGUnLouTPWYpcRhETk1WmPK3pvIp
ZwX+A/kXwlHIpkrGrALRk3TB9+Ku9A==
=FgZP
-----END PGP SIGNATURE-----

--Sig_/VQR8vZIc74a6hsBJZ4U8JoN--
