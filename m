Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE47364021;
	Mon, 23 Feb 2026 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849100; cv=none; b=qX9J10J0bve5BQh3ZcAzkQLCbzyXgD9rlZC7SwQUcWgn09kao5Mf4GVFnPxA2pVh9alRLd8z58ebvIdT23NC1xuwgOfTlcjy3yxbG9xw9A8pVz5971eFtT8dktPy8CKhVbCGiuOimsYUXxi5mWHGMfue91prEzaP9SSnDp9UnDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849100; c=relaxed/simple;
	bh=SAsrEMA7uuoZ2gplkm3xcESYDt9AQ125e9bIYYhelOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dx+VIkRSOHzE6BclxkNhRxw7yysfQHJN3ShV3ZIQXf/e511JNlBZzh0SUOQe9wuMG3PayfKaDkhN2Ow2k8wAyMk4rSkI7U1z13X1y7IRVhrCRD/A61cXtbvPxflnzWnrQRUjLu4H4WWzBUI/zy0KGFg2dvsw1w2itjXklG4J9sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eh0qX1x6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eh0qX1x6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099A1C116C6;
	Mon, 23 Feb 2026 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771849100;
	bh=SAsrEMA7uuoZ2gplkm3xcESYDt9AQ125e9bIYYhelOw=;
	h=Date:From:To:Cc:Subject:From;
	b=eh0qX1x6v+ZSTVsU25+yKXUcSqNi3KDSk3+5E9JEinTokW+Lj115HINZ4gDuDxGM8
	 +3EdxrDB5JpMPxOuzs/i87ILMUNqbvvMhgB2LIsK5p6jl5jsvbe2izlkdvW1GzqKvO
	 FK5mJBFCCXWowL+QAXjvbnTMMUl/6Jtjw5E6yJtIN8br1W0LNKtPvSCqVVwsEr4NvX
	 6jmigTFwpUG2Zl1MxDNBlOEZe78eVYUq1AekJ4QLWRpvs5G8ipfTBm44iv3Z926INO
	 F1xTRpY6Ax0YIyYpYUnqXJK99A3mLQpqJGflLPkIfumOGVmEYsAO2w9sjgKPgilDI5
	 IRNdW6iN+qqGw==
Date: Mon, 23 Feb 2026 12:18:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the hid tree
Message-ID: <aZxFiDybKKxezaYc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wk3fIaspuEBPlVZt"
Content-Disposition: inline


--Wk3fIaspuEBPlVZt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  6b409da663270 ("HID: magicmouse: fix battery reporting for Apple Magic Trackpad 2")

is missing a Signed-off-by from its author

--Wk3fIaspuEBPlVZt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcRYcACgkQJNaLcl1U
h9C54gf/Tc6aMT/Yt/8VimlmnXd2ucvV9wFoPuSDF2n4KO0yCYEYTcNImQV4TQP4
8xnk/WJw5pvEGM/bVNTSnDwLsaIDPx20YZ4Hdwyufk1X1Jx4n9XDJ0wVUD2A8RC7
MY6vKsu/8h68lJS9e05y6SHPXfBGhzZRpdBFlPRyX+f0n2EavQ6JM9FImGZpmPTn
1LlIddTtadRQvrSTeyPCBohIZwwyDltP0p4HUI/dfTor7DXe4aYoJBlOnhVmdKM6
FUq2EzdKTQk4m4KGP5AKdcBgVgwxsCq65/hMa7Vyn8DKVNyg21gb9F6k15K9ZcCd
sNGkHXu70w7TssN103/d3vridhFfjA==
=/tmP
-----END PGP SIGNATURE-----

--Wk3fIaspuEBPlVZt--
