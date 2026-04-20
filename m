Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201CD3AA1A8;
	Mon, 20 Apr 2026 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691933; cv=none; b=hO2kQeAin0Dn2If919zZykVk2zEHXCDR3pLwCaKeQiFWpCC7Rcerh/mDi1fEFOV4pnmlCxEFCXk5gxTkKxEZjCce2zAj2i49jto3Z1QUOkciAeMJ3iIC4ywUqv1m6/YdYLkdR6lX6V8E6jxHohC5rwbIm6vDuHuIqZLrcHugoBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691933; c=relaxed/simple;
	bh=DgANCX8NBDG81AtY02We8Mx260E2ECt8sWqh7BeBU+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcdTGivYBL2C10xW/pSxGdpZ0YP7x1qEIV0RgACnwCCZBIkTp7iPlXEAIYeIw58ybOM+glb+0Afy0kS1YoRVd+Wd8O+ZDoygvjOAYoMrB7cCWBp6WeEI6lc0WweSgLKC7a1CZc/q3GxWE0C9jI5Sh5hCPhvvAI/ptK9cSZsNybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUTm+piF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUTm+piF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA288C2BCB6;
	Mon, 20 Apr 2026 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691933;
	bh=DgANCX8NBDG81AtY02We8Mx260E2ECt8sWqh7BeBU+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUTm+piFBEWhcY+m4sOzglldpEzCQC6aGjU8d+tzxjRescJ89P3H+KEp6CS3uQj2j
	 wSW41hJ+CsAyq+wLxG+nmvXSExmS6y11MkoWVK+W3PX0rhChdIsb2P/C5AJIPE6OM/
	 +TsSXf2ukjRHI7iY0E9FBGX9TjACRz1bj4RAs/oxQWMbqnOAJSCT6AiV7UkzQm5wbk
	 FC8/5bGk05n2/i/jCYKXaucmjAVAR3VQpGSkbI63OyEfr+G5QbNjF0kTGNlZ+xH8hA
	 iVHWB0rr8/xzkVCxHpQ/R2CwvFX0EVJ6m1csLnp7fQFNEJwwigTXqhgPxq+i+uyLLf
	 dAWCLDW4TZPgg==
Date: Mon, 20 Apr 2026 14:32:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the qcom tree
Message-ID: <593c3cda-6fa2-411d-bf1c-c68b1814f691@sirena.org.uk>
References: <adeNFNx-ynFtR3qn@sirena.org.uk>
 <cceed24b-f623-4cf3-8f3f-45ce8fe3e5ed@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/xA+l5PkKFEb66W2"
Content-Disposition: inline
In-Reply-To: <cceed24b-f623-4cf3-8f3f-45ce8fe3e5ed@sirena.org.uk>
X-Cookie: Call toll free number before digging.


--/xA+l5PkKFEb66W2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 05:55:56PM +0100, Mark Brown wrote:
> On Thu, Apr 09, 2026 at 12:27:16PM +0100, Mark Brown wrote:
> > Commit
> >=20
> >   cf6e6ac63c62c ("clk: qcom: rpmh: Add support for Nord rpmh clocks")
> >=20
> > is missing a Signed-off-by from its author
>=20
> This issue is still present today.

And today.

--/xA+l5PkKFEb66W2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmKtgACgkQJNaLcl1U
h9D/AAf+PCSWYgv8EvEQN8QFNkmUqWege6JHGkazq3LrGs9uVUYfg1PPHLECnHzI
/IdWAZIFd/xZ5bD/96LfTbZutZbz4HlQgB8IPY6y5syJFxqz8dFkgQClS4h2Bmf+
Md/KAfneXfVTwMC84pBT975fCjSBBJ/E2UP2zx+xBio50DGuLHO6ZWlJHS/psE2J
59Hoeltwc+YbM6jG2qdOvNSRD1dWrXvaml0H7ZHG56zl+01emS0XEd5XsaTquIQk
I4YvzWopfc7gif3TFsZlU8p2jj846pi/V5SJuV00ylG+KEo1ETHzSrgX2d1IEBy2
hbUBD73/lCiPx4QkWhKsjmsH75g60w==
=tlN/
-----END PGP SIGNATURE-----

--/xA+l5PkKFEb66W2--
