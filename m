Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3AE2DC798;
	Thu, 26 Mar 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533413; cv=none; b=CIHMiK8/5b6G4OhF3zOyDp/BHWfmFy1aLTbS4ybIsbvRTEslXmLQoCHIGEfoMchhYpYHGaNGuGZo5Cy1rK4EpulyJWOl8tQbXP2Edue8HNuMemukYeWM+qcZgQyKjHu2T9IT4OTD8X+4fOsuETFvaZM0pXBZdr0gMp1WNOyXem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533413; c=relaxed/simple;
	bh=ZALozN1Nx3of4NDBwAXWoz/qrxVj9+d3asTTAOlPjLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vm26IRhqXZrEhGOyKhPyO3JYFBq9jH68EhHnhwc8V7OACZxjOHQ4JFNT5QFgDfBJIubzlSYJtXaa+D+Ghb38tHCMZAFAaBQzw34riLxU5QEjcDLNDMJuHL9FmTyEts1JKw469+uZuXckWlaJpfFleAXfv8Px0d6as8V6bFbE5+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eW0aYfz4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eW0aYfz4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2B8C116C6;
	Thu, 26 Mar 2026 13:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774533412;
	bh=ZALozN1Nx3of4NDBwAXWoz/qrxVj9+d3asTTAOlPjLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eW0aYfz4i7zpWdelyH3Kl+kty+ktu9FDSN2wF1FeBZ6wlK1iOPuuDe8mVla9E6sxf
	 6A66q4KTRCzXLgclouaWMSyQQU7FomUmMoIH6BqKpMU4Dw24GCYroYPxmy/YFObQc5
	 +oKAr+/bVdjbpbSHX19L2M2ycWBtuoD8YP76WD1WJoqmKEy7rDbCO2M9nC1ZYakNNQ
	 B9Hjxta758p8UbxcbogWaPXmsEkblO3a37qKSfk9o6qVoMPjX9g4hzMPRlR6+kegYu
	 Z4KS9WjpIbX3RutdMLAaU51pTNmLLadAIwgPYmhAgwv42YLca3v5zb6ivb8rP5RTkN
	 PFz/b9Xa2R9pg==
Date: Thu, 26 Mar 2026 13:56:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: Missing signoff in the qcom tree
Message-ID: <59474ff5-1887-4de3-891d-18b0d37c7493@sirena.org.uk>
References: <abv-BVinizEwtCm2@sirena.org.uk>
 <61710c92-ee75-45c2-a9da-cfc7cd9b5d7b@kernel.org>
 <8769b8be-ceac-4516-8e89-77860c5c2443@sirena.org.uk>
 <75d0279e-beee-4494-ac29-e1addc45f95c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qXpOr1WnmdawDv7B"
Content-Disposition: inline
In-Reply-To: <75d0279e-beee-4494-ac29-e1addc45f95c@kernel.org>
X-Cookie: Here there be tygers.


--qXpOr1WnmdawDv7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2026 at 02:52:54PM +0100, Krzysztof Kozlowski wrote:
> On 26/03/2026 14:47, Mark Brown wrote:

> > -next uses it's own contacts list per tree, if there's any updates
> > needed please let me know.  For the qcom tree I currently have:

> Sure, got it. Then for qcom, please switch to:

> Bjorn Andersson <andersson@kernel.org>
> Konrad Dybcio <konradybcio@kernel.org>

> and I think Andy does not need to be Cc-ed anymore.

I've added them - Andy, let me know if you want to be removed (or Bjorn
or Konrad for that matter!).

> Also, I saw that Shawn mentioned about change in imx-mxs - to include:
> Frank Li <Frank.Li@nxp.com>

Someone already let me know about that one.

--qXpOr1WnmdawDv7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnFOyAACgkQJNaLcl1U
h9Dslwf/coouni8kd7K31uKOh/gXpSJr9yrk7x7gYDDNhP2mw0NkkmsYabkKbFPX
RYHv54RiCN2mS4YGt29SWdBLHol/u+Eb6/DRarjqHprOdsYYrut07PrIG2qoNPel
9lu1PFoHDLf2l3izOC+Yc7uY05sIkYTcFFf8Ip19naF0EiobbaFfh7YQLWbKsECr
J5HfcdMw8h8LPKg60YrQd8jWZ6L9VsTkbL03ygmxYNo9lDgahOEiF8ZzXsh+dYRV
74kJEx1D/ie+7DSRFpdnPPd7r2lwa3C2Ari/DIAPxez99pY1aN0+DE0r53S1ugH/
EhpzSqkyRiEYxFDTIlXEcGLr8UUWVA==
=Xsz1
-----END PGP SIGNATURE-----

--qXpOr1WnmdawDv7B--
