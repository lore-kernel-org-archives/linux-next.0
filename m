Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4F6340A76;
	Thu, 23 Apr 2026 11:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943376; cv=none; b=MQg6L5LaVZfvBE4KGFQ5NbFfItWbb9v9nrANLRyKXvlMFNwyHMDjOFfslcXLWV8Nlwd3hr6k7ZNLxnlnm+nBon8ml8WKmVHJn0YZNiZcT8sP+izg9Hx33tmMfOdeZqqfxoaMX1KPf8DXCnfn48whmwQLG7H1bnPUf8WMRbdAXOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943376; c=relaxed/simple;
	bh=W0kPKDjAXjKIe2ibKA6VtlxPm+kxHrGyDbyB0+9uj+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEC7+J7LcVqrBzcxloCdhLYVAg3w1qQatOybLlmO1Jv1kxodMcKxqB9P+is68Lp5NrInAKOU5CWkL7zyyJWxfEQdlbebyLehZKrhleVBRMobZ91gJXa5O7MP4xZnl017Q6ceF+Xf0KoV0qeMVWWaJ1SkycjVyjlLKOGtj84lgWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zb9MLQd8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zb9MLQd8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8E2C2BCAF;
	Thu, 23 Apr 2026 11:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776943376;
	bh=W0kPKDjAXjKIe2ibKA6VtlxPm+kxHrGyDbyB0+9uj+k=;
	h=Date:From:To:Cc:Subject:From;
	b=Zb9MLQd8XV7141jpFcWKtrB6FfNcakTY7IszcIvES5Ts0JAJTq86PEaZXtDMkJFN7
	 THCkx4xwoQQrkkTnOOvenIplhwlqhBq0gfbqPspQY/37w7ficLb66ZVGmD1N/lMSlX
	 fyyrrUkqpUMP8yWfosv7UvORwWsFNZPCli6Ey1uYp0WrDVflwPPKSl2iUBJmKf1EoR
	 sHiKAgiP4LPf5DKpLU7nb1rVr5O6mBHVvFAbrqh2P2ufGRzZJS3UDXQmmsJWOkGudh
	 +YjlWGZfYZEcKn5nmEzhjxzyyMblWl07WnK0ajdZNdMS5Y9uoelPyIb7oYkUZgu52Z
	 TvfSWcxaGIMgw==
Date: Thu, 23 Apr 2026 12:22:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the tip-fixes tree
Message-ID: <aeoBDOpfrgv7tC3x@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z2WuDnHvggIHGXhK"
Content-Disposition: inline


--Z2WuDnHvggIHGXhK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  8e3705911af25 ("x86/mm: Revert INVLPGB optimization for set_memory code")

Fixes tag

  Fixes: 86e6815b316ec ("x86/mm: Change cpa_flush() to call flush_kernel_range()

has these problem(s):

  - Subject has leading but no trailing quotes

--Z2WuDnHvggIHGXhK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnqAQsACgkQJNaLcl1U
h9DENQf/ZPlZmzTPL60MmEDD6USO3TwtB3etqAubqWjj/Ch6anKM523Xu4NVVd6o
u20mrF/e1rmmbKBwIkxmdeXDOh+q1y2zJd5TQTsqGfLU3zmx0b7i1eCQQkoYb95C
RCOez+CBj5EHq6kMwFlmGlak355fQr6yxAZkE0r5aaIj5uEmO03kz5XRXRxOv7F6
5ni78b57YgLvEVjlgglhc49yd54G9YPTfX6aNsQ5qK/2AGFifKb7z0t2ffxjP3+G
LuBED5SqSB7WKDAPxtmwWsJZC0sxxPQMZw+leKVdez4UEKm8PGE/3FO2BAlWA7uv
6aUP+12hl8yq392oEqSd3WJ27ZflOw==
=kCw4
-----END PGP SIGNATURE-----

--Z2WuDnHvggIHGXhK--
