From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dmi tree with Linus' tree
Date: Tue, 4 Sep 2018 09:19:50 +1000
Message-ID: <20180904091950.2e49b1a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.XsCb+VdQ3kODON9R5lYliI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kai Heng Feng <kai.heng.feng@canonical.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.XsCb+VdQ3kODON9R5lYliI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dmi tree got a conflict in:

  drivers/acpi/bus.c

between commit:

  ae976358cd7b ("Revert "ACPI / bus: Parse tables as term_list for Dell XPS=
 9570 and Precision M5530"")

from Linus' tree and commit:

  767b174cad46 ("ACPI / bus: Only call dmi_check_system on X86")

from the dmi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/acpi/bus.c
index 292088fcc624,0ac3ad75309c..000000000000
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@@ -1033,11 -1056,15 +1029,16 @@@ void __init acpi_early_init(void
 =20
  	acpi_permanent_mmap =3D true;
 =20
+ #ifdef CONFIG_X86
  	/*
 -	 * Check machine-specific quirks
 +	 * If the machine falls into the DMI check table,
 +	 * DSDT will be copied to memory
+ 	 * Note that calling dmi_check_system here on other architectures
+ 	 * would not be OK because only x86 intializes dmi early enough.
+ 	 * Thankfully only x86 systems need such quirks for now.
  	 */
 -	dmi_check_system(acpi_quirks_dmi_table);
 +	dmi_check_system(dsdt_dmi_table);
+ #endif
 =20
  	status =3D acpi_reallocate_root_table();
  	if (ACPI_FAILURE(status)) {

--Sig_/.XsCb+VdQ3kODON9R5lYliI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluNwZYACgkQAVBC80lX
0Gxe8Qf/elrm2pW26rZ9GHjMoleWgw+C+rshSJjPgTbK7+N7POlsX9ooNZ2djaMP
uECuSCNZLwyTX6rKKrIRMeNf5r8proNB+6yPAIYEEEHYUqTt7ygZ9dsiRrZcFswy
3LdosjzMlMDWAf5+Ga2JO55dz9GKbmBCycwG1tX9G+M38Cts6YNC8Cxl+KFgxuRV
et9JSsYsRx4dFFVxIRuCMAKfafeQ6f9jPHGcDKyovQ38Ld5lTwc9tV/bcKxH+3Y4
pEuiT4vcJW8U6G7Omga8MgnGWItyDyG5YA0BMJK6xKCDzQZggSqDeVZyRjPUDGrK
IwrA2u+6dYzoL8vOkFDVhQuEuuWzhQ==
=rbOe
-----END PGP SIGNATURE-----

--Sig_/.XsCb+VdQ3kODON9R5lYliI--
