From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with Linus'
 tree
Date: Tue, 3 Feb 2015 15:59:44 +1100
Message-ID: <20150203155944.21834ee3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fUNU_cIkov.HSFGhCdrFGu8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/fUNU_cIkov.HSFGhCdrFGu8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in
drivers/vhost/scsi.c between commit 46243860806b ("vhost-scsi: Add
missing virtio-scsi -> TCM attribute conversion") from Linus' tree and
commit 2936f1d4f3e8 ("vhost/scsi: Global tcm_vhost -> vhost_scsi
rename") from the target-updates tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/vhost/scsi.c
index d695b1673ae5,57a6f0ac4c55..000000000000
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@@ -911,28 -938,11 +938,28 @@@ vhost_scsi_mapal(struct vhost_scsi_cmd=20
  	return 0;
  }
 =20
 +static int vhost_scsi_to_tcm_attr(int attr)
 +{
 +	switch (attr) {
 +	case VIRTIO_SCSI_S_SIMPLE:
 +		return TCM_SIMPLE_TAG;
 +	case VIRTIO_SCSI_S_ORDERED:
 +		return TCM_ORDERED_TAG;
 +	case VIRTIO_SCSI_S_HEAD:
 +		return TCM_HEAD_TAG;
 +	case VIRTIO_SCSI_S_ACA:
 +		return TCM_ACA_TAG;
 +	default:
 +		break;
 +	}
 +	return TCM_SIMPLE_TAG;
 +}
 +
- static void tcm_vhost_submission_work(struct work_struct *work)
+ static void vhost_scsi_submission_work(struct work_struct *work)
  {
- 	struct tcm_vhost_cmd *cmd =3D
- 		container_of(work, struct tcm_vhost_cmd, work);
- 	struct tcm_vhost_nexus *tv_nexus;
+ 	struct vhost_scsi_cmd *cmd =3D
+ 		container_of(work, struct vhost_scsi_cmd, work);
+ 	struct vhost_scsi_nexus *tv_nexus;
  	struct se_cmd *se_cmd =3D &cmd->tvc_se_cmd;
  	struct scatterlist *sg_ptr, *sg_prot_ptr =3D NULL;
  	int rc;

--Sig_/fUNU_cIkov.HSFGhCdrFGu8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0FXFAAoJEMDTa8Ir7ZwVntQP/0PhDZHH6rSs+OC7oEQrrriY
jg0kpHTs61V5Hs3pzseGKTrnWME8kQRrzL1jGgxih54AzF3kTQ5A3UrWi0NWGoxQ
q8lxNs9I/gh5ltzTLhhyJKzGdhChR2JMpVWEiCrGTCIt8tjjwRT9sHneR1R5WHCz
pjLKscDJFWVQQ+risXKOINdjvZ9gismPKiqGxTcWohr8VVhiExXtEnHHKygoBVJT
dC6iH8uLhh/5vdGXjSffMLtJahlX5tdv8ED/DsWysN3QgiXaFQf/IKOX9UVgkR1I
6b4b0sqJBowB/Gs27U5KnhpI4U/3xYxg06xnqx/+jOWhdiXiPIlJW+8CIHE9qbIS
xD6pAFFXjatP6UIWPOMSLXQ+wp3zrXLZFQeuC5+w4sOdwH3nkcxC2GyrBrY2aFUV
KT01MsZEHX2lt1W62O5JX0fX7oDSvxKMSAWgIdi0BpeE88EiXs4kd13jDeETzdim
p5IEsPFxULuWx1n0B6k1cH4+MMOq2G04jug/xzVSzX2cm0x7wZS5ytUb0EMsIF3X
erPMdskZMntqu8XFbSez1Gwm8ks3Ckt+QNdROI/66DCLIXzd8FcUXJOr3z2uUyhj
d/wapdk6LohRWvQ0oydtYHtJGTgOH9UFQurA5CfA7JygvXgj0Rfe5wqqVaE14MPG
s8A1D5QgQ+NkJJmOWZNe
=BR6s
-----END PGP SIGNATURE-----

--Sig_/fUNU_cIkov.HSFGhCdrFGu8--
