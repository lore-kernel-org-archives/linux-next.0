Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26031E83C;
	Mon, 13 Apr 2026 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099288; cv=none; b=ddIDKXtjxqeE8uzDaKJfdUoDwn0SbSN/hrnArb9NeLuCbH7h0LwolO42ECByHmmWz6sQl1lQ2nRpcLdebMst8NghOtc2vP/MbycDC3DmXuBO0d+B+vfdq/fLA6rYekXBd+HmlDCt/DBiAQflj2hIWEk81oBlAaWNLAQ9BWjHYss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099288; c=relaxed/simple;
	bh=74R9UrOY9ljfB1yOmSG597NtdW6m6K7PKGpKNj82i9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dubelZT93V0KY3ljPsOTdxC9xX1amtiJCygoQWSaapMnT0SHIA1xUsfU26okcH1N8ymnMybO0KYzRyPHqdL14uhvqHQ20yiQ6tNPrwZQHOvK1JKmHtp57ExOAq8teUYgneoatOqdEmQo9yVlWBtg7rFnssco9ZLTmmMVTXCnoBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzt4c/aM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzt4c/aM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2D9C2BCAF;
	Mon, 13 Apr 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776099287;
	bh=74R9UrOY9ljfB1yOmSG597NtdW6m6K7PKGpKNj82i9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzt4c/aMdWXkYU579b6EaLvHauuzZZA/GwnQ/UbkBz6EGFuSLZwsMLyGG7Pdpb4kx
	 D+23AyEsgK9cP9meCBo8nQVpLTxR0eXHXpNypD9KRCYgIejS0EvNqHJIXj2X27CL6/
	 9Q8Wf6aSloEkf8TeWGTJ1JstWL9s0sgwjQlHcCohOzltKiTs1KbBDMdhrZ+eXDlS6T
	 D0VWfMvkOlgUwX+CXWoqwWYrLOCZ33yPae0MGAGxRy9p58CPamW64IfqVcstoK9Ogp
	 P3aGdZovCuPp9RGkTbsh3KkRJK2xiR+0+2eMF+1toXOBdGt5wSzn5qc3f193uUYNOs
	 kPPlO23KvUXxg==
Date: Mon, 13 Apr 2026 17:54:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rpmsg tree
Message-ID: <596bb62c-0d03-4596-a8d4-4a9ab2f44ed8@sirena.org.uk>
References: <aarBm-e3NUl9XnY8@sirena.org.uk>
 <aee116cb-6335-47e0-8634-2ad208f4fcd5@sirena.org.uk>
 <d6fd197f-cdab-4ded-87f2-754c501c2c02@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KWcdYE+qBp2Q7FRs"
Content-Disposition: inline
In-Reply-To: <d6fd197f-cdab-4ded-87f2-754c501c2c02@sirena.org.uk>
X-Cookie: Driver does not carry cash.


--KWcdYE+qBp2Q7FRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2026 at 05:28:46PM +0100, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 11:11:41PM +0100, Mark Brown wrote:
> > On Fri, Mar 06, 2026 at 11:59:23AM +0000, Mark Brown wrote:
> > > Commits
> > >=20
> > >   390045a24591a ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaana=
pali CDSP")
> > >   0af8802175d2d ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaana=
pali ADSP")
> > >=20
> > > are missing a Signed-off-by from their committers
>=20
> > This issue is still present today.
>=20
> And today.

Today also.

--KWcdYE+qBp2Q7FRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmndH9MACgkQJNaLcl1U
h9BZSwf/bBciOV4+wD85xIv753S4BnKhPgk47358rmZPMAAPd1HQMRgfWRr8f2Cc
3y9XsZS+0gmWRy2I6Z/fDGgWDbkwoMYYD+x8bzYizHTJHdPKm79hGq0q+EyZEutG
9FU3IyvH2fZwhY49GdZvZXCG6IvBTj/f/U299xwREMEriMcl/ErzT4YD3Jv6lhlX
LXVEFCve5nWFmmhTQWn3OP+dmrlXzDHimCKF5CKjPuln5syrmQxgwQuq7SgFLTcz
XkJJmSItFHbu2RDfrT05B3gBDAK+EHBQDGwvY/6Okt+LwmBFfSheo9y+hppu22Rx
BLKpoXRR9+dbL1+DeLbsvm1DpjIymw==
=Tjc+
-----END PGP SIGNATURE-----

--KWcdYE+qBp2Q7FRs--
