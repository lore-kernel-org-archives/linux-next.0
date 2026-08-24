Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8676B3F1AB8;
	Mon, 24 Aug 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569227; cv=none; b=PfHdWgyYy3Ljh5ZrimhAmcdoeqevZYW1ofAo8NyV3SnC0nPrPtbg0GwoIRrgYb699U0W28vctUf+W9vFLusd+A22U2B2zjFmvGPyvq8HYjwkBck41rNnQAriw9A3ZbnNLQ10XuDf9cAnSpxGyjDDb0o1GcWMzVJqYkZeEnRijc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569227; c=relaxed/simple;
	bh=fbPg9Y0QbumPY74TlWicT6vU2azsG21VzGbClQFfs7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FtJMAQlpUOT392+7O7foDtD9iA86DywK+u4TydL62FfJmrnCaN9dy4NJqDK0puOXvuK2Bt89PN9sNRCK4E3yzNAfGzOYHJhnaaaw0KuEchFoWCqYCLCMWqmij1R9ptWQUAMT0EDHo2OE8vOjro30HCg9yCWnaxsKk88roDy+ED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvrsdGE7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvrsdGE7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2CB1F00A3A;
	Mon, 24 Aug 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787569226;
	bh=Aa4UCu0OaLUfyKzzk/a3SXI2I00XUDYQC6iX8Ye8QRw=;
	h=Date:From:To:Cc:Subject;
	b=VvrsdGE7jXOUBU/a65qiIizK1QIBcnfOwMpDwblmUOI/S21HiZxib4VsJWn1Irq97
	 b0Z7aYR55rJYu5f9mf5WFAKqAL1SSBFG8bFfzuIWvRCHV+Y3nOVawiuFXg/C6aeugA
	 pA8eZ3tgd9+MIOUNqjyurk5UmTm8zI2+agKbNVo7dGXnV7MHuZ0ltQhEHeggdpisnG
	 BBBX31hEkgwDnT9BWIyJQ4YantxdvdY7hrXuABisETiyefx5oPI1vKSeyQToAsNYQs
	 VT+z9Zvr7P2y6Lh/YEjiVqQF8HiubPoVUoACG4V1YJeATqoj7d18wtZtCQb+MzI3aj
	 VSztI471N2Nzw==
Date: Mon, 24 Aug 2026 12:00:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm tree
Message-ID: <aowkRsjyOWW4D-ta@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F8EZANPlbTFCez3V"
Content-Disposition: inline


--F8EZANPlbTFCez3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6cd33b6f4155e ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")

Fixes tag

  Fixes: 6b16f05aa39f ("drm/msm/dsi: Split clk rate setting and enable")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--F8EZANPlbTFCez3V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMJEUACgkQJNaLcl1U
h9AbMAf/d2KMzHdlADK5mZTVI6hhm8NzUYKeeOVqWblVGjbCV3ZUl+of8Kz0NmK7
ldPF6kw902W0+CYIhQmjm4gXFR/Kh8voVdy4cV3tjJO9vfLDY4Rw3NKsQfEO1f9X
cnPSrNUjKxdRi/XlZQRKi1b9NHo+DcNDvH+Tj947VQ7QFt43llLdoC3CWJhJq/50
9f/jb6pBi21mxS3wvRc+UxqJC1OvcYdxQNs1sgxZv7A8KJ4omlwqmCux7aUJEJT7
dd8EdrWKyCFt11ixz2NHzDSFDlHJhbn1CKZI1mg+yBn5X5b48VndaPCmMGSCFQIW
PO+KhfgO2BEz3jVEbUZwPUFcopkU/w==
=LF65
-----END PGP SIGNATURE-----

--F8EZANPlbTFCez3V--
