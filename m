Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04972D0614;
	Mon,  6 Apr 2026 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493498; cv=none; b=GFMXPqZQqwzjQsjn6PF0X+4+4hcmWtmeFtC656drKJqEv4n6Nl/WRpfONYktBp6Xq980iRupMRikOC4yXnMrBRq/+KkqkTHg4237bgH/1Up9M1k7WiTvx3vYphF9gxRpuv3MxhpovPKn66R75nVpQOQogo3ZR+nGuxO5ln/VKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493498; c=relaxed/simple;
	bh=DIqG42+fZcictkcXN498kxvORLlRudcTT5eY3qnAmrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teGPOaBIqrBU5tRzy6Aknrb11DkByY7nHY5wrC2uTc+MJYo6NbSHhrF8pDML1auseXPCIfytxEsUDCvWPIc4svkQuzRyiGuu/YHrtLIq2Sgh2ns1q+bnuwuoIsl0ARwohZnZgNLkeaaHjTeDQV1NPDGn39hBgwdIstgzkB+wDRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USB+qmnb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USB+qmnb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4206C4CEF7;
	Mon,  6 Apr 2026 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775493497;
	bh=DIqG42+fZcictkcXN498kxvORLlRudcTT5eY3qnAmrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USB+qmnbgntShLVULS7Zl1Ptzm3pdFzeWhPsSHVHB4xuCcvFe7R3/MnConbo3oQbI
	 Xn/3z6ZIRGZ/LnBfOpwuR6IIQ2SILU90ExpQ4Prptb711ScBRzpIkCd2mhLn0GOuDL
	 PnfCXybnIxMVE7t5IXLOivBar6FXz+70gmlXVhfbVcZR4lSyrS/NrRFJTQxpxrDpfa
	 FmF9aFYGYcxxi8vm5XdvfQp+UHAjTLxkeyTF3Rv7/kNSTUAxP/STp6bphRMTYMIuIM
	 iGxZtvs0HCBjy2sszeivg1E0NW7t9FXHdF00qoXoV9F++bkRlGLrlMsUleotBsSfCi
	 fR7I+yQynDf9Q==
Date: Mon, 6 Apr 2026 17:38:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rdma tree
Message-ID: <df6f8a58-5c8d-437e-aad6-fee85a89f5e6@sirena.org.uk>
References: <aa6qqi-GmXZXxubE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BspWlFfqw9yomuyS"
Content-Disposition: inline
In-Reply-To: <aa6qqi-GmXZXxubE@sirena.org.uk>
X-Cookie: One FISHWICH coming up!!


--BspWlFfqw9yomuyS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2026 at 11:10:34AM +0000, Mark Brown wrote:
> Commits
>=20
>   eb15cffa15201 ("RDMA/bnxt_re: Support application specific CQs")
>   485a21c14b413 ("RDMA/bnxt_re: Separate kernel and user CQ creation path=
s")
>   9ed273bbe6637 ("RDMA/bnxt_re: Refactor bnxt_re_create_cq()")
>   0edac801a2693 ("RDMA/bnxt_re: Support doorbell extensions")
>   4e99362444a2f ("RDMA/bnxt_re: Refactor bnxt_qplib_create_qp() function")
>   f0579e330b773 ("RDMA/bnxt_re: Move the UAPI methods to a dedicated file=
")
>   9db6a217ba5dd ("RDMA: Add IB_UVERBS_CORE_SUPPORT_ROBUST_UDATA")
>   ce150a8376e1e ("RDMA/bnxt_re: Use ib_respond_empty_udata()")
>   d59f007207b39 ("RDMA/bnxt_re: Use ib_respond_udata()")
>   ac4bb15208d1f ("RDMA/bnxt_re: Add missing comp_mask validation")
>   12c73bee53133 ("RDMA/bnxt_re: Add compatibility checks to the uapi path=
 for no data")
>   ac593f5b66c9d ("RDMA/bnxt_re: Add compatibility checks to the uapi path=
")
>   6df3a6414d736 ("RDMA: Provide documentation about the uABI compatibilit=
y rules")
>   42d2a291ef474 ("RDMA: Add ib_is_udata_in_empty()")
>   f1cac281b4245 ("RDMA: Add ib_respond_udata()")
>   4ac738c6a7b90 ("RDMA: Add ib_copy_validate_udata_in_cm()")
>   715eccd4798ec ("RDMA: Add ib_copy_validate_udata_in()")
>   ea08d8cb8b520 ("RDMA/core: Add rdma_udata_to_dev()")
>   8e886928a19d7 ("RDMA: Use copy_struct_from_user() instead of open codin=
g")
>=20
> are missing a Signed-off-by from their committers

This issue is still present today.

--BspWlFfqw9yomuyS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT4XUACgkQJNaLcl1U
h9AHFQf/ec3vGZZOojidEUZ2E3elQLBmbVBUIiULTuBRGLmejXKMiwhaq9q48kim
KKe5pVYLlx8bLVKa4fyDiv9V15ImcQlB/y17teXW4W5pqC8hD8ZTvIOHYIb79laH
LEB+fpnnnA+b+neocKzRedJK/EMUlMVcMZbqV8gFfeQfbJoQ6158OvozzCDpZakJ
LQDpSD2uCXweAIOCOk20mTFS8suK42+cqXeoHU5B8zvuIfyZs11kA0Bs0Xz2wzwl
dTM/q2W13RDnU9HWKOzDHvkkBITKmV9YXJ6kLEtw33jf2S9nol2/sqC+vJv7gIxH
Qa5EfHgAK3md48cAc3O9Kkuve6LoRQ==
=jI0K
-----END PGP SIGNATURE-----

--BspWlFfqw9yomuyS--
