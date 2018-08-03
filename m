From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Fri, 3 Aug 2018 16:04:05 +1000
Message-ID: <20180803160405.15df3dac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/k_28nBIYg1ADeskmg.IQ9Dp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Quinn Tran <quinn.tran@cavium.com>
List-Id: linux-next.vger.kernel.org

--Sig_/k_28nBIYg1ADeskmg.IQ9Dp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got conflicts in:

  drivers/scsi/qla2xxx/qla_gs.c

between commit:

  b5f3bc39a0e8 ("scsi: qla2xxx: Fix inconsistent DMA mem alloc/free")

from Linus' tree and commit:

  8777e4314d39 ("scsi: qla2xxx: Migrate NVME N2N handling into state machin=
e")

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

P.S. it looks like more use could be made of "c" in this function ...

diff --cc drivers/scsi/qla2xxx/qla_gs.c
index 7a3744006419,407eb705f1be..000000000000
--- a/drivers/scsi/qla2xxx/qla_gs.c
+++ b/drivers/scsi/qla2xxx/qla_gs.c
@@@ -3394,19 -3383,40 +3391,40 @@@ int qla24xx_post_gpnid_work(struct scsi
 =20
  void qla24xx_sp_unmap(scsi_qla_host_t *vha, srb_t *sp)
  {
- 	if (sp->u.iocb_cmd.u.ctarg.req) {
- 		dma_free_coherent(&vha->hw->pdev->dev,
- 			sp->u.iocb_cmd.u.ctarg.req_allocated_size,
- 			sp->u.iocb_cmd.u.ctarg.req,
- 			sp->u.iocb_cmd.u.ctarg.req_dma);
- 		sp->u.iocb_cmd.u.ctarg.req =3D NULL;
- 	}
- 	if (sp->u.iocb_cmd.u.ctarg.rsp) {
- 		dma_free_coherent(&vha->hw->pdev->dev,
- 			sp->u.iocb_cmd.u.ctarg.rsp_allocated_size,
- 			sp->u.iocb_cmd.u.ctarg.rsp,
- 			sp->u.iocb_cmd.u.ctarg.rsp_dma);
- 		sp->u.iocb_cmd.u.ctarg.rsp =3D NULL;
+ 	struct srb_iocb *c =3D &sp->u.iocb_cmd;
+=20
+ 	switch (sp->type) {
+ 	case SRB_ELS_DCMD:
+ 		if (c->u.els_plogi.els_plogi_pyld)
+ 			dma_free_coherent(&vha->hw->pdev->dev,
+ 			    c->u.els_plogi.tx_size,
+ 			    c->u.els_plogi.els_plogi_pyld,
+ 			    c->u.els_plogi.els_plogi_pyld_dma);
+=20
+ 		if (c->u.els_plogi.els_resp_pyld)
+ 			dma_free_coherent(&vha->hw->pdev->dev,
+ 			    c->u.els_plogi.rx_size,
+ 			    c->u.els_plogi.els_resp_pyld,
+ 			    c->u.els_plogi.els_resp_pyld_dma);
+ 		break;
+ 	case SRB_CT_PTHRU_CMD:
+ 	default:
+ 		if (sp->u.iocb_cmd.u.ctarg.req) {
+ 			dma_free_coherent(&vha->hw->pdev->dev,
 -			    sizeof(struct ct_sns_pkt),
++			    sp->u.iocb_cmd.u.ctarg.req_allocated_size,
+ 			    sp->u.iocb_cmd.u.ctarg.req,
+ 			    sp->u.iocb_cmd.u.ctarg.req_dma);
+ 			sp->u.iocb_cmd.u.ctarg.req =3D NULL;
+ 		}
+=20
+ 		if (sp->u.iocb_cmd.u.ctarg.rsp) {
+ 			dma_free_coherent(&vha->hw->pdev->dev,
 -			    sizeof(struct ct_sns_pkt),
++			    sp->u.iocb_cmd.u.ctarg.rsp_allocated_size,
+ 			    sp->u.iocb_cmd.u.ctarg.rsp,
+ 			    sp->u.iocb_cmd.u.ctarg.rsp_dma);
+ 			sp->u.iocb_cmd.u.ctarg.rsp =3D NULL;
+ 		}
+ 		break;
  	}
 =20
  	sp->free(sp);

--Sig_/k_28nBIYg1ADeskmg.IQ9Dp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltj8FUACgkQAVBC80lX
0GxtGAf/VpBcwZLxtCW5tgyOEK3P90da+NbBgB0uObQpkmdF6x55XKTf7trRP8Id
nCWaQd7XS9/hz7g9XgTwZV4CZoW3lm0DyUpVcpWnVQzqqeeqQLteELUYscSQhmV8
NrzKJWcMokx6Dt8tj6ndYjHsbtRz4uI6Letq32DZnbSQayi47K/IUiGqgg0vTrLW
10pUgSuaYzlY1XeU3/LbGpKDbjPioZ0pl7rWnAbogGkjRN5jdwNcLftGhQqOsRbU
Gmnt30WQHGkQTMRFwyCaHpSQHOL69KOwCWfIB07YIYALmXEx0IL200PsnBM+sr4s
g7IqOKcynVnC32KKuzhWd767yNMxxg==
=4fGJ
-----END PGP SIGNATURE-----

--Sig_/k_28nBIYg1ADeskmg.IQ9Dp--
