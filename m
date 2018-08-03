From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Fri, 3 Aug 2018 16:22:21 +1000
Message-ID: <20180803162221.592b28ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/T.iUSQKRSyEAvevtt4Z4Bn7"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Quinn Tran <quinn.tran@cavium.com>, Himanshu Madhani <himanshu.madhani@cavium.com>
List-Id: linux-next.vger.kernel.org

--Sig_/T.iUSQKRSyEAvevtt4Z4Bn7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/qla2xxx/qla_init.c

between commit:

  36eb8ff672fa ("scsi: qla2xxx: Fix NULL pointer dereference for fcport sea=
rch")

from Linus' tree and commit:

  48acad099074 ("scsi: qla2xxx: Fix N2N link re-connect")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Martin, thanks for the heads up, but I think my resolution below is more
correct than the one you were supplied with as the ql_dbg() function
needs this many arguments.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/qla2xxx/qla_init.c
index 1b19b954bbae,f52c68b4da44..000000000000
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@@ -578,34 -693,76 +693,79 @@@ static void qla24xx_handle_gnl_done_eve
  	}
 =20
  	if (!found) {
- 		/* fw has no record of this port */
- 		for (i =3D 0; i < n; i++) {
- 			e =3D &vha->gnl.l[i];
- 			id.b.domain =3D e->port_id[0];
- 			id.b.area =3D e->port_id[1];
- 			id.b.al_pa =3D e->port_id[2];
- 			id.b.rsvd_1 =3D 0;
- 			loop_id =3D le16_to_cpu(e->nport_handle);
-=20
- 			if (fcport->d_id.b24 =3D=3D id.b24) {
- 				conflict_fcport =3D
- 					qla2x00_find_fcport_by_wwpn(vha,
- 					    e->port_name, 0);
- 				if (conflict_fcport) {
- 					qlt_schedule_sess_for_deletion
- 						(conflict_fcport);
- 					ql_dbg(ql_dbg_disc, vha, 0x20e6,
- 					    "%s %d %8phC post del sess\n",
- 					    __func__, __LINE__,
- 					    conflict_fcport->port_name);
+ 		switch (vha->hw->current_topology) {
+ 		case ISP_CFG_F:
+ 		case ISP_CFG_FL:
+ 			for (i =3D 0; i < n; i++) {
+ 				e =3D &vha->gnl.l[i];
+ 				id.b.domain =3D e->port_id[0];
+ 				id.b.area =3D e->port_id[1];
+ 				id.b.al_pa =3D e->port_id[2];
+ 				id.b.rsvd_1 =3D 0;
+ 				loop_id =3D le16_to_cpu(e->nport_handle);
+=20
+ 				if (fcport->d_id.b24 =3D=3D id.b24) {
+ 					conflict_fcport =3D
+ 					    qla2x00_find_fcport_by_wwpn(vha,
+ 						e->port_name, 0);
 -					ql_dbg(ql_dbg_disc + ql_dbg_verbose,
 -					    vha, 0x20e5,
 -					    "%s %d %8phC post del sess\n",
 -					    __func__, __LINE__,
 -					    conflict_fcport->port_name);
 -					qlt_schedule_sess_for_deletion
 -						(conflict_fcport);
++					if (conflict_fcport) {
++						ql_dbg(ql_dbg_disc +
++						    ql_dbg_verbose,
++						    vha, 0x20e5,
++						    "%s %d %8phC post del sess\n",
++						    __func__, __LINE__,
++						    conflict_fcport->port_name);
++						qlt_schedule_sess_for_deletion
++							(conflict_fcport);
++					}
  				}
+ 				/*
+ 				 * FW already picked this loop id for
+ 				 * another fcport
+ 				 */
+ 				if (fcport->loop_id =3D=3D loop_id)
+ 					fcport->loop_id =3D FC_NO_LOOP_ID;
  			}
-=20
- 			/* FW already picked this loop id for another fcport */
- 			if (fcport->loop_id =3D=3D loop_id)
- 				fcport->loop_id =3D FC_NO_LOOP_ID;
+ 			qla24xx_fcport_handle_login(vha, fcport);
+ 			break;
+ 		case ISP_CFG_N:
+ 			fcport->disc_state =3D DSC_DELETED;
+ 			if (time_after_eq(jiffies, fcport->dm_login_expire)) {
+ 				if (fcport->n2n_link_reset_cnt < 2) {
+ 					fcport->n2n_link_reset_cnt++;
+ 					/*
+ 					 * remote port is not sending PLOGI.
+ 					 * Reset link to kick start his state
+ 					 * machine
+ 					 */
+ 					set_bit(N2N_LINK_RESET,
+ 					    &vha->dpc_flags);
+ 				} else {
+ 					if (fcport->n2n_chip_reset < 1) {
+ 						ql_log(ql_log_info, vha, 0x705d,
+ 						    "Chip reset to bring laser down");
+ 						set_bit(ISP_ABORT_NEEDED,
+ 						    &vha->dpc_flags);
+ 						fcport->n2n_chip_reset++;
+ 					} else {
+ 						ql_log(ql_log_info, vha, 0x705d,
+ 						    "Remote port %8ph is not coming back\n",
+ 						    fcport->port_name);
+ 						fcport->scan_state =3D 0;
+ 					}
+ 				}
+ 				qla2xxx_wake_dpc(vha);
+ 			} else {
+ 				/*
+ 				 * report port suppose to do PLOGI. Give him
+ 				 * more time. FW will catch it.
+ 				 */
+ 				set_bit(RELOGIN_NEEDED, &vha->dpc_flags);
+ 			}
+ 			break;
+ 		default:
+ 			break;
  		}
- 		qla24xx_fcport_handle_login(vha, fcport);
  	}
  } /* gnl_event */
 =20

--Sig_/T.iUSQKRSyEAvevtt4Z4Bn7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltj9J0ACgkQAVBC80lX
0GyRyggAgkBqK0f+dsVIJKZYcKovMeP4k+qTKLtk+EITtlIhG/NywJE6noB8nv64
yVNtJhHQ2NF7tkfJmr1LcO9gbPMlQwNYOGF0IpTRj67wVwmvGlioMI9rrRMe8H0d
BFS7JitNf1tYd/m4bnHwgmItY0RX9yGWD0cfoLEIl5W4d7Fo/VI+eAZFwI3PLHZf
PByDznFFgCBWpcacPiADUvWLey44n2OkjxW8ucZ4RN+Qfon+Fc5mew7otUJxfyG8
aurwKQEbdjYU9MgJcnQgxEhOrOsgtgzTtPYg5IFSl3ddURAVv7aOgoZtiexVhIFe
CvUSXmhq2QnT4XS6DbuxPexHXpXkZw==
=6g7F
-----END PGP SIGNATURE-----

--Sig_/T.iUSQKRSyEAvevtt4Z4Bn7--
