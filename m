From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the rdma tree
Date: Thu, 26 Jul 2018 13:58:04 +1000
Message-ID: <20180726135804.0257047e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TyzPvo+v9l0M=mmd.560WtY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>, Max Gurtovoy <maxg@mellanox.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/TyzPvo+v9l0M=mmd.560WtY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/target/rdma.c

between commit:

  23f96d1f15a7 ("nvmet-rdma: Simplify ib_post_(send|recv|srq_recv)() calls")
  202093848cac ("nvmet-rdma: add an error flow for post_recv failures")

from the rdma tree and commits:

  2fc464e2162c ("nvmet-rdma: add unlikely check in the fast path")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/target/rdma.c
index 1a642e214a4c,e7f43d1e1779..000000000000
--- a/drivers/nvme/target/rdma.c
+++ b/drivers/nvme/target/rdma.c
@@@ -382,13 -435,22 +435,21 @@@ static void nvmet_rdma_free_rsps(struc
  static int nvmet_rdma_post_recv(struct nvmet_rdma_device *ndev,
  		struct nvmet_rdma_cmd *cmd)
  {
 -	struct ib_recv_wr *bad_wr;
+ 	int ret;
+=20
  	ib_dma_sync_single_for_device(ndev->device,
  		cmd->sge[0].addr, cmd->sge[0].length,
  		DMA_FROM_DEVICE);
 =20
  	if (ndev->srq)
- 		return ib_post_srq_recv(ndev->srq, &cmd->wr, NULL);
- 	return ib_post_recv(cmd->queue->cm_id->qp, &cmd->wr, NULL);
 -		ret =3D ib_post_srq_recv(ndev->srq, &cmd->wr, &bad_wr);
++		ret =3D ib_post_srq_recv(ndev->srq, &cmd->wr, NULL);
+ 	else
 -		ret =3D ib_post_recv(cmd->queue->cm_id->qp, &cmd->wr, &bad_wr);
++		ret =3D ib_post_recv(cmd->queue->cm_id->qp, &cmd->wr, NULL);
+=20
+ 	if (unlikely(ret))
+ 		pr_err("post_recv cmd failed\n");
+=20
+ 	return ret;
  }
 =20
  static void nvmet_rdma_process_wr_wait_list(struct nvmet_rdma_queue *queu=
e)
@@@ -491,7 -553,7 +552,7 @@@ static void nvmet_rdma_queue_response(s
  		rsp->send_sge.addr, rsp->send_sge.length,
  		DMA_TO_DEVICE);
 =20
- 	if (ib_post_send(cm_id->qp, first_wr, NULL)) {
 -	if (unlikely(ib_post_send(cm_id->qp, first_wr, &bad_wr))) {
++	if (unlikely(ib_post_send(cm_id->qp, first_wr, NULL))) {
  		pr_err("sending cmd response failed\n");
  		nvmet_rdma_release_rsp(rsp);
  	}

--Sig_/TyzPvo+v9l0M=mmd.560WtY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltZRswACgkQAVBC80lX
0GyQXwf/bCGiW/XmxnWraE5HkRxiHOWEB0lmzJ73QnKLMTr7whW+fME7mDSY+NtH
OYgfILj8vHAdH2ZFN4/VmBafac/QvrY6ydaFZSQcyOA7bagPyiskOVD5aP3Q4PaC
srjRVP18yhd3Am6hozOYGhvblCkbMD/Lrk270/YF4bIq7ElxnZGb3QN5LaXmEFi3
n6OaCxy/q0M2HcSVnBwwhgnZv6YQHxp7QwJ3LeKh5NCDMk0hRPVlxGviVG09b5n1
y2qIeLWerx5weJqLkz5OXXwdCRieD+KJ2HCn4/ekXTr8Luc+tjAvULCVToMyCt6x
lSmcj38DzgbHmKFPus0puLZnJLKKUA==
=l9sh
-----END PGP SIGNATURE-----

--Sig_/TyzPvo+v9l0M=mmd.560WtY--
