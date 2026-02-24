Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBD42517AA;
	Tue, 24 Feb 2026 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930415; cv=none; b=oDaKGBE4BNdh9EMN6uyQShvDYyguCJXnpmH68JFXpP3LFod7ncTC2qNkwlU2/zoscbEQQB9UwjzUAl2xn8UmOgpzsYi9IZI3qsBtEQ/3DY/jHpOsPcDkxqYhU6Ocy+GTInHVA2OEJqWsodIkpyMmgyutC3l3u46wwufvUiLv4+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930415; c=relaxed/simple;
	bh=cOk3p3RrL4VlATqETlifacxX0XLdjKD2F0FfnZoc6ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/0H3nKVnZCC4YXlU8HkefBBjKsMnCw1LJ6T6F4t2z3dTelfGPLdBnC7u76Kd8QhzcKG9yXtkIqVyjY9jriKo3wqCEdGupAkbkhQPbT4hEB/oiN/qDdPGPMj23PwofuZtfA/Uly0Q1gXTQDGVUed9pNHfZ9qpp6bxH/o8tcRzok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wa3F7677; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wa3F7677"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67303C116D0;
	Tue, 24 Feb 2026 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930414;
	bh=cOk3p3RrL4VlATqETlifacxX0XLdjKD2F0FfnZoc6ZQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Wa3F7677ZmBa0PA8pMm3VG4R1qonISMKBett/VwI54PyLPP0bzQ/tDuSysU1tBb5k
	 Q6E2e+3yEzQrI/VOGBBgOP0hGx3W4q3GvxlqheDU/Th8tQVbBEqtJv6FAUR1aDXyad
	 dzB6phMk9EuWd0Wx05YwyKE91xcAAnY3UtTuppOKOkLZ51/zj9l8PhJWnWEe27orYH
	 oL3eXicPnmusmADmfAmngwrnnxtZXlG9dKMex2nnHbwqR8Ouv66JLR7eNGF+tnlFAn
	 O52ILaY4Qci/jq0McbJdcOAc+JSKBGL/vsQMfdMA1p7mdE5nj26G52iTJSsAoKLdAK
	 NpS6C/F9pM50A==
Date: Tue, 24 Feb 2026 10:53:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the tip-fixes tree
Message-ID: <aZ2DKWBP38Po8LzT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gey1LxbW05zAQyec"
Content-Disposition: inline


--gey1LxbW05zAQyec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  486ff5ad49bc5 ("perf/core: Fix invalid wait context in ctx_sched_in()")

Fixes tag

  Fixes: f4b07fd62d4d ("perf/core: Use POLLHUP for a pinned event in error")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--gey1LxbW05zAQyec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmdgykACgkQJNaLcl1U
h9BAwwf9Fzueo2FfK7BH0y/hU0i51J1xpQ+p+E/pDXStQ6UAiT7d/hRSFwV2uOIH
WuBihQN48KNLYgXPjYXeceANqLpakf8kkreiBZHOTa81npM/pzY0jNnOgbxtMnf+
XKJNvMibfYMpxtFqawoEkyE1SgCa9nBuJD164XX6H/Ky7xcM39xQt6+JH2mED/ol
oC+QXVMy/bNUWf3gQriDEPIKgV1oFh2uVKVOI+38qVs1Gtz/7Yrra/RuuzjepG6D
1uNh32UCQSd8aQ1FmruCbERB7S6TzSBH4h/8OTdGymjuEZTAFJUtEzB6ZfXokcmd
9JQddrBelFm60vrFaImBA6xWFQYC7Q==
=8vuK
-----END PGP SIGNATURE-----

--gey1LxbW05zAQyec--
