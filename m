Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6D3C13F5;
	Fri, 10 Apr 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823697; cv=none; b=q+27FXzHS4F6s2GS9m+TcSti+oDa/cH+nhaPiCUbTrTJ8kYPPO8gexx+NHumlZxF1i1JNHIHrOd0ciqzbpe9d8ogtaF4VnK0Mc72iATNxIfPSTMxWj/mOSC/ovLLbltVmPwKvYwTxhZvhdhr2F1JX1VckJUPjGhT0WaDGUgfH24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823697; c=relaxed/simple;
	bh=UeWG0yDrzQoi1cCkOpdfbz7c8/Fa7MrSlmABUUDoFvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u8AhfeG3/Yku2YUJNchgUPOfNjXTDAQpm8+WU6ZCMEDpycCuyqM4zuCbXVxfNPr8WO8Fy+TbGp9UriZJwn0C5wMw/fQpPNIxE4vE7bUsIni2dn9xUm+NuYiGINgXYtyocm7T98JKlJ4bF8egqWmd83CK1NY51QvjiEQueGtCfhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMEqKSvl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMEqKSvl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109D6C2BCB0;
	Fri, 10 Apr 2026 12:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823697;
	bh=UeWG0yDrzQoi1cCkOpdfbz7c8/Fa7MrSlmABUUDoFvM=;
	h=Date:From:To:Cc:Subject:From;
	b=LMEqKSvlen7yhzscCrQosqMvFJXFh4gcEqgW+xkZ6i/DafQ/ipGtY9QzjJjF0XfyH
	 K22amY4oK7/pPr8HA5cy/iyh8nVc8eZhMixcVILzixIkUbywZmTrI+ogl3N5Acooq4
	 /kQGOjhXp9gBXgVHcuknYoU4/AlKSFqJU7ZOM2TjB4KIEOAVWd3B4I0EDH3xfedAKZ
	 t2b+qfQbnPocetXhB2JcNuLecAQiOwe7XfLE4WKBBUECSnI9BGHcu0IriU5DDBE69l
	 zCwCxvzENDSO7indpoqb5GT4ubD4P3deeItTgVgpH92PSC1l0adnsMRYpb+mEKveKH
	 0OvZ2QL/L7h0Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 97E671AC58B5; Fri, 10 Apr 2026 13:21:34 +0100 (BST)
Date: Fri, 10 Apr 2026 13:21:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Daniel Borkmann <daniel@iogearbox.net>, David Wei <dw@davidwei.uk>,
	Jakub Kicinski <kuba@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: manual merge of the block tree with the net-next tree
Message-ID: <adjrToW4h60zwxVG@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gbHZlHdoDj9/0Bjl"
Content-Disposition: inline


--gbHZlHdoDj9/0Bjl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  io_uring/zcrx.c

between commit:

  222b5566a02dbf ("net: Proxy netdev_queue_get_dma_dev for leased queues")

=66rom the net-next tree and commit:

  06fc3b6d388dfa ("io_uring/zcrx: extract netdev+area init into a helper")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc io_uring/zcrx.c
index f4a7809ba0c2b1,bd970fb084c19a..00000000000000
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@@ -754,10 -779,50 +782,51 @@@ err
  	return ret;
  }
 =20
- int io_register_zcrx_ifq(struct io_ring_ctx *ctx,
- 			  struct io_uring_zcrx_ifq_reg __user *arg)
+ static int zcrx_register_netdev(struct io_zcrx_ifq *ifq,
+ 				struct io_uring_zcrx_ifq_reg *reg,
+ 				struct io_uring_zcrx_area_reg *area)
  {
  	struct pp_memory_provider_params mp_param =3D {};
+ 	unsigned if_rxq =3D reg->if_rxq;
+ 	int ret;
+=20
+ 	ifq->netdev =3D netdev_get_by_index_lock(current->nsproxy->net_ns,
+ 						reg->if_idx);
+ 	if (!ifq->netdev)
+ 		return -ENODEV;
+=20
+ 	netdev_hold(ifq->netdev, &ifq->netdev_tracker, GFP_KERNEL);
+=20
 -	ifq->dev =3D netdev_queue_get_dma_dev(ifq->netdev, if_rxq);
++	ifq->dev =3D netdev_queue_get_dma_dev(ifq->netdev, if_rxq,
++					    NETDEV_QUEUE_TYPE_RX);
+ 	if (!ifq->dev) {
+ 		ret =3D -EOPNOTSUPP;
+ 		goto netdev_put_unlock;
+ 	}
+ 	get_device(ifq->dev);
+=20
+ 	ret =3D io_zcrx_create_area(ifq, area, reg);
+ 	if (ret)
+ 		goto netdev_put_unlock;
+=20
+ 	if (reg->rx_buf_len)
+ 		mp_param.rx_page_size =3D 1U << ifq->niov_shift;
+ 	mp_param.mp_ops =3D &io_uring_pp_zc_ops;
+ 	mp_param.mp_priv =3D ifq;
+ 	ret =3D __net_mp_open_rxq(ifq->netdev, if_rxq, &mp_param, NULL);
+ 	if (ret)
+ 		goto netdev_put_unlock;
+=20
+ 	ifq->if_rxq =3D if_rxq;
+ 	ret =3D 0;
+ netdev_put_unlock:
+ 	netdev_unlock(ifq->netdev);
+ 	return ret;
+ }
+=20
+ int io_register_zcrx(struct io_ring_ctx *ctx,
+ 		     struct io_uring_zcrx_ifq_reg __user *arg)
+ {
  	struct io_uring_zcrx_area_reg area;
  	struct io_uring_zcrx_ifq_reg reg;
  	struct io_uring_region_desc rd;

--gbHZlHdoDj9/0Bjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY600ACgkQJNaLcl1U
h9CATAf/SfbnKMKrCIJGa03yBQVFd9OwHgrrRZTvin8GZPhJKT/i9SmVDeFGYr0a
5v2PDlRDIn9+Uad0HcMb1VyNhOsY/u7s5mfC3xOwqhhPtcQ5uYKfo2wrrBXZNHr6
wVfII7T2UFOeLE0Y9a3mu7BDySWQez6X3z6i0X9GLbQcVpvQTQXo4QBQIQ71iqPu
GgjirWnau2gHPqI2W4yGPalURpVMnA9H4ybYRDomdD78XHKjn153fnEsrVHR6w5V
MgiKq+5mVVJtCy20SyCUQ3UFjqh8HsXdrKemkscg68UNItBGkVM9EHXFOPYxAdRb
8nUN9oIR/XhGFAFLZcY1WHgqcz2fKQ==
=MhMU
-----END PGP SIGNATURE-----

--gbHZlHdoDj9/0Bjl--
