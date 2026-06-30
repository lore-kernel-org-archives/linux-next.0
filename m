Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F43BED01;
	Tue, 30 Jun 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833342; cv=none; b=PhY0PbrIC+iGWO2lO2Pr5W5ZgsHyASfX61XoGx2PcnV7vrf8nZGrdroarLtNG1Utwa5guMkx465R/2uTO16/CLV9PmBWGF+IsBqtfpqahCOo8xaCta8XDUiHisfN7lLD1kVvGHQS9qyKcHgQBvV06cV700zF2U4n9HgWTRSVV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833342; c=relaxed/simple;
	bh=zVuO7UMfqtWrZAR8Ny4QBMTgIXIwyLB6JTpmufWjSbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SDIy8QY7yiSlOxZ8bcc9dtUcxMhT5FCDHA61sEq/IpS1HEXjoz6i/cDykfEe66fbWsY72b9CbloifRCaWclYMEr7iluwbstvWgduS/dyxDYJifrSdYhUbsBP3mXoCQP2fk181bo+y0l6WcQQzTqCPJXGMK/mxQpY0LizEGE7mco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZawjOD7C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZawjOD7C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091F61F000E9;
	Tue, 30 Jun 2026 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782833338;
	bh=eNRcZHEi+sWqrXaKp2YiEZpqdRAdOI0YpmVUfOV8GSo=;
	h=Date:From:To:Cc:Subject;
	b=ZawjOD7CoeB1Iepwoghw9ZxRQZouq+Nph6w8mM+Y5ujCrrefwfYz3gBegx+8q7u4P
	 CUWG7fwPcRPo8Z36zuZ6Feyvs6CJHZXl/o5hYjJ6AFJSJP7Vd5nHTL7ElD772kbncm
	 s8OqmYDdq/B7pkN+lK7e+/4LXI/H+1hk1P7G4gBOXTlByTul2L1FMzJHNXuX1fEmQX
	 rCxK6jAULnkGheVOwWJWxsQIP84nUKzm3N4N9SXQH4qU6qFEB4carE1Q0Ntd1A5o/Y
	 r+EeBOIKmzGR1oxQcsfNPquqgCvuDUMlxyfhz8pYa1209Pug11HKmVcBrtR7nFfBk2
	 MLFwciH3eHwBQ==
Date: Tue, 30 Jun 2026 16:28:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drm-intel tree
Message-ID: <akPgtvG9EP6wBnBt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zp3p2AqqPMtFQbFK"
Content-Disposition: inline


--Zp3p2AqqPMtFQbFK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  3f9de66f8acbf (drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL without a full PLL re-enable)

--Zp3p2AqqPMtFQbFK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpD4LUACgkQJNaLcl1U
h9AuWgf/dK31r/B4goGnc8moZhRjkkDDyiStkkmSu2MhHOycRrqbAiAB3uhULmbA
IglqFpNkrko4Rb3kr9z3hNJq55Z9/LCjQeXbYSq8/utC/cBkv1AlV4vygM9h7QvY
N05rdGFsp9NBvEkKCtbgbMwdRIfip/WbIwvpHXSOTSio9P/p1FhFEEwQdXAo3C5l
vK1KxIRoaRmS1GN7yRf9wIhfH/g3ncvvPIbOQ05ZnaDbN1/O1VSxajk/eT47rl15
pmFiAKaOKwrLmEloq1C3W1IbzO+7ifJPlJYkL3D8t83wR33hIOKrYCSOctzu6lB+
PTWgC+K3G0vLtL522Lr05noZz/MR0Q==
=6/WV
-----END PGP SIGNATURE-----

--Zp3p2AqqPMtFQbFK--
