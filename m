From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm tree build failure
Date: Fri, 29 Jan 2010 10:38:37 +1100
Message-ID: <20100129103837.02cc865f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__29_Jan_2010_10_38_37_+1100_MolG_fyd+2mpi+IW"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756550Ab0A1Xiv@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__29_Jan_2010_10_38_37_+1100_MolG_fyd+2mpi+IW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Yesterday's linux-next (next-20100128) build (arm versatile_defconfig)
failed like this:

arch/arm/mach-versatile/core.c: In function 'versatile_init':
arch/arm/mach-versatile/core.c:838: error: 'i' undeclared (first use in thi=
s function)

Looks like a bad merge (commit b7cdd38da36d61d0f42367057c9d04678644317a
"Merge branch 'versatile' into devel").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__29_Jan_2010_10_38_37_+1100_MolG_fyd+2mpi+IW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktiH/0ACgkQjjKRsyhoI8zcEQCcCirgo9eReCBNbNt1NBqanU9Z
kvYAn28DknfkxLCrsUihaPdO6pSkW1z9
=QxKm
-----END PGP SIGNATURE-----

--Signature=_Fri__29_Jan_2010_10_38_37_+1100_MolG_fyd+2mpi+IW--
