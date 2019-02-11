From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Mon, 11 Feb 2019 15:31:27 +1100
Message-ID: <20190211153127.09756262@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5Nwd28GjUgGNQ606dgNeb2_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Garry <john.garry@huawei.com>, James Bottomley <James.Bottomley@HansenPartnership.com>, Xiang Chen <chenxiang66@hisilicon.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5Nwd28GjUgGNQ606dgNeb2_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

between commit:

  7bb25a89aad2 ("scsi: hisi_sas: Set protection parameters prior to adding =
SCSI host")

from Linus' tree and commit:

  b3cce125cb1e ("scsi: hisi_sas: Add support for DIX feature for v3 hw")

from the scsi-mkp tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index 8481c5795e1f,00738d0673fe..000000000000
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@@ -2698,12 -2805,6 +2806,15 @@@ hisi_sas_v3_probe(struct pci_dev *pdev
  	if (hisi_sas_debugfs_enable)
  		hisi_sas_debugfs_init(hisi_hba);
 =20
 +	if (hisi_hba->prot_mask) {
 +		dev_info(dev, "Registering for DIF/DIX prot_mask=3D0x%x\n",
 +			 prot_mask);
 +		scsi_host_set_prot(hisi_hba->shost, prot_mask);
++		if (hisi_hba->prot_mask & HISI_SAS_DIX_PROT_MASK)
++			scsi_host_set_guard(hisi_hba->shost,
++					    SHOST_DIX_GUARD_CRC);
 +	}
 +
  	rc =3D scsi_add_host(shost, dev);
  	if (rc)
  		goto err_out_ha;

--Sig_/5Nwd28GjUgGNQ606dgNeb2_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxg+p8ACgkQAVBC80lX
0GwakQgAgUeViVSfNmXMbGdBosKyZJrRrGfiyLpoYjfEFgZB6ppKGiUqmVz72lqW
XFkLdrRe2F426BwSqccy7tbJhga8TFErnkIdAktYF+AUU5PsGsZ49yO5GW8sX3Fh
pcmazAMyVI8hCREw8wZHyxMl4+EtiQZmHoM9Gfr84rD1uOrRtwLBaLcSNE2DLjvg
ulMWrv1+HTokluizaR7UDee/Gb/frsIdbCv6HyJoXjyzOx54DBfuBcbkuTLcUs9z
U9TlEmFcSASsrVcqqFVrH/TDZNAKD7iecFthamTuXqcExlpS6hjSxvzb+4yLAZwW
rLKNFVxYZlDGDK9mUECLWq84Arc1Xw==
=WJSB
-----END PGP SIGNATURE-----

--Sig_/5Nwd28GjUgGNQ606dgNeb2_--
