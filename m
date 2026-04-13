Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A2A3264F2;
	Mon, 13 Apr 2026 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099360; cv=none; b=NnlyHmY+7r7BrOxOHmsVl+hsH+LxbSqGOpHGuupzUCS+fce2r8PjUam53dYp3x/GcrJNsLBeYIPonwOy6mgOffLt4Kg4TtjgmagX0tNKTNEWlP5jKG0ZYPrp2svCskaEaUaDhSDRpugoWc7J977wVK+R5QC2K/Q1RJcYMdXC2M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099360; c=relaxed/simple;
	bh=4GbhWOfE9qsMFZMx2V4I956VRGFpvp+ETrP275v0prM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKj8Z9PwwzLjDC87FWxUoOz2pEhka7VlfJQIhCqII+xUnwLith1naoQbPdYsIkla+h3Ct1UcEwhMuClDkCMjJPJKcm1gHdW/XTPXtqXI8+aPCRf+dgQPkzP+sHdEDzOX4Ll0ZdxDvM4vlaNCb+dZNjYzvcB3DCLtLu089C+3OG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubEfucM+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubEfucM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81779C2BCAF;
	Mon, 13 Apr 2026 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776099360;
	bh=4GbhWOfE9qsMFZMx2V4I956VRGFpvp+ETrP275v0prM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubEfucM+MiN04UqJHbOCgVAsEJdqCN0WK02cyFJAxjnYQky2S4/01KKw1Z1dwPuxr
	 hvrRMPVKMMKg91CZan8PuOFyagYtPsJt4BRUwqqX2RZVQ8eooItj/6TJWJYvSnV997
	 8Ho2Afzetk63mOeRBIttpGHOliNmsrApTLt1R/KV5sBLO94a4TezF/Pyek0MF3P2dn
	 AnNYxaBJC+VkqI1uznS4jzkZD086fZ8jm/xcPKtREPMjhuBa+j3qohJLTdLdOob8dd
	 TMEVoS0skmSs8OxKeYqdfxsxUBzm5LnwWvicxBrGzGMhCBPVaeYIMMllK0fAkgpjXV
	 o4OOXk93kH7FA==
Date: Mon, 13 Apr 2026 17:55:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the qcom tree
Message-ID: <cceed24b-f623-4cf3-8f3f-45ce8fe3e5ed@sirena.org.uk>
References: <adeNFNx-ynFtR3qn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WQ1C/V1gPejI5VMU"
Content-Disposition: inline
In-Reply-To: <adeNFNx-ynFtR3qn@sirena.org.uk>
X-Cookie: Driver does not carry cash.


--WQ1C/V1gPejI5VMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 12:27:16PM +0100, Mark Brown wrote:
> Commit
>=20
>   cf6e6ac63c62c ("clk: qcom: rpmh: Add support for Nord rpmh clocks")
>=20
> is missing a Signed-off-by from its author

This issue is still present today.

--WQ1C/V1gPejI5VMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmndIBwACgkQJNaLcl1U
h9CE6Qf7BwR54AZpzdZO59qee6ij3cW+bxgVlboZP0txAIUrFd13/KvADCgBwQvH
haM16uZzomXZlS1AsNlZmMdEMYhnXE9o8P2xG8iVcQu1z85luvTODI0JFp0X13Lt
6nji3LW3CrH81cx7UWxuQCXp4dsWnGlH7xEB7BaiJJcSJ1LZy/2I8agoAUxOEWpp
p481U3GcnTQMaHmJGoRNPLKcynzJ30pd+8i/BhrgTXTIMqoR8vFerU8Ca9JeBtRt
pHLhOtnS0G9Xr2xL95yaLzDJvGgNdX/VEF/ltqZ2+VmTO5Iy9o4NoLwzWxzoW60s
jBCHX94vzS+jHOvk6ncIbX+3D/9yzw==
=mMcD
-----END PGP SIGNATURE-----

--WQ1C/V1gPejI5VMU--
