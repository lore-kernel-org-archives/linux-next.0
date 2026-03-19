Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1C28506F;
	Thu, 19 Mar 2026 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773927945; cv=none; b=bcE3vMZQYGnoUMaytUh7g+FmfpPi3+hjwYd4hkbmJwsWK/vUsXvZP6DpWWhvsSLLA2qT1OzjHl4qrWBbuqGKEHiy4X7D+V0VBkbSDt0XzWmvRHok+X9CEqvNuyUpLuq2+rfSQkESmoOyOz5l7OhW17UH0TjhCj8p0NoVwxdR2Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773927945; c=relaxed/simple;
	bh=zQSbwHa3+9OdhELRFeAIreYkRkQjY480foZdiPzlDEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bHRBLP0mdNjGFRPLNcW7LmFJO+wldC3jIDeQTOSKOQR1kgEmGkFQiL0Vq+4AxBrpArFczoiJHzQp/wB8VXSo3y548+PG4BTiT234JSFykOPOf3uggnpZmAdx/0zgVxw+8TwaIWko4En1HF77+2q8h8HwGk6b4Yqm60QwRDDNLV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQQhTQW1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQQhTQW1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFBBC19424;
	Thu, 19 Mar 2026 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927945;
	bh=zQSbwHa3+9OdhELRFeAIreYkRkQjY480foZdiPzlDEY=;
	h=Date:From:To:Cc:Subject:From;
	b=eQQhTQW1w8puuiPei25KQ4ONwdqOvMozVt5xL2/hjUCemDSKa45xqzMayYORYqSIC
	 FukWjFAWvRbE/3982kkdVZxtDs9+9BffbbG0OU2U8gmrFd3+aIf79iSb3OgjOrdq64
	 LaVkW7fqJ5r8mO6aqGfLMpiDURdhKpFKOmIV2Ufmscqn5yITiut8jpPpkmIHfmvn+y
	 sJ6GW36HUeg2S5plESjB//L7sFtneccY6PaG4KrXOoYE5rrrIn6OD8GtGAxVSVBaaX
	 fv5rGcnAAsd37UvZWtLSOkWgisayEg9ZeW6kihnpeGiZ/vC5nvZZi6g9oBnTWMrUET
	 AgayywvonyhEQ==
Date: Thu, 19 Mar 2026 13:45:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the qcom tree
Message-ID: <abv-BVinizEwtCm2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LipWQ4/RJh5jkPLJ"
Content-Disposition: inline


--LipWQ4/RJh5jkPLJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  a210cb039b41a ("arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support")

is missing a Signed-off-by from its author

--LipWQ4/RJh5jkPLJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm7/gQACgkQJNaLcl1U
h9AnKAf9Hkuz3KNHUUvewS+IgSe68TGcdFyvRpkL1mjesGNioLB0IRHUmJS5+Sk8
8onwtcYwhlgEQp0rWElvNyb50y5BZcyro9dZjKEA1Klt+VfoJVDLHu+dOOa+J4Cq
z7M8ui6vJg+MJnr4MUhiH+nINkJ2jp9GaJAczGqtVQ97Jo7AnowWhOIN4pv00ZXs
ynyODkwtknTN9GFvi7QpkUthtPk1v3/MpFoTKrTOmjHyFjc381NA9jC58pmB4b7R
T+2xVorj10afonPq8cqjdrj373bzB7Txb5qVCikdG8KWgv8Et+j5ZSI8z/xXhlJV
Wkd96dZC0o55ApcMRWUrKEoyLiNgmA==
=xELS
-----END PGP SIGNATURE-----

--LipWQ4/RJh5jkPLJ--
