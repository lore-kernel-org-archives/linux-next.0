Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B1038F658;
	Fri, 10 Apr 2026 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823704; cv=none; b=OiA2kkNHKxDEynTWD/J9M9MBJTKMZCUhLfvWpHX2PN4MVpt3KEYMe1w01fuDTGyKhHAPU83VtLUvug41ffCQwHNvMGrp13lNEL3hVyDdtxj7YqueNVMiiqLl7KprEotXS/mACPRgoFBW2l2cxA1vN8hmYCammyBP7X0ysPFzoB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823704; c=relaxed/simple;
	bh=Xd1HFyjA1HFTkCeNPhG8WYVIqMjZB+SZd/jotYdislU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrWg0IPNeKxtYoYSG2r1uLjgxGNc3LXLOYDpeBOdrF/zsSoxSZPUZXW6FtHC0240RUdhs2B6Hde3s36gcc9euNR4ETD1cFkggp4kA0tTg/Pu9j7zyYP9buUVWdRuDf1vXbhFeuNUdVfmCDmidsqreusJUyHKnj6G3ifg5XjFXZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L63Ui2K0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L63Ui2K0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C47C19421;
	Fri, 10 Apr 2026 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823703;
	bh=Xd1HFyjA1HFTkCeNPhG8WYVIqMjZB+SZd/jotYdislU=;
	h=Date:From:To:Cc:Subject:From;
	b=L63Ui2K0Uy853ErqlMY+4MTa5qcOk7uQi1TWXS3XouxeVRlCi5i7zxtXY+0zbQbuc
	 LeGWkh/CHkHe+C1qu0QAH2HkpYxHyiSGM0usucGsmmvblJPxvic/6i1G74a6ChoX8C
	 3yPX/9aTP5YeIM4bBDHpcM0hmenjNiztwvE0hNJzzZgr3SsoGw0RJFqDx+ldvBn7Ze
	 Lh1x32nROND7kgK8ws6uDBqDsCddq0NmrmLhNh+SWDFzA3ufcTZwzQ897ivipxxeV4
	 WUXREZmtqGzc3IXM/T300bDfVzzfxB5mR/zHy1bfKKzE/8f5sRbwpGjwu77PhvfhQS
	 Z0T1UzGQR4uCw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1D60E1AC58B5; Fri, 10 Apr 2026 13:21:41 +0100 (BST)
Date: Fri, 10 Apr 2026 13:21:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <adjrVagmLJaozz5o@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xYILvh1IlfvuN+zD"
Content-Disposition: inline


--xYILvh1IlfvuN+zD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm64 defconfig)
failed like this:

/tmp/next/build/io_uring/zcrx.c: In function 'zcrx_register_netdev':
/tmp/next/build/io_uring/zcrx.c:816:15: error: implicit
declaration of function '__net_mp_open_rxq'; did you mean
'netif_mp_open_rxq'? [-Wimplicit-function-declaration]
  816 |         ret =3D __net_mp_open_rxq(ifq->netdev, if_rxq, &mp_param, N=
ULL);
      |               ^~~~~~~~~~~~~~~~~ netif_mp_open_rxq

Caused by commit

   1e91c98bc9a8ef (net: Slightly simplify net_mp_{open,close}_rxq)

interacting with block tree changes.  I have fixed this up as per below
and can carry as needed

=46rom d5971ccec3525c71d28cb40bc4a6c9596f354b48 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Fri, 10 Apr 2026 13:14:23 +0100
Subject: [PATCH] io_uring: Fix up build for "net: Slightly simplify
 net_mp_{open,close}_rxq"

/tmp/next/build/io_uring/zcrx.c: In function 'zcrx_register_netdev':
/tmp/next/build/io_uring/zcrx.c:816:15: error: implicit
declaration of function '__net_mp_open_rxq'; did you mean
'netif_mp_open_rxq'? [-Wimplicit-function-declaration]
  816 |         ret =3D __net_mp_open_rxq(ifq->netdev, if_rxq, &mp_param, N=
ULL);
      |               ^~~~~~~~~~~~~~~~~ netif_mp_open_rxq

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 io_uring/zcrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index 593b1d39a5eb44..f2e08c19e74cef 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -813,7 +813,7 @@ static int zcrx_register_netdev(struct io_zcrx_ifq *ifq,
 		mp_param.rx_page_size =3D 1U << ifq->niov_shift;
 	mp_param.mp_ops =3D &io_uring_pp_zc_ops;
 	mp_param.mp_priv =3D ifq;
-	ret =3D __net_mp_open_rxq(ifq->netdev, if_rxq, &mp_param, NULL);
+	ret =3D netif_mp_open_rxq(ifq->netdev, if_rxq, &mp_param, NULL);
 	if (ret)
 		goto netdev_put_unlock;
=20
--=20
2.47.3


--xYILvh1IlfvuN+zD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY61QACgkQJNaLcl1U
h9ARyAf9F9R9SCxpKhvaVajV4jQ+fPTyiwbSfiHZaC27A11Y2hcL5AOw/fCiSW6l
qgS7VyLTUHGn56Gns0E/7q/dMnYymyMxZH7AN+7A3jmkNMEGc/tMH0HJj3/aF5Ny
5YHI+VDNwFeJZM78aj8uZIoLctFUC/dJWgMyt+mijkac8iZzz3p+p73Tjvu91b2Y
2D3oPG4ZgUk1Ieu0+N7dPeI8iPLoQ8ir9PairjinGewF07XGbOdZ0jeHXPQadKU2
r7IDW+SiTft1cawTBnlvUtB/CJw2fKOgfLcpA4ic/brfXriCzLkTMF7n5+ZScGy0
/vqZjboAUKMz3N/oRnT3QfWqFLs1kQ==
=IKxi
-----END PGP SIGNATURE-----

--xYILvh1IlfvuN+zD--
