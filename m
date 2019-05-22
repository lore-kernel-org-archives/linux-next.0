From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with Linus' tree
Date: Wed, 22 May 2019 10:08:34 +1000
Message-ID: <20190522100808.66994f6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YwkOGvG=CkLqflpVH/R29Pr"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoph Hellwig <hch@lst.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Hannes Reinecke <hare@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/YwkOGvG=CkLqflpVH/R29Pr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the scsi tree got conflicts in:

  drivers/scsi/hosts.c
  drivers/scsi/libsas/sas_task.c
  drivers/scsi/scsi.c
  drivers/scsi/scsi_error.c
  drivers/scsi/scsi_ioctl.c
  drivers/scsi/scsi_lib.c
  drivers/scsi/scsi_pm.c
  drivers/scsi/scsi_sysfs.c
  drivers/scsi/sd.c
  drivers/scsi/sr.c
  drivers/scsi/st.c

between commits:

  457c89965399 ("treewide: Add SPDX license identifier for missed files")
  09c434b8a004 ("treewide: Add SPDX license identifier for more missed file=
s")

from Linus' tree and commits:

  026104bfa591 ("scsi: core: add SPDX tags to scsi midlayer files missing l=
icensing information")
  5502239e73e6 ("scsi: libsas: add a SPDX tag to sas_task.c")
  5897b844b7f9 ("scsi: sd: add a SPDX tag to sd.c")
  95b04a2ff9c7 ("scsi: sr: add a SPDX tag to sr.c")
  50a1ea5bebbc ("scsi: st: add a SPDX tag to st.c")

from the scsi tree.

I fixed it up (I just used the scsi tree versions - which are GPL-2.0
instead of GPL-2.0-only) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/YwkOGvG=CkLqflpVH/R29Pr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzkkwIACgkQAVBC80lX
0GybKAf+OVoyCmYgeS/h1QR3Ovw1c+dwqba2qpyaIzgcu40gB1XO64HZaKjWn4Zp
/q2bEtNJHOtjo8Cnu7g/mop4Yod9dIk2oDcmPTKCY0JFTE9RTzHs/xvxKUAWuvgQ
UbbJR/pKEOAADHCLKle3zuFz2CAJSQ4N51x1HOn7bGJHDnlGJteyN1lRJ4bONZKH
7tqtOdnvrlq+SlgVrZfGoe3h2Sp8Nm0CAKHJXGBpOih28MrQyhCpfXaj05hnqVlC
gM9jD5LaSOyQSay7dUdD1TeSRk9UOc1VrrzqUQ4KuuZmdqe8g1R7YfUXQXTRazJc
XEaNl5jDVqIj6onzR3ysuKFiTmpXlg==
=bfyr
-----END PGP SIGNATURE-----

--Sig_/YwkOGvG=CkLqflpVH/R29Pr--
