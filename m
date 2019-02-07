From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Thu, 7 Feb 2019 15:44:46 +1100
Message-ID: <20190207154446.3f48c496@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ue6pta1EE95HH1kFzSVzLSz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Ewan D. Milne" <emilne@redhat.com>, James Smart <jsmart2021@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ue6pta1EE95HH1kFzSVzLSz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/lpfc/lpfc_nvme.c

between commit:

  7961cba6f7d8 ("scsi: lpfc: nvme: avoid hang / use-after-free when destroy=
ing localport")

from Linus' tree and commit:

  4c47efc140fa ("scsi: lpfc: Move SCSI and NVME Stats to hardware queue str=
uctures")

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

diff --cc drivers/scsi/lpfc/lpfc_nvme.c
index c84621a80ee5,e73895674f39..000000000000
--- a/drivers/scsi/lpfc/lpfc_nvme.c
+++ b/drivers/scsi/lpfc/lpfc_nvme.c
@@@ -2592,16 -2178,14 +2180,14 @@@ lpfc_nvme_destroy_localport(struct lpfc
  #if (IS_ENABLED(CONFIG_NVME_FC))
  	struct nvme_fc_local_port *localport;
  	struct lpfc_nvme_lport *lport;
- 	struct lpfc_nvme_ctrl_stat *cstat;
  	int ret;
 +	DECLARE_COMPLETION_ONSTACK(lport_unreg_cmp);
 =20
  	if (vport->nvmei_support =3D=3D 0)
  		return;
 =20
  	localport =3D vport->localport;
 -	vport->localport =3D NULL;
  	lport =3D (struct lpfc_nvme_lport *)localport->private;
- 	cstat =3D lport->cstat;
 =20
  	lpfc_printf_vlog(vport, KERN_INFO, LOG_NVME,
  			 "6011 Destroying NVME localport %p\n",
@@@ -2616,9 -2200,7 +2202,8 @@@
  	/* Wait for completion.  This either blocks
  	 * indefinitely or succeeds
  	 */
 -	lpfc_nvme_lport_unreg_wait(vport, lport);
 +	lpfc_nvme_lport_unreg_wait(vport, lport, &lport_unreg_cmp);
 +	vport->localport =3D NULL;
- 	kfree(cstat);
 =20
  	/* Regardless of the unregister upcall response, clear
  	 * nvmei_support.  All rports are unregistered and the

--Sig_/ue6pta1EE95HH1kFzSVzLSz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbt74ACgkQAVBC80lX
0GxtbQf/ZJILLO3jB/mjCIb5iXksgOlv7kZDUHbXMI8ObU6+XFNoYEcY4aQ/vixa
UapXCyfeJWh7hJpKh8qCow42WT+RbU/owF4j6QFW14QJUR/jZrxhMstLe5u2BOzk
9RwmiZbWb4e2JTfN+A5VVa0YbCyH8zQqOoUDJNNXTkYVyOYBsVOSf+4otrinqgb0
mtIjfM003h3AVLmzSLu2BALqNyABEgB7Atco8Jy+Bl/VFxcR8V4yeX2EJ4DjbgXt
ma6dP7hpoPkmToK9AKylVd8jNiKspY7kkPKaYZf4IdxpyvQmc+9SBVXP4HvcazM5
Ul/rw4FEjkhTdM5l66FU/fV5JXIp6w==
=tK8/
-----END PGP SIGNATURE-----

--Sig_/ue6pta1EE95HH1kFzSVzLSz--
