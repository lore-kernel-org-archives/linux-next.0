Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB161DD0EF;
	Mon, 26 Jan 2026 22:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464852; cv=none; b=K7uTQ92ISDpXWRcj3jVI/xbiWwFb1vFFnViYirU21fD3Br6VBSd3EWjCuQBqpb+1+0WETgGvngJNN04HMUvK0QNPvgEGZFcfgkk74Gt7T5szIxyUEtkOkyMNt6P5A/G6kxt6No3NxLPDM7Zc0etyeiS+ejyPoUxOMwjhGHRcSLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464852; c=relaxed/simple;
	bh=vyYm2dGZrFB4gOdACIVGxhuFFPOHkXMZKig1Iyf9HDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvcXYicSRCJSei7YT67YvnBRuXtQIw/PmbIsJRFzU6c8wtdPXsPCaoYSRoCKEPRtaoPTrVoch+IFLkBGNYdEiA8k1K1BvPVt/3Gz593VNGlc2wAseJO8/TbHzB0M16w8j2HJgHKPdxgbHiS/hTHKi8/OjjejmvppOh/716upCsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILO5x3EQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILO5x3EQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E10C116C6;
	Mon, 26 Jan 2026 22:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769464852;
	bh=vyYm2dGZrFB4gOdACIVGxhuFFPOHkXMZKig1Iyf9HDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILO5x3EQbOFATUr0eoWDpwcUzLsSbhuDicrM/3D546bM2PY3s0j1CLQ/LBxAKplVq
	 6KXF4ex8yHWGJ365DHvV+oUAnmf4alS74Q83pjYqyqLZyarBYXRo/0FBLfPsSjGQjV
	 tRuXw9X/VBrsbN8MBURN8GMPrItQTYK+STdtIIVwKfEW9xG4UVBq/djhUETKkEDCWC
	 dXH/0PY28XVEHKFfegqK6SNuCezPkkYw7DHEmkxBOxd84/V6GmR18J8iu7IfAEwWzJ
	 FK0jrUzBN2SCuUxcqmiNXAY4Jk/PZZOmMQ4gQYCwlhYhh32q61SSKfxKDgu8Jsj3vl
	 D9yr5FGxf0dUg==
Date: Mon, 26 Jan 2026 22:00:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <d6ad2221-359c-49c2-984a-82bbdc9fe125@sirena.org.uk>
References: <20260109124558.25b0eebc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JVF+bDkP73lipDDH"
Content-Disposition: inline
In-Reply-To: <20260109124558.25b0eebc@canb.auug.org.au>
X-Cookie: Haste makes waste.


--JVF+bDkP73lipDDH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2026 at 12:45:58PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the leds-lj tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: missing MODULE_LICENSE() in drivers/leds/rgb/leds-lp5860-=
core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/rgb/leds-l=
p5860-core.o
> ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko=
] undefined!
> ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.=
ko] undefined!

This issue is still present in today's -next.

--JVF+bDkP73lipDDH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml35A8ACgkQJNaLcl1U
h9Bnpgf9HvExkq30cXLoFoT3DpPLk7NqrMkj025MNKZb457LXril+znjFkK+i4qI
/A5oLDPpZwu4FXcvtQPCN+UppbAWMgt/aGXZkuOI0OBkwyXgBnzZ2VxJ3LhG0Er8
9f1Uj9Wgs8bnEjvsyawALoi9DMCkBJFkBohfZH5Wo36C98WfaPBiX/VWbqpYF7eG
IEPAZ8UfXLoDDdy4pEwFFgB9aI90wyM7r+6/aJ08TQbjtUOBBrqlKxQllAoM/raX
QcF3X6a+DzTbpNkmXE6LX6k1AFXMdkGvFT1oatfK9vMs6+fJD1ihOjMhtf9VrL80
2DjXAPP9HZiD7XQEAIdr4Pu+hGuaIA==
=Csvq
-----END PGP SIGNATURE-----

--JVF+bDkP73lipDDH--
