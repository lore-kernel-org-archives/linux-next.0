Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACFC386C22;
	Mon, 30 Mar 2026 22:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774908664; cv=none; b=G8zjve6JMgW22efCHy+b+IZjfjAdF3SE2nRAJ2pnC7Czw+gog0fi47tPlHfG2rGmOwAJ7crgxYDPd/GSqhkcG5jZqMrKGYm2EiQRTjAX4KoIvNEoBM0HvczhkZ6Nurj7FvdGQlMHB7C42qeLwyvO76WrtuB4NiHYwG9+oX4dxuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774908664; c=relaxed/simple;
	bh=FXX+8rWkZBgz42IhLAEXl1oojgVHynsVWgvG/6Blfps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiov/oDW2WHen005ikb6UgBJrjrP5kWaCIa/WJS1XGhOuq6Hcp1V2P8TywSsrKqOhnbyOv/Dirt29B/3FrA2ylPRiqdkQfaIIIoSdc9hUUCecMzg3WeJZBn6YpR8LK2tYRDkBNSCB3Idfo99T34ODNcLp6PByoUMVX9jclJ/mNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=As6YHwbk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="As6YHwbk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA36C2BCB0;
	Mon, 30 Mar 2026 22:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774908663;
	bh=FXX+8rWkZBgz42IhLAEXl1oojgVHynsVWgvG/6Blfps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=As6YHwbkfu5Q1K/OzYGu4aVi+v4qgaCgR+ErqJ+MEdDU/abUtN0QXYDdwEIUzrnrI
	 XrVixPpEZkswHsum1c+Ea2JAg+m4m6+H03333uYlhaC01mc+Zv+l87bAruct9gSlNa
	 4Yx2+U+mTKTQAHbhtjPkR6HtO2R/TdamQ6rm2mYS+kiXh/3FwkW7nghFKn+qzrOGOO
	 W/QBZ5LfDdMwA8j63cKH64pyO/VaM87JMM4rgAMVCU4AG+F4rVE0cPlYx2lMe8Vcp9
	 J0WRbBUTpzDJANdVgIjFkf7s+2A+PhtEBoc7vQd8k2QWDryYaNBPfdwWRyxCwuzv+5
	 NF3e2uPtdILTg==
Date: Mon, 30 Mar 2026 23:10:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rdma tree
Message-ID: <999d3ed6-bab5-453a-aeae-d33b1a958d32@sirena.org.uk>
References: <acE_P6P7vp0LmTHT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iNfOdv3GDLh7GrcS"
Content-Disposition: inline
In-Reply-To: <acE_P6P7vp0LmTHT@sirena.org.uk>
X-Cookie: Two percent of zero is almost nothing.


--iNfOdv3GDLh7GrcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 01:25:19PM +0000, Mark Brown wrote:
> Commits
>=20
>   c50be61e277e1 ("RDMA/irdma: Add support for GEN4 hardware")
>   333ad1665dbc4 ("RDMA/irdma: Provide scratch buffers to firmware for int=
ernal use")
>=20
> are missing a Signed-off-by from their committers

This issue is still present today.

--iNfOdv3GDLh7GrcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnK9PMACgkQJNaLcl1U
h9DfUgf/Teikwn3RZ61NZ+F7P8jP4xL5sVVYH4n4ub5VF3IwTtccWNVAeu1dcuec
ZlddSZ9mEB/1GcR2MGhw/KLeAN2rtZ8BsbjgbgqrafjNgNw9oeyOxC4teUYAXDwG
B1A4x2IoGDBOVG2+v+qNgJ9Kozq4gn2quTmVNWiGq+pzVjGgicyDXqtPos2TaKFI
aHMljaU9TiStW1pXwSSuctOZUbG0TWJtW7vu7jyVfh5T6kgrQ89xF0PnfXomNHiH
25pazHOkn3DfgiullbgmUt0rtX40IB+1dYWhQUVmXuVStdPlyl0eFcxh5BuWbdNU
N+s/cb6xaf5CaYFe7qqcy8ljkYYHJQ==
=RM/W
-----END PGP SIGNATURE-----

--iNfOdv3GDLh7GrcS--
