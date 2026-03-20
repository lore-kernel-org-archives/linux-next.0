Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286423A6EE2;
	Fri, 20 Mar 2026 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009829; cv=none; b=OlaMkrN7IqZv2c77qRrK+orH7gLhgstPPtPnMtZ1W4agtkQ0q6UAwte32e3JsBdWNawUM2hsZkpd93QoidRz8kYLteuVsqqLbfXs5/extgJIDb8X/+2KLyCq1A52qHAZ+zDL4p4m1Nu31WZN63NAyWa9IpF/FRusv6Bcpi4m7aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009829; c=relaxed/simple;
	bh=U8NCA+GGGkfF20Ykk2oOOe1V4A9Dzw6GRqau+v/S84Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NSUCpPUJdHoAJzu/Y1XeBXv4nWG6bqujio83DhgAuxOvrS8YIM7R396II/vai8zm58dnpQMNGru9RzvsmbsSXDlvUArPE6KIby8cA3zMLOyhnsmpNuZ5uKl1GTGPmE9KJkWr6eko9ml4D7qs9OMmJMXp7H6vHJCJtylN1c0MTB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW/MIzpq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW/MIzpq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FEBC4CEF7;
	Fri, 20 Mar 2026 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774009828;
	bh=U8NCA+GGGkfF20Ykk2oOOe1V4A9Dzw6GRqau+v/S84Y=;
	h=Date:From:To:Cc:Subject:From;
	b=CW/MIzpq2YrRTIf/hLkNLwvp36o0A29gyM4PPaNThYiA+yDc9BgBT/NPA8MTfYPhB
	 zvHg1lOyAFeu3zxNKdnTXwGQrI/2BHd4ubgFYX9OvIbh9MgIYZvPCXSizgKXHtGT4v
	 rWpim0thmz1ZeLwoDt+F6JbCwUGVS66VTysMnOl8tJSjeH4ZP+/InJ5O9LNkf9DlrZ
	 Qwz1C25lnEVaZJrT2mOGp9AV5zR9mnNM0uDX+AosRTbiTAh+HJp2ycQ1tCI20rwowe
	 5SWsZpOSDjkFAeAM16ntyF+vhdHdAfvs1VMWVKs6yd+x7iJD31M6trsTN71xklkxbx
	 k+mX7mrbYVY4A==
Date: Fri, 20 Mar 2026 12:30:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the broadcom tree
Message-ID: <ab094YZVvPA5dxu3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iL2ye+oM3kPR0iJH"
Content-Disposition: inline


--iL2ye+oM3kPR0iJH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  b887d5ab5ba33 ("arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level")

is missing a Signed-off-by from its committer

--iL2ye+oM3kPR0iJH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm9PeAACgkQJNaLcl1U
h9AfXQf/R4I8A1pD6j4iahCXZAqkjuUGiys5WeKkhkbj23ASaNcyuGwNw/7fuGWa
/gnHB/jLVAcIRUzOjOsecYirfo5JFe6EkQthGAKNqoGl28kJVUmeTTXpbAg1I7pn
UVLyredXPV5oK2w5wr/rVmu1HeNrmgxzuMbWbVj8zYydWl5O2wwUQMe30qVfHkAE
QRrPNAzRQCXVClEKZcYNZDPtvmw7+i34LN8qAu/cz+DHkV32FGNrtFhVcvWG9dC1
vqXt6eYDsEVUtIvFbaGisd0zdprJEeukp4Fn0Ofqtz8RgKj9hfvoWic1x0NtYccd
/O3am75QJljYH4a7NOTssNkHbHBcQA==
=99mI
-----END PGP SIGNATURE-----

--iL2ye+oM3kPR0iJH--
