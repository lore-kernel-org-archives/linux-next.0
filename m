From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings from Linus' tree
Date: Tue, 12 Jun 2018 08:14:13 +1000
Message-ID: <20180612081413.323d85b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/W/m1/rBdObywzXKqe1sTqIe"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/W/m1/rBdObywzXKqe1sTqIe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (powerpc ppc64_defconfig)
produced these warning:

ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in=
 section `.gnu.hash'.
ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in=
 section `.gnu.hash'.
ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in=
 section `.gnu.hash'.

This may just be because I have started building using the native Debian
gcc for the powerpc builds ...

--=20
Cheers,
Stephen Rothwell

--Sig_/W/m1/rBdObywzXKqe1sTqIe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlse9DUACgkQAVBC80lX
0GwAawgApdMf0NhVOmjUuHMCIsVcF2VnHyuaeXZRscavEqHiPxuWDsM4siF5nZ1Z
EVBIptKv3UADfLoAWr1k26l7LQpg57iCvTVRwd/8l5KTujs0Qh32vJ87hVHGK57a
7MMD1DC9m2J774Eyrl0ZiZeJPeYP5vdRz5pBcsvINuWwJR51T7NvY6RwZhOrKpNa
D7z4KRX6xA6X3j2wnMwZQNS+r4BbMP79VRzCq5DUn1LtidTS6BcD3u11m6+m3f5W
CZY3lXXbEEkK9i0NYmTTKo+3GR5X8W4Nw92UeIGkmE+bI4DffnJe22Fz0mWXRT1h
hLs6n+kDpZzDtRcB76Tgxy4wyP6fNA==
=BwqD
-----END PGP SIGNATURE-----

--Sig_/W/m1/rBdObywzXKqe1sTqIe--
