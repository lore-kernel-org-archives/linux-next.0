Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EDC3546EB
	for <linux-next@vger.kernel.org>; Wed,  1 Jul 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921108; cv=none; b=f87WnYc7HdLvy5gKoZakaTk30wo/QuFEtaN0HTsvGlmoUGpYTjEWIA/+hCSSXDuk7nG6eGAapfET31JWbPUeH5rTUq83D75CJlUNKNrvmrmLJWhSH7SfUgxnoFg2k3uy+LdJJHuj0Jl+ID2AM7bWSWE+w4CWxmjCoZiS+xcdXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921108; c=relaxed/simple;
	bh=pUJkoox586Wm60kWRlwHhYXtmxg6woqQIksBa6+qu2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKgs7R9y+xhh1M8Py/R01BYuj2JPM0C2LvhaQ8kzcdeNOwkxNagA99mVTAHow9XPDZD0sGvzMY50/YCU7+pcV6NlSaUzKoN0+i5lR84GM0/PGnTUmaTK0ZSbSBEuTgOuiyAemSn2e5AAH6R9+v9YEd5UY47rzY+9eKRKZRhMMWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBvtFFMr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBvtFFMr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC971F000E9;
	Wed,  1 Jul 2026 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782921107;
	bh=pUJkoox586Wm60kWRlwHhYXtmxg6woqQIksBa6+qu2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DBvtFFMrg3RbsX4X51P5i4jmULk5gd3i2g1V/L1WMW8J66Z8TAQDEtk3PqmzTE3Oe
	 bMhr2E00nd4DRwCPAcY3ny6aFlL8PdOhhYvKp4Se1nw7pipsSiTqcEa51eAkJeCSWW
	 1cunIxX2sTGH7OefjtIe8YP8QA7EHUtmbnU0WmH/PvEKq5qZo/PnAd+wA2d0EPweGU
	 1+8C9GPdDRn2VUOCrYglDU4OnxU43ur0E+yA+qryVk6dOQbo9WSfm8xmtPhcbglC39
	 TwlnCmERJnXTPMi4RADa4BfZ4xokP5H8MFigVki7dfy8YmH3gjL9j0yRWkFji1b7wb
	 shZIygjclv7Iw==
Date: Wed, 1 Jul 2026 16:51:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-next@vger.kernel.org, kernel@pengutronix.de
Subject: Re: Moving reset branches to git.kernel.org
Message-ID: <6ba2edc2-89d6-4d49-ada1-4454512afb7f@sirena.org.uk>
References: <dbca57be9066a3853236a6395a7fccd8932bb65b.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7l5+0t3ML+7CLn0M"
Content-Disposition: inline
In-Reply-To: <dbca57be9066a3853236a6395a7fccd8932bb65b.camel@pengutronix.de>
X-Cookie: Do unto others before they undo you.


--7l5+0t3ML+7CLn0M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 05:42:07PM +0200, Philipp Zabel wrote:

> Could you please update the linux-next repo urls to pull the reset/next
> and reset/fixes branches from

> git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git

> instead of git.pengutronix.de? I'll send pull requests from the
> kernel.org repo from now on.

I've updated the configuration, the new repository will be used from
tomorrow.

--7l5+0t3ML+7CLn0M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFN48ACgkQJNaLcl1U
h9CQEgf+MLF057HHwoayBWlstVCXXqOPzj/6ihlVMtytQ/28uYCOeQIdckKAvTMX
3SRSRsQ15OqmXvSk1FQUgUp2ODodbHQRVWpNJA2v734GMX6Saj3d4KNSR1kPG+Ks
5ZVZ14lT1WXvxUd8PwY9+I7fdRSqmpdS2fj6tEt1E8qKEY1KLm2rip1f+WEgZAEi
niCBb/oBlrEd6K3bRCpLB24ljWLj/DIL4kXwDTagA2XEi2NzgjsRADtg0xK+Aw7m
kk3x0w5pfXVDtc0lC+8kUuvkZQSdUEvyOjvQXxOJwo8nHrcTWVSkE84FLPx64qqy
mSFCHpLdtfyNdGw2sjNtVa+7sM8/ZQ==
=wUFT
-----END PGP SIGNATURE-----

--7l5+0t3ML+7CLn0M--
