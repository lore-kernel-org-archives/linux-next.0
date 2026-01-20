Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D087944105C;
	Tue, 20 Jan 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918388; cv=none; b=c3gYdAb9TCh72k1mpRYkjsnPdA8L+79EnBINfYlmF05gjKx8DRvaWeNSpZD1C72qkzK53A1aBBSdyvvwMaMfD4ZGfUwdtRp2fwz3dkB65+LhaksYWSmDd5J+j89xjCtC63lXeBxYeCWvWcxxaeBQilmDj9+fmdnCBNbPwkFLams=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918388; c=relaxed/simple;
	bh=oRVUthm/lGVwYrE/v4VEhX3JzuV2YFw4iRh3LEweJro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2N22UVvJ0b9CrsIfaWgenHnLTKFH3Hb6wIcr2qmcO5j6lUn+aI55d12epOFWFkxMqC2Tf6bhTb0xdwGjnnv2TQQDkGN7CHCSIQonpI9EsNHrq9Aevb525TdM4ejJT5dAm+heYx7sPWGS9hYV+WiEtFJ5eCh4l7P4iegysk+CcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EoExy+oF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EoExy+oF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1173C16AAE;
	Tue, 20 Jan 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768918388;
	bh=oRVUthm/lGVwYrE/v4VEhX3JzuV2YFw4iRh3LEweJro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EoExy+oFw0f6Mr0GUEzd+50DdyibjVrZ2n5Uk1XBcP8NVecaZDvPhK9ViAh26RQq2
	 TgSB1XD3opDaVEW7i+cVDCMJ+IBNbzcXrajqp46eZKOKGYcUXG5pb+SWQ3+0s6tI4r
	 uwhc+vw3SNjIdPoMSX8PcH/Ot+M2yrukCRSlC2PeSmqdnQAnpguRNotKdf8GCZY5a/
	 Gjagl5DzBr05bC9JvsqNxlVAL7QZYrtJmGo1yqvwrg86WkfMf14RnrQuFsFctdFmKx
	 K7QJcwGiAmYuuF27LFkF9F2iI6o65JpFr7uYTUUI4TyzhDA8saX67aQmp/XZysyv1n
	 J6oxD18TBsYcg==
Date: Tue, 20 Jan 2026 14:13:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the at24 tree
Message-ID: <df03ebc9-57fd-437d-9fe8-d8e4ea8f3685@sirena.org.uk>
References: <aW-Mur4VZrCg5gjM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j89fkCRVIorQ08oQ"
Content-Disposition: inline
In-Reply-To: <aW-Mur4VZrCg5gjM@sirena.org.uk>
X-Cookie: Slippery when wet.


--j89fkCRVIorQ08oQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 02:10:02PM +0000, Mark Brown wrote:
> Commit
>=20
>   c6e79d34bf80c ("dt-bindings: eeprom: at24: Add compatible for Puya P24C=
128F")
>=20
> is missing a Signed-off-by from its committer

Fixing up Bartosz's mail address.

--j89fkCRVIorQ08oQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvjXAACgkQJNaLcl1U
h9AfmggAg52sfPq5aCFwEZn+a3tYTGvne00zSTLRdSNT9KyqWW/ij09RWQfRbYqk
71fgBU52uv7d5TU/+sQv9dED/RN7L3IYW5YP3fSE0tq6jlROegXfxAIQlwjR1pR9
l/8Zjwshod5armkDHTtOrLxNe/ypblBeouDL0xe6ZFZSY56qb/DCcWVIR5P1rqnw
jl+pUFQsinXORC3k1zdbkY5q1nS1DGWGAyKOl4fjC5W1oLBjWMmqlg3UlCC8sae9
y5jQfKZRglU6yqVmLwXIkzUY+Yl3MNZFIECsbvF9SLbg0UIlfs2c2VYq6nPd6hsI
IuJt7hbLLaWQOcUwxbIU9LmnqKzTMg==
=OTrz
-----END PGP SIGNATURE-----

--j89fkCRVIorQ08oQ--
