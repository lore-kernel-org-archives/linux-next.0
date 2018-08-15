From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
Date: Wed, 15 Aug 2018 11:45:39 +1000
Message-ID: <20180815114539.34e066e1@canb.auug.org.au>
References: <20180726135804.0257047e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uGvrInghv6l22HbdGxyUkCh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726135804.0257047e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>, Max Gurtovoy <maxg@mellanox.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/uGvrInghv6l22HbdGxyUkCh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 26 Jul 2018 13:58:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   drivers/nvme/target/rdma.c
>=20
> between commit:
>=20
>   23f96d1f15a7 ("nvmet-rdma: Simplify ib_post_(send|recv|srq_recv)() call=
s")
>   202093848cac ("nvmet-rdma: add an error flow for post_recv failures")
>=20
> from the rdma tree and commits:
>=20
>   2fc464e2162c ("nvmet-rdma: add unlikely check in the fast path")
>=20
> from the block tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/nvme/target/rdma.c
> index 1a642e214a4c,e7f43d1e1779..000000000000
> --- a/drivers/nvme/target/rdma.c
> +++ b/drivers/nvme/target/rdma.c
> @@@ -382,13 -435,22 +435,21 @@@ static void nvmet_rdma_free_rsps(struc
>   static int nvmet_rdma_post_recv(struct nvmet_rdma_device *ndev,
>   		struct nvmet_rdma_cmd *cmd)
>   {
>  -	struct ib_recv_wr *bad_wr;
> + 	int ret;
> +=20
>   	ib_dma_sync_single_for_device(ndev->device,
>   		cmd->sge[0].addr, cmd->sge[0].length,
>   		DMA_FROM_DEVICE);
>  =20
>   	if (ndev->srq)
> - 		return ib_post_srq_recv(ndev->srq, &cmd->wr, NULL);
> - 	return ib_post_recv(cmd->queue->cm_id->qp, &cmd->wr, NULL);
>  -		ret =3D ib_post_srq_recv(ndev->srq, &cmd->wr, &bad_wr);
> ++		ret =3D ib_post_srq_recv(ndev->srq, &cmd->wr, NULL);
> + 	else
>  -		ret =3D ib_post_recv(cmd->queue->cm_id->qp, &cmd->wr, &bad_wr);
> ++		ret =3D ib_post_recv(cmd->queue->cm_id->qp, &cmd->wr, NULL);
> +=20
> + 	if (unlikely(ret))
> + 		pr_err("post_recv cmd failed\n");
> +=20
> + 	return ret;
>   }
>  =20
>   static void nvmet_rdma_process_wr_wait_list(struct nvmet_rdma_queue *qu=
eue)
> @@@ -491,7 -553,7 +552,7 @@@ static void nvmet_rdma_queue_response(s
>   		rsp->send_sge.addr, rsp->send_sge.length,
>   		DMA_TO_DEVICE);
>  =20
> - 	if (ib_post_send(cm_id->qp, first_wr, NULL)) {
>  -	if (unlikely(ib_post_send(cm_id->qp, first_wr, &bad_wr))) {
> ++	if (unlikely(ib_post_send(cm_id->qp, first_wr, NULL))) {
>   		pr_err("sending cmd response failed\n");
>   		nvmet_rdma_release_rsp(rsp);
>   	}

This is now a conflict between Linus' tree and the rdma tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/uGvrInghv6l22HbdGxyUkCh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltzhcMACgkQAVBC80lX
0Gz5Twf/WTBitw/e7LzZv6VSBRZGzjVM1u6Z9lkiDtilGfxLVlZVb/TYCQ40liZ+
CmffmEIVejwXqC3SRQpByXBVUfELeXNJlHHBK6gWXt7uo63NSkqbCHY04fUM1I3n
cAoExhVg6Qggxf4xJ2Qs0hKxIam6Ms7RRqIGACcI93pGO9YbPvYy8To9EdBsx1x0
FTQpPOKvlkU9p0MZCZ6lYt1zCGiJcEsYsdVf7cGrRYI0gFdqsfVhVH00SxMrsLKd
+rJr1D5Ev7x04kg/7grU0qVZn0e5+pLFytIKvRCDSIBNYxj1S2RPorb+y7fVU8oH
8qK6xWqDBCMzp27ukRri+kU/ZeUgoQ==
=WcCg
-----END PGP SIGNATURE-----

--Sig_/uGvrInghv6l22HbdGxyUkCh--
