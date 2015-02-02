From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with Linus'
 tree
Date: Mon, 2 Feb 2015 17:35:15 +1100
Message-ID: <20150202173515.473231a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zXx04GchQddatI3Bnr4SZEw"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44879 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752318AbbBBGfW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2015 01:35:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/zXx04GchQddatI3Bnr4SZEw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in
drivers/vhost/scsi.c between commit 46243860806b ("vhost-scsi: Add
missing virtio-scsi -> TCM attribute conversion") from Linus' tree and
commit 6df22d68ecaf ("vhost/scsi: Add ANY_LAYOUT prerequisites") from
the target-updates tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/vhost/scsi.c
index d695b1673ae5,a773af3550ee..000000000000
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@@ -911,23 -911,111 +911,128 @@@ vhost_scsi_map_iov_to_prot(struct tcm_v
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
+ static int
+ vhost_scsi_calc_sgls(struct iovec *iov, size_t off, size_t bytes,
+ 		     int *niov, int max_sgls)
+ {
+ 	size_t tmp =3D 0;
+ 	int sgl_count =3D 0;
+=20
+ 	*niov =3D 0;
+=20
+ 	while (tmp < bytes) {
+ 		void __user *base =3D iov[*niov].iov_base + off;
+ 		size_t len =3D iov[(*niov)++].iov_len - off;
+=20
+ 		sgl_count +=3D iov_num_pages(base, len);
+ 		tmp +=3D min(len, bytes);
+ 		off =3D 0;
+ 	}
+ 	if (sgl_count > max_sgls) {
+ 		pr_err("%s: requested sgl_count: %d exceeds pre-allocated"
+ 		       " max_sgls: %d\n", __func__, sgl_count, max_sgls);
+ 		return -ENOBUFS;
+ 	}
+ 	return sgl_count;
+ }
+=20
+ static int
+ vhost_scsi_iov_to_sgl(struct tcm_vhost_cmd *cmd, bool write,
+ 		      struct iovec *iov, size_t iov_off, int niov,
+ 		      struct scatterlist *sg, int sg_count)
+ {
+ 	int i, ret;
+=20
+ 	for (i =3D 0; i < niov; i++) {
+ 		void __user *base =3D iov[i].iov_base + iov_off;
+ 		size_t len =3D iov[i].iov_len - iov_off;
+=20
+ 		ret =3D vhost_scsi_map_to_sgl(cmd, base, len, sg, write);
+ 		if (ret < 0) {
+ 			for (i =3D 0; i < sg_count; i++) {
+ 				struct page *page =3D sg_page(&sg[i]);
+ 				if (page)
+ 					put_page(page);
+ 			}
+ 			return ret;
+ 		}
+ 		sg +=3D ret;
+ 		iov_off =3D 0;
+ 	}
+ 	return 0;
+ }
+=20
+ static int
+ vhost_scsi_mapal(struct tcm_vhost_cmd *cmd,
+ 		 size_t prot_bytes, struct iovec *prot_iov, size_t prot_off,
+ 		 size_t data_bytes, struct iovec *data_iov, size_t data_off)
+ {
+ 	int data_sgl_count =3D 0, niov, ret;
+ 	bool write =3D (cmd->tvc_data_direction =3D=3D DMA_FROM_DEVICE);
+=20
+ 	if (prot_bytes) {
+ 		int prot_sgl_count;
+=20
+ 		if (!prot_iov) {
+ 			pr_err("%s: prot_iov is NULL, but prot_bytes: %zu"
+ 			       "present\n", __func__, prot_bytes);
+ 			return -EINVAL;
+ 		}
+ 		prot_sgl_count =3D vhost_scsi_calc_sgls(prot_iov, prot_off,
+ 						      prot_bytes, &niov,
+ 						      TCM_VHOST_PREALLOC_PROT_SGLS);
+ 		if (prot_sgl_count < 0)
+ 			return prot_sgl_count;
+=20
+ 		sg_init_table(cmd->tvc_prot_sgl, prot_sgl_count);
+ 		cmd->tvc_prot_sgl_count =3D prot_sgl_count;
+ 		pr_debug("%s prot_sg %p prot_sgl_count %u\n", __func__,
+ 			 cmd->tvc_prot_sgl, cmd->tvc_prot_sgl_count);
+=20
+ 		ret =3D vhost_scsi_iov_to_sgl(cmd, write, prot_iov, prot_off,
+ 					    niov, cmd->tvc_prot_sgl,
+ 					    prot_sgl_count);
+ 		if (ret < 0) {
+ 			cmd->tvc_prot_sgl_count =3D 0;
+ 			return ret;
+ 		}
+ 	}
+ 	if (!data_iov) {
+ 		pr_err("%s: data_iov is NULL, but data_bytes: %zu present\n",
+ 		       __func__, data_bytes);
+ 		return -EINVAL;
+ 	}
+ 	data_sgl_count =3D vhost_scsi_calc_sgls(data_iov, data_off, data_bytes,
+ 					      &niov, TCM_VHOST_PREALLOC_SGLS);
+ 	if (data_sgl_count < 0)
+ 		return data_sgl_count;
+=20
+ 	sg_init_table(cmd->tvc_sgl, data_sgl_count);
+ 	cmd->tvc_sgl_count =3D data_sgl_count;
+ 	pr_debug("%s data_sg %p data_sgl_count %u\n", __func__,
+ 		  cmd->tvc_sgl, cmd->tvc_sgl_count);
+=20
+ 	return vhost_scsi_iov_to_sgl(cmd, write, data_iov, data_off,
+ 				     niov, cmd->tvc_sgl, data_sgl_count);
+ }
+=20
  static void tcm_vhost_submission_work(struct work_struct *work)
  {
  	struct tcm_vhost_cmd *cmd =3D

--Sig_/zXx04GchQddatI3Bnr4SZEw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUzxqoAAoJEMDTa8Ir7ZwVgk0QAIuU2pvqp0wHMFMvWlnWeDAQ
yFpWRVmNuxQBYw0tdvF9/dzI/EJJGBezhAyd2TaytxpQmL4+dnGOOEyVpAuuQIt1
iwpXdS6HJbtmcKEBd/+vcFTKrInxGYemH9/TcvKeH2igA6j/+2CiVkg7st3nzwO/
mstZOyTwntYd90ls9RGQtvYjmmz+ro44nbNrZNvgSm7indWWCqw9eY7/m5X8/LnD
Sxp94is63GXvnsl2nVIlSFZiVN3w5fsTUAv35fCdX3Jqkr2rmJWB7RJ1pfsSxe0+
TKIoawSbRFqzJiF3I2tFZsdhg9HPxyyibF20s1NaGA+MhFGosltxudonSn5MZsk4
zxZDqODslpwAFJFcCZbnPRbzILeAJU0PJFs/+muHJLhkjxAz2fJMY3oA/lb/sUAr
IdQXbNbQePnD7qpC8kQwqGe7MJOg+h1SJlaZXfTvLhYLPa1FMGJ8gAGVH6BwHP3X
C1t3J2Irev1jLzx5/o9vrSn/scGzol5NeuC3PRx+e97BIqB6SByjvKjF7TgvV4d2
8A3FLr8nDBh63fZP5G4oWhmoOBcIslwFN87mSweTBTdxSQfnmePoK94ExLFP5vrZ
01johm9Bly+7hs8Nmve8rO6BSMmnA73QivnPmrEb181Khr7lC1VNoEfFsLB+kfJ0
V7qkWZJk7OJWy1N0jsF0
=3EoD
-----END PGP SIGNATURE-----

--Sig_/zXx04GchQddatI3Bnr4SZEw--
