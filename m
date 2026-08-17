Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65EB43A7F7;
	Mon, 17 Aug 2026 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980677; cv=none; b=VTTw4wDDOs0GRRauGicgng82PBmUUNL4U61LFMsFeKVat7+uFm80+BHfU9qHdNdqKkPUrxDggSMGJXdULd/BXpTFvDI9Hdo6JwlI58mpRE/KWuxPdkbeLSAgJB1FtN/6jyRunbuFfjBv7QpwaTBXFnhfw2hyau5ucze+rINMFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980677; c=relaxed/simple;
	bh=IorIHw98UY26CI71Z/fIb1DkUsjJ7k5BpL1iYdLZR6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TRnIsl67xY5JN6lWY9w2baGYrG/2bA+XdctBWEwfDgqBVP/OKa1L65MUD3uksjZ5RF69fBrk6vugO4wVlt8GZoZmbzPk6HZfofisaUnqNXyjAPUo/5SyHO7eaCvKY3L8I5De1ZOYKKU4NEDnQ/9cqczMdKJtlE3JQ9d3Nsk9r40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUjgT7e9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUjgT7e9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209EE1F000E9;
	Mon, 17 Aug 2026 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786980675;
	bh=7KNCPOKMWxdL60bSxrdpOdEjJ85lxwCVgFz0XuHlwps=;
	h=Date:From:To:Cc:Subject;
	b=BUjgT7e9QlUdrMkmKWP6KkDzeliZ+nd4xTVLafg9B3iPGIiJwDH9FT8syKKdPiC51
	 jGM0nQc7PLNCvJwU4TJwAy1SM9apLk1vjcb5hRk1vtBLS7NERTwEGvXOy4CInolpxB
	 Nv2LdBBwUN0/KGS97gAd2wnO77MNxBEZ9TjKUbgJMgzZP1o12uu6Z5Ea6ZEHK6CFJQ
	 /29G7shWezJCtp9m8uBNnTgtBJv6pA58V/z5xzxMsiVhCrCHkMwOKpabbnxKQzft6v
	 gxe4L0/xh05p13p0U7mBTsxQ/jb5iHJtHKrANyDqzQEXPO670KYOUAXIrfuXkxKjJ+
	 bFH84+7FaBhEA==
Date: Mon, 17 Aug 2026 16:31:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the clk tree
Message-ID: <aoMpP0R8qSzhuEId@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5MFWbvZlIEC9/rOD"
Content-Disposition: inline


--5MFWbvZlIEC9/rOD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: drivers/clk/clk-scmi-oem.ko: missing MODULE_LICENSE()
WARNING: modpost: drivers/clk/clk-scmi-oem.ko: missing MODULE_DESCRIPTION()
ERROR: modpost: drivers/clk/clk-scmi.ko: symbol 'scmi_clk_oem_init' undefined!
ERROR: modpost: drivers/clk/clk-scmi-oem.ko: symbol 'scmi_proto_clk_ops' undefined!

Caused by commit

   77369b1e6a371 (clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver)

I have used the tree from next-20260814 instead.

--5MFWbvZlIEC9/rOD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDKT4ACgkQJNaLcl1U
h9DHRgf/WAIqTna5oW9KRBVmjFg1DonzHDV8GyG3TvC29RS44GO6aWNGEUu6Ixdy
W6UPCZ96eAWcQZS20OCxcAVJH7CChdvXuuhQL5duOcGKHUchuloMHHrbx3CpJ9rt
ldtU87ay/3OTEqfNRmSC9leWgHeLEJUA9jBP+SPwFldwUcTEpWTQ7aSxAB2gTuek
I1m+/dvbBOR92b3jZy12DzkRlGEsLkdrH5qq+8Hy4Emcvw91p/kdMMy93K/yZwu/
Tvubs06w94N3G9R4dTcCQqWA5pVdw3OPrbHNQkVhVwCImNdSBPejIhH1eXLvP3d2
O8p4m11I17TJWkgjzH1HqGHBs4hg9A==
=mW+E
-----END PGP SIGNATURE-----

--5MFWbvZlIEC9/rOD--
