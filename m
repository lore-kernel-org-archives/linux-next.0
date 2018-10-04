From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nfsd tree
Date: Fri, 5 Oct 2018 09:54:37 +1000
Message-ID: <20181005095420.184c2619@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/S8UFiK7fsrvx3VuTVLrq.2/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "J. Bruce Fields" <bfields@fieldses.org>, Trond Myklebust <trondmy@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/S8UFiK7fsrvx3VuTVLrq.2/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfsd tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

net/sunrpc/xprtrdma/svc_rdma_backchannel.c: In function 'svc_rdma_handle_bc=
_reply':
net/sunrpc/xprtrdma/svc_rdma_backchannel.c:67:21: error: 'struct rpc_xprt' =
has no member named 'recv_lock'; did you mean 'reserve_lock'?
  spin_unlock(&xprt->recv_lock);
                     ^~~~~~~~~
                     reserve_lock
net/sunrpc/xprtrdma/svc_rdma_backchannel.c:79:19: error: 'struct rpc_xprt' =
has no member named 'recv_lock'; did you mean 'reserve_lock'?
  spin_lock(&xprt->recv_lock);
                   ^~~~~~~~~
                   reserve_lock

Caused by commit

  cf4f6fd48dac ("svcrdma: Remove ->release_rqst call in bc reply handler")

interacting with commit

  75c84151a9dc ("SUNRPC: Rename xprt->recv_lock to xprt->queue_lock")

from the nfs tree.

I have added the following merge fix patch for today:

=46rom b249a74ca8c4f992e2530f95218ea4f2ed72e0b9 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 5 Oct 2018 09:51:30 +1000
Subject: [PATCH] svcrdma: fix up for recv_lock rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/sunrpc/xprtrdma/svc_rdma_backchannel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sunrpc/xprtrdma/svc_rdma_backchannel.c b/net/sunrpc/xprtrd=
ma/svc_rdma_backchannel.c
index 19e34a6aa583..2d176a48543a 100644
--- a/net/sunrpc/xprtrdma/svc_rdma_backchannel.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_backchannel.c
@@ -64,7 +64,7 @@ int svc_rdma_handle_bc_reply(struct rpc_xprt *xprt, __be3=
2 *rdma_resp,
 		goto out_unlock;
 	memcpy(dst->iov_base, p, len);
 	xprt_pin_rqst(req);
-	spin_unlock(&xprt->recv_lock);
+	spin_unlock(&xprt->queue_lock);
=20
 	credits =3D be32_to_cpup(rdma_resp + 2);
 	if (credits =3D=3D 0)
@@ -76,7 +76,7 @@ int svc_rdma_handle_bc_reply(struct rpc_xprt *xprt, __be3=
2 *rdma_resp,
 	xprt->cwnd =3D credits << RPC_CWNDSHIFT;
 	spin_unlock_bh(&xprt->transport_lock);
=20
-	spin_lock(&xprt->recv_lock);
+	spin_lock(&xprt->queue_lock);
 	ret =3D 0;
 	xprt_complete_rqst(req->rq_task, rcvbuf->len);
 	xprt_unpin_rqst(req);
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/S8UFiK7fsrvx3VuTVLrq.2/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu2qD0ACgkQAVBC80lX
0Gxj2wgAik9JkgSUekw14i6iTUdXDMUXdvWxnIcDn2r7rJjCkljvjMI+waXTZfwU
0lvtyij6eFnbd0Zke1Uf82Th4d9+OpLEza8/Ntgizk3Kwl94FXkIv4T/K28trf3a
hpIzA/hu5hUS9XiZjlKnJo3wAsKs3qAaDxpEOl3FlzdumJAAoBn66dU2iZXe5soJ
vlctNGQVAvR3eJMjh2W072BMBhfPbJzLod4rz0vENopq3E8DvycTN+bapA2IAcLN
Svfm6hNP8Ns7Y8Ll4t+3UOt7Q9yJlhMAYs9WvKQNSXp4HOw18ulZ1el+UPoaeDNf
F0GFDwRnKf8XUudYyRWVhfmuj4Xrxw==
=KsQQ
-----END PGP SIGNATURE-----

--Sig_/S8UFiK7fsrvx3VuTVLrq.2/--
