From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi tree with the scsi-fixes tree
Date: Mon, 14 Jan 2019 13:52:55 +1100
Message-ID: <20190114135255.1afee399@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LWLreKvBQ/Z_uIl+eC/KW09"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Garry <john.garry@huawei.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luo Jiaxing <luojiaxing@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/LWLreKvBQ/Z_uIl+eC/KW09
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

between commit:

  7bb25a89aad2 ("scsi: hisi_sas: Set protection parameters prior to adding =
SCSI host")

from the scsi-fixes tree and commit:

  ef63464bcf8f ("scsi: hisi_sas: Create root and device debugfs directories=
")

from the scsi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index c92b3822c408,b780b5269f0f..000000000000
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@@ -2507,12 -2672,9 +2672,15 @@@ hisi_sas_v3_probe(struct pci_dev *pdev
  		sha->sas_port[i] =3D &hisi_hba->port[i].sas_port;
  	}
 =20
 +	if (hisi_hba->prot_mask) {
 +		dev_info(dev, "Registering for DIF/DIX prot_mask=3D0x%x\n",
 +			 prot_mask);
 +		scsi_host_set_prot(hisi_hba->shost, prot_mask);
 +	}
 +
+ 	if (hisi_sas_debugfs_enable)
+ 		hisi_sas_debugfs_init(hisi_hba);
+=20
  	rc =3D scsi_add_host(shost, dev);
  	if (rc)
  		goto err_out_ha;

--Sig_/LWLreKvBQ/Z_uIl+eC/KW09
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw7+YcACgkQAVBC80lX
0Gz7XwgAikKMCOIYC8KxZCFWjC5hvyYO9ZEdx+eJ0vw/WSDCCZeOMNvCVjA861pI
IHkWyIYcDrvZq/yGeTdm7TZh2gdw+j/dVbG5i/r11rdNeSn/07XK0IJVqGWjsbMc
r2KwsIEpmN4gXJg4GwgRzjnFtp60qJAi5ugt3NWxR9KT+OT+xS7IjAKhRoEcojah
CPmRdsC+h58LzNffAsrWGdS+ENE8F+lGifUJReomGcAvs7s2fJyoqMo5GM3xdbEx
TF0G8JjtWFDoSd03Du+3Tkesj9EHAJ9ARf2kb8OIHSHQv2DX5dfihIlp1ACbNu+l
aHBetYpFHuRZt/v+boQjW96uya1hKw==
=lq9r
-----END PGP SIGNATURE-----

--Sig_/LWLreKvBQ/Z_uIl+eC/KW09--
