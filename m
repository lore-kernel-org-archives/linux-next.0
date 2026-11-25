Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615889;
	b=opj6Tw/n56qyObAOA4lipEb0vYtO3DnGAHhbUfAfHaiJ0+zLVmgyw+7nv7rzBKWZgHO8
	 kLfO6ERhjZLkQSpvjJ4v93HjUlt5NSqVJEza+gID4Ehpj94IP09lkNtFayDFcLGBaDAJe
	 WpPV49pC5o58qrCl/hJtktNhq5ifEDvnOcDP4tcDE5Yt8O5n8Zu5LiRrvINE2cySzYZFB
	 SmUGzDWUkQ3ELUPk6yrEI9cvI9ku4VIN0qPDTsQorJIyFTYQgjHndQFDr8lNuLG/bktaf
	 y1sDHAAjtIVs1nkIdmNHQuN/QKlNQ+mFMVanEVUYlfP6+M+Smj97mBxNDOZYy8mMAXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615889;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=z/ASeBzEPJiEwq6xl5vaoxgx6DP9yjBFtRWF3iqikvI=;
	b=N66f/T2iUq8zyTSmAbCxZcLu4Hi1k9Ald9TcTqnAZTOWVo2rO4meDr2krduAFrLa7KWe
	 Xq2MtUrlRv865Md8aHI5EV6k3FjvcWgBqAW9snbCJzHfaJVqrsGpn35FQnL6e/sgh+Um2
	 8eET2k3vXBjv9pebDrMEV6Mb7N7NQmhpHILRt/qDto0GfTH4Y3dDsqM6fESM9yMPw40n1
	 3pIiQ3Dmc2InAg3tfRZxf7q4zzx4w7RU+tCTASpCerEwXhO3hoAQeuBl9D/POqWfP8anS
	 bZfrxmZmDFu+DWSqxkZHi9RVXlccKD7RlA4avaWszkPbWT/BMie/iAZmd1PQCjRf6hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ajzb4Vbp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E5606A33D;
	Wed, 25 Nov 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ajzb4Vbp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F179B1F000D2;
	Wed, 25 Nov 2026 14:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615888;
	bh=z/ASeBzEPJiEwq6xl5vaoxgx6DP9yjBFtRWF3iqikvI=;
	h=Date:From:To:Cc:Subject;
	b=Ajzb4VbpXExYBejw0AW9lFV7n2Wjm/Se5Awnij5rYwXcUlWHD3kYr24PsA5lud5qG
	 i43P85fai7ewVSfTnxaTkoyIN9cqd45z1LLBVRCn0ZKJ7bNWYTladouSBbb4hkTej9
	 b1VLxklHvdrDRFUB8LlKYziI6LqEQ7ehmH0WRpa44dG0hDUUxJ8xdY01EDIwkofcjP
	 zHPrEaPy2eG2UBybuh3kLdVv3y3DXTGyUTmnYPFXH1biyChHlNXhm7XWLdP5r3pXUG
	 eLECJiFo1DBmWBAcgRut6rDVrLhug2SfUSv8pSEQMEXgRIZVU4JnWzK4cju1+rJRUE
	 Ufntnzez5kE/A==
Date: Wed, 25 Nov 2026 14:11:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbsjS5zt4t8JjD8@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iOVQeMtqi6F3rUzL"
Content-Disposition: inline


--iOVQeMtqi6F3rUzL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  73a1be048699d ("arm64: dts: imx95-aquila-dev: Keep DP_PWR always enabled")

Fixes tag

  Fixes: d5c082ba23db ("arm64: dts: add Aquila iMX95 support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--iOVQeMtqi6F3rUzL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7IwACgkQJNaLcl1U
h9BE8Af9EeXHtxPZfUF3mrQXH5HQLV+QnqLSQpO53VnkfivLhUoqfflzKYrxOyH4
tj925DLjqULQ/q3iUGu4eG2reaZFVNwRnPFoDLO6r5qjCWTa0t+PzoDWP8jKW/AO
a0Nf3Pk571DNr2woYGQ+B/8UCjnc7MQkUhTWh+ZbbTPIyiN9mB8aV3jRKiYlXmbm
RRBR+wVJmT20/FQGpb1t9RO25NEBPAIoO8e7IJAwsmb72xswi/q3rO+8+t4WSozQ
/ehtRHn9WXpGhAs7fKcRhUdr8cA7MosUzhhAQYSVhE6pjxKiky+qxv1MlLwCIyts
3/PJ5CKJlbfneWISIrlNfqbAH3Gi+Q==
=vESr
-----END PGP SIGNATURE-----

--iOVQeMtqi6F3rUzL--
