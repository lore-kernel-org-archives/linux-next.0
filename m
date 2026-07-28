Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB363F58EB;
	Tue, 28 Jul 2026 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243769; cv=none; b=UvhRgYFU1fJLiXngRzKotaOiWbFscB7OASo5/pHGNodEJGOpVcJLSOlKRPTjz9Ol2ioYmMZ7cANWSaOzehhdyeVdHdurQG/00JfUNJMLq+38bUzJchKZaWTzMu1A0iTTTlhci3A03+hTMJruJbWhlPwjYgkojAoJwJOni4eddpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243769; c=relaxed/simple;
	bh=un009w7rQ9SvirDRmLVawzPOjb3EvPlZHpJL1EmWePU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNpd11vly69DTuEv/lc/lFLTupiIrqwztS7QqNJfm8SSBrpHzdbJTYTOK0TZrWVeuRsq3gRMZSkuiSQaFZeguZ98fYtj1yNfH19JCOaJS+XdvK8lUQns9Vmx2UbPZHbr8rCmnaAgFtyUgLFQKQV5ixW/l9ONm5JTMqauSZTa05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IG0BDg1S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IG0BDg1S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839561F000E9;
	Tue, 28 Jul 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785243768;
	bh=viCDBpctbFvkRn/PQqxgqETZenUmYs88VEbIaWhrWfY=;
	h=Date:From:To:Cc:Subject;
	b=IG0BDg1SA+TvevFI7CeSd1/tq7NeOXda/A3VrRDmo4OL8sjrOZHVjMAEJqtvusgBV
	 4MTpMkSte6sq1CEsPLIfo8c1AY3O6ODY+qgzxukoKXWwGv2xsAwgpAjVCAw2jAdl2O
	 uFyf84oGRS1PKBpMtB5qc2OofV2MCWWysXR12cUw+zRT0dqcxTjkf+0Pby+izf1AsZ
	 /Nao7z7H1UEhO+Wlb714UUqhQ+Bpv1Qk8YDtEhpL4ou4VZN0xh61Sku6jR2/cH/0Vs
	 7YUwhgEiuVAK44RPDRB+0BZ4jHLT+N5DXlWE3m2oIizQnMvkEop8YyKXAx+r9hAE3/
	 UvIqHZBF8N4QA==
Date: Tue, 28 Jul 2026 14:02:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Unexpected files in the drm-rust tree
Message-ID: <amiode9ojm4agngI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iRNSh6LZseJ+t0r2"
Content-Disposition: inline


--iRNSh6LZseJ+t0r2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted reference")

added this unexpected file:

 drivers/gpu/drm/drm_panel.c.orig


--iRNSh6LZseJ+t0r2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpoqHQACgkQJNaLcl1U
h9Adlwf+Mm3e3eFYcIKQy19EtayVA3bWB8uwxUYJwsA8fYN/sh+EOqdsoqrFrlo4
geR3Wq0DEKk5a7OFexKTQhBJglr2yiOAGOh/g2wtFhsAmEiWwfUqD7cpQ219YQmj
I9OKFLLl6NqHE+io0qMGZ1Mq6AiIfDM8onmOzeHRB9Oe18vbIQ2NaSf8iDNJGZlt
tvrphkl+HPtXisGIsFSOIcJms+ur6pffSRN3dm74G916GHSgPOOG2xP93u/xWj7d
4wyabyy0p4THnp8u96PCOBol1ZTlzuUyBMz92rBtxBHUwgi22fsdD/3PWWaBk6Jy
2tCwmq//gCE+0wmSfjnEDjvi9Cbh0g==
=lsoh
-----END PGP SIGNATURE-----

--iRNSh6LZseJ+t0r2--
