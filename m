Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37382DA769;
	Tue, 17 Mar 2026 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763228; cv=none; b=jYrVl+UmABU+iCdvTk9C/D2cHSrZU4Zf9D3zksSlcOkMqNJHpVcR4PtvahW+4/ZY6yL7J5JFpP1j6ch06Mn9SIfNFAfzHhUAZRolH/Cd1VwXnj4FamDPGD5FxWAYNkiOULqv2ZWlnb2wc1d2bkto0sbLXmukNsN0uasoXwPfZ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763228; c=relaxed/simple;
	bh=MMpDbTWQSWGHLLGWQOSZFBVCR1MUm5haRm1cuvsXDoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BzIQ/yfbEl7aBpITL0xWG5DCe8Cvsn4KF3QFGmClFII2oUcb+9x47qN+uZVe0U1bQpnGsy6fiqymlBf6CyHggxTH+vTtcnS1o/aIkrS59vAxhD6BaM38EbXxwGx8JKqv19QJgur3S20PZnQwbXxHQcXTa25COzltvXRVOf764AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZi1bSFA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZi1bSFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D981C19424;
	Tue, 17 Mar 2026 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773763228;
	bh=MMpDbTWQSWGHLLGWQOSZFBVCR1MUm5haRm1cuvsXDoQ=;
	h=Date:From:To:Cc:Subject:From;
	b=YZi1bSFAv8Xv/Pq4QbiRfGBgJaSLoXIHWhByhfx/nzI4PAqzJAC3J98UmRBPZXNpY
	 73tZq8L/H2GbEO949Yik0I6mRuBAtlB7BYq/oGHs8ZY/HHLnRQPd4mjGfPJwJ+vegS
	 mxkcpcrdPLq05DlwOVQR9TB0aZgV4DiGkNtdmpnGpfQu0lu88MsDLuo/omkmzr9XQ0
	 jb4TnJZCndO3gky8BTjFvxOuCaLrFf4EglppX8XnHXOHtw38E1Qo4kTZn8lgnx6iik
	 gpsBRaVdum222yN9oQRRG2mQgemJiZX44X3EG7mgelGWcv0VOHGettdTkAloQcMIWv
	 OAdCoTtJTwSIg==
Date: Tue, 17 Mar 2026 16:00:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Edward Srouji <edwards@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Guralnik <michaelgur@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: linux-next: manual merge of the mlx5-next tree with the rdma tree
Message-ID: <abl6mNj76d4TwtQR@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mHxEOMOb5kQbQLiH"
Content-Disposition: inline


--mHxEOMOb5kQbQLiH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mlx5-next tree got a conflict in:

  drivers/infiniband/hw/mlx5/mr.c

between commit:

  36680ef7bceb0 ("RDMA/mlx5: Switch from MR cache to FRMR pools")

=66rom the rdma tree and commit:

  4dd2115f43594 ("net/mlx5: Expose MLX5_UMR_ALIGN definition")

=66rom the mlx5-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/infiniband/hw/mlx5/mr.c
index cbe34251e340b,ff56948597ddb..0000000000000
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@@ -46,15 -46,14 +46,14 @@@
  #include "data_direct.h"
  #include "dmah.h"
 =20
- #define MLX5_UMR_ALIGN 2048
 -enum {
 -	MAX_PENDING_REG_MR =3D 8,
 -};
 =20
 -#define MLX5_MR_CACHE_PERSISTENT_ENTRY_MIN_DESCS 4
 +static int mkey_max_umr_order(struct mlx5_ib_dev *dev)
 +{
 +	if (MLX5_CAP_GEN(dev->mdev, umr_extended_translation_offset))
 +		return MLX5_MAX_UMR_EXTENDED_SHIFT;
 +	return MLX5_MAX_UMR_SHIFT;
 +}
 =20
 -static void
 -create_mkey_callback(int status, struct mlx5_async_work *context);
  static struct mlx5_ib_mr *reg_create(struct ib_pd *pd, struct ib_umem *um=
em,
  				     u64 iova, int access_flags,
  				     unsigned long page_size, bool populate,

--mHxEOMOb5kQbQLiH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5epcACgkQJNaLcl1U
h9BXnAgAhSb6vwgeLiWqKJf5eUL6nAF30mviZi9NMUNl8hnbyFXEvfdy3WEHCYni
lZkrAEgAKCFv9VPV1um+3uBVSTEihb1DaNBxruFi7c78TUqUX5dRUpCk+K9ZRGOA
0lzS1nGHzjr7m8h7nB2GOy4lCFpsKX5BP3e3CDr+0wDWCq7Fnd7wwpLvjWODJdpZ
K3sGsL8TP1wg8g1qyQ/zPu5rgobUYuuDK4Gndux6LH/pi9d+IMGrZcrU+84rRdoI
AEosEpgtT0viRSv6VScXt3ZR4Trx3TlTAllK/Wtux2lFK6TkBS4fJdztoPj2yUGJ
rCPA2rWu8ULDdZ8Qota0TTJNOZd4JA==
=p79o
-----END PGP SIGNATURE-----

--mHxEOMOb5kQbQLiH--
