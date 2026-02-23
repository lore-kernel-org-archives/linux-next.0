Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1F366DD5;
	Mon, 23 Feb 2026 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771872531; cv=none; b=VtD88bOgUKFQrtNxk3oRW73gtSKlI3bgZsnWB6fnX4XNntluauplJxPrQ1e4D+PIdi5k1NKuE5gmYwDovoC8XLIbJ0Y0uh6E3UpIli3AQJDFt6WKoQNaucxcfTu5hIiOPpGAFvWYoFeanhophgAC4CgeXDlqbwyCsxImRQUGLpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771872531; c=relaxed/simple;
	bh=JtbFDM7WjuI/7Hr+yPjLM2J761mXUzMOmE4fh+JSMxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHvzkMj6FLxofCNx+U7Q/wfB9tzzu4or8kibYQoiKBAOv3BlvdM0ucJDFfEfm3PSRrCsMZzxp0gdML+dSQcAP9uNVoggKPkYp+aUPJPOWeCAtWCHHs+UHh4XU4M2nKotD4/6d7xVGnZ47tPVi2cDtHP6AYxdqFz0eooaviBL2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqdCN925; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqdCN925"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2FFC116C6;
	Mon, 23 Feb 2026 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771872531;
	bh=JtbFDM7WjuI/7Hr+yPjLM2J761mXUzMOmE4fh+JSMxk=;
	h=Date:From:To:Cc:Subject:From;
	b=qqdCN925frY92DgtmwmKSKyNFOFVNp08ZR60n6+AKvFcLNL6oINSCitrddwYCaTOi
	 zMgxWEbaom5ENQ4j4weJs/rjrJdDQHzSc8H/qN0v2fSZ2eXjp8frZPNe55wTrwC/c1
	 9oSfBetVlgasj5fcgu8Sd6gBoiRBkVMcDIq1kEakzKrjRhc9LLV/4TsFyOLnQaHCud
	 hOwVfqtdXYpAZPBBm4QvsXmXYuUjsKAp5sBrr2d+a3jjpPkTJ+csKvkAs2OyKG4quj
	 swarDd5nqIlIUyNq0WwyU8Z2NK52uqXtWUzwU8SJowqvVddkVDfOhEUoxB++pbnGcx
	 OJmdXTHtA6tsA==
Date: Mon, 23 Feb 2026 18:48:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Yishai Hadas <yishaih@nvidia.com>,
	Edward Srouji <edwards@nvidia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <aZyhDuaF5vi05KBY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rDEVY5bnA85zyF2e"
Content-Disposition: inline


--rDEVY5bnA85zyF2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c: In function 'rdma=
_user_mmap_entry_remove':
/tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c:249:17: error: imp=
licit declaration of function 'dma_buf_move_notify' [-Wimplicit-function-de=
claration]
  249 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
      |                 ^~~~~~~~~~~~~~~~~~~
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/infiniban=
d/core/ib_core_uverbs.o] Error 1
make[6]: *** Waiting for unfinished jobs....
/tmp/next/build/drivers/infiniband/core/uverbs_std_types_dmabuf.c: In funct=
ion 'uverbs_dmabuf_fd_destroy_uobj':
/tmp/next/build/drivers/infiniband/core/uverbs_std_types_dmabuf.c:170:17: e=
rror: implicit declaration of function 'dma_buf_move_notify' [-Wimplicit-fu=
nction-declaration]
  170 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
      |                 ^~~~~~~~~~~~~~~~~~~
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/infiniban=
d/core/uverbs_std_types_dmabuf.o] Error 1

Caused by commit

  95308225e5bae (dma-buf: Rename dma_buf_move_notify() to dma_buf_invalidat=
e_mappings())

interacting with

  0ac6f4056c4a2 (RDMA/uverbs: Add DMABUF object type and operations)

=66rom Linus' tree.  I have fixed this up as below and can carry as
needed.

=46rom 89e7d4987e08a46f2db151cebba258a1bc01d628 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Mon, 23 Feb 2026 18:27:51 +0000
Subject: [PATCH] RDMA/uverbs: Update for semantic conflict with drm-misc

/tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c: In function 'rdma=
_user_mmap_entry_remove':
/tmp/next/build/drivers/infiniband/core/ib_core_uverbs.c:249:17: error: imp=
licit declaration of function 'dma_buf_move_notify' [-Wimplicit-function-de=
claration]
  249 |                 dma_buf_move_notify(uverbs_dmabuf->dmabuf);
      |                 ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/infiniband/core/ib_core_uverbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/ib_core_uverbs.c b/drivers/infiniband/=
core/ib_core_uverbs.c
index d3836a62a0049..d6e99c79cf183 100644
--- a/drivers/infiniband/core/ib_core_uverbs.c
+++ b/drivers/infiniband/core/ib_core_uverbs.c
@@ -246,7 +246,7 @@ void rdma_user_mmap_entry_remove(struct rdma_user_mmap_=
entry *entry)
 		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
 		list_del(&uverbs_dmabuf->dmabufs_elm);
 		uverbs_dmabuf->revoked =3D true;
-		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
+		dma_buf_invalidate_mappings(uverbs_dmabuf->dmabuf);
 		dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
 				      DMA_RESV_USAGE_BOOKKEEP, false,
 				      MAX_SCHEDULE_TIMEOUT);
diff --git a/drivers/infiniband/core/uverbs_std_types_dmabuf.c b/drivers/in=
finiband/core/uverbs_std_types_dmabuf.c
index dfdfcd1d1a446..149220a1599cf 100644
--- a/drivers/infiniband/core/uverbs_std_types_dmabuf.c
+++ b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
@@ -167,7 +167,7 @@ static void uverbs_dmabuf_fd_destroy_uobj(struct ib_uob=
ject *uobj,
        if (!uverbs_dmabuf->revoked) {
                uverbs_dmabuf->revoked =3D true;
                list_del(&uverbs_dmabuf->dmabufs_elm);
-               dma_buf_move_notify(uverbs_dmabuf->dmabuf);
+               dma_buf_invalidate_mappings(uverbs_dmabuf->dmabuf);
                dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
                                      DMA_RESV_USAGE_BOOKKEEP, false,
                                      MAX_SCHEDULE_TIMEOUT);

--=20
2.47.3


--rDEVY5bnA85zyF2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcoQ0ACgkQJNaLcl1U
h9APZAgAhL9bq8QpFXnRk85LCkfVsVbf+MEC+n+rsCUsOWl0D9OzAP4MB4SKjarG
mXweGrr+1Gq8jZcK6VnebpVR+n4C9ZHOj9meGGmzTcpClG7uhn9Cs838sBKoWsm2
lHWWv5EKgCwohLMHG+hXHJh9H2kSN3+5O39N3UmD0ExAhShW+tGxEIm3Rbt0dHxT
ASBNx1Vl8Hg5mnll67PGg7BXHvl4C5kFIirhtWy+K9+5YuVQGl4nIV4GFcIPyRNZ
+pHi4gUDNRR0qlZ8qIUDtpAZfYA4Mo9ga7uMhYM8kVt6eOTVnspS/zYEBS1Ijxcm
oyhRSQqKjLVkWg1XikKF78W0yl/HQg==
=ICkP
-----END PGP SIGNATURE-----

--rDEVY5bnA85zyF2e--
