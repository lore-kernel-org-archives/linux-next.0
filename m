From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Mon, 10 Dec 2018 18:09:44 +1100
Message-ID: <20181210180944.0fb13ead@canb.auug.org.au>
References: <20181210171716.77cbf9fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tWFfAALYS_p+LreYcNwSvG0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210171716.77cbf9fe@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>, Bill Kuzeja <William.Kuzeja@stratus.com>
List-Id: linux-next.vger.kernel.org

--Sig_/tWFfAALYS_p+LreYcNwSvG0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 10 Dec 2018 17:17:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

See below :-)

Also I accidentally left the declaration of "status" in __qla2x00_abort_all=
_cmds().
--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/qla2xxx/qla_os.c
index f92196ec5489,643cd7c0efc1..000000000000
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@@ -1742,6 -1746,41 +1742,49 @@@ qla2x00_loop_reset(scsi_qla_host_t *vha
  	return QLA_SUCCESS;
  }
 =20
+ static void qla2x00_abort_srb(struct qla_qpair *qp, srb_t *sp, const int =
res,
+ 			      unsigned long *flags)
+ 	__releases(qp->qp_lock_ptr)
+ 	__acquires(qp->qp_lock_ptr)
+ {
+ 	scsi_qla_host_t *vha =3D qp->vha;
+ 	struct qla_hw_data *ha =3D vha->hw;
+=20
+ 	if (sp->type =3D=3D SRB_NVME_CMD || sp->type =3D=3D SRB_NVME_LS) {
+ 		if (!sp_get(sp)) {
+ 			/* got sp */
+ 			spin_unlock_irqrestore(qp->qp_lock_ptr, *flags);
+ 			qla_nvme_abort(ha, sp, res);
+ 			spin_lock_irqsave(qp->qp_lock_ptr, *flags);
+ 		}
+ 	} else if (GET_CMD_SP(sp) && !ha->flags.eeh_busy &&
+ 		   !test_bit(ABORT_ISP_ACTIVE, &vha->dpc_flags) &&
+ 		   !qla2x00_isp_reg_stat(ha) && sp->type =3D=3D SRB_SCSI_CMD) {
+ 		/*
+ 		 * Don't abort commands in adapter during EEH recovery as it's
+ 		 * not accessible/responding.
+ 		 *
+ 		 * Get a reference to the sp and drop the lock. The reference
+ 		 * ensures this sp->done() call and not the call in
+ 		 * qla2xxx_eh_abort() ends the SCSI cmd (with result 'res').
+ 		 */
+ 		if (!sp_get(sp)) {
++			int status;
++
+ 			spin_unlock_irqrestore(qp->qp_lock_ptr, *flags);
 -			qla2xxx_eh_abort(GET_CMD_SP(sp));
++			status =3D qla2xxx_eh_abort(GET_CMD_SP(sp));
+ 			spin_lock_irqsave(qp->qp_lock_ptr, *flags);
++			/*
++			 * Get rid of extra reference causedby early
++			 * exit from qla2xxx_eh_abort
++			 */
++			if (status =3D=3D FAST_IO_FAIL)
++				atomic_dec(&sp->ref_count);
+ 		}
+ 	}
+ 	sp->done(sp, res);
+ }
+=20
  static void
  __qla2x00_abort_all_cmds(struct qla_qpair *qp, int res)
  {

--Sig_/tWFfAALYS_p+LreYcNwSvG0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwOETgACgkQAVBC80lX
0GxOmAgAjYkb1y2sk+o5lldWva1EcGz3nDY9D91DZjFOlH3WDHQkAyHUg4zXhsDh
9SCren51iBIn8vG0vE8t9O2dyiEt6WXY6JdMwfhef0tauHS8T9oAIUHeFDYsKz+1
4yMqS5nuOGm/QfosW+T/xNEQxyc7HxJ/FQybt/np3syKETcuNfqj2+e2V0sit1U8
sVt7hhE7fabTTpUMEwNkepb9Lyr59boqv5Dtc/UvERjKbZ9F9C4+2FV9K8vlQ8J0
lIC8qDTWLlD2DmpWp2ep+Kxi0EdzmNVM1NNlMTAaRSJd3yLM47yvZ9rTlxoJ1y9N
04cA0FMfPQxuy869dtVGX96E45QLMg==
=nohu
-----END PGP SIGNATURE-----

--Sig_/tWFfAALYS_p+LreYcNwSvG0--
