From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Thu, 18 Oct 2018 15:15:02 +1100
Message-ID: <20181018151502.3d31351f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tAxEV9xwKP8MZ=dGGjo1sq6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Smart <jsmart2021@gmail.com>, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/tAxEV9xwKP8MZ=dGGjo1sq6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/lpfc/lpfc_debugfs.c

between commit:

  9e210178267b ("scsi: lpfc: Synchronize access to remoteport via rport")

from Linus' tree and commit:

  d021613ee3ac ("scsi: lpfc: Remove set but not used variables 'tgtp'")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/lpfc/lpfc_debugfs.c
index aec5b10a8c85,d6e4cbfe3273..000000000000
--- a/drivers/scsi/lpfc/lpfc_debugfs.c
+++ b/drivers/scsi/lpfc/lpfc_debugfs.c
@@@ -550,8 -550,7 +550,7 @@@ lpfc_debugfs_nodelist_data(struct lpfc_
  	struct lpfc_nodelist *ndlp;
  	unsigned char *statep;
  	struct nvme_fc_local_port *localport;
- 	struct lpfc_nvmet_tgtport *tgtp;
 -	struct nvme_fc_remote_port *nrport;
 +	struct nvme_fc_remote_port *nrport =3D NULL;
  	struct lpfc_nvme_rport *rport;
 =20
  	cnt =3D (LPFC_NODELIST_SIZE / LPFC_NODELIST_ENTRY_SIZE);

--Sig_/tAxEV9xwKP8MZ=dGGjo1sq6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvICMYACgkQAVBC80lX
0GzPqwf/TTatrHMOKtbfAlZtUSWCWx5Ss//YxEu7x1BLkh2zz9XbaAwPHQwON7Dn
K4L07UYjIoMF3tdWtpFrJw6ToSwc5x26T47mPM4CFR+Oodn/iWLJLkFm3PwLeccV
zHNJWNmoKvGxgHhVE8fr/VkrvdmCHcryVDr+BRfpXZzTaAejhfUgKk2LYkUaR7KL
n/V3WTSC6d/RRNSVICrCytIvZQNjSuhYfrv3WVV8xbbjqGGtZ3ic1AEw126k/Jcv
aWCEMc/PQ+Pbd1TgnOedB9ZDHmSxQkV/CnnX539EXOdy+S3UMkT6aJUda56pVcKu
NtS+2kTjaZwWMcPCMdlFpQcnrVaZEw==
=ByUP
-----END PGP SIGNATURE-----

--Sig_/tAxEV9xwKP8MZ=dGGjo1sq6--
