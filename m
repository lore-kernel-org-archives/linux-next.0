Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459B337BBF;
	Thu, 26 Feb 2026 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103963; cv=none; b=SajrshRKMx/R+AA2vhKTHGkKLIuVQac3ZLIqzvNM58Of/5QMUZ3+Bil92EV2GA6MvHMXQ04bnaKnyluVA9Jlk8tAWqOJa1JfryHjL1XpJFFDKRkVfi4guKob1b3Nm1Hd1HBW8DdnZQQV24VXthXWsqMo7+WdVCoRtJLi2oN76co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103963; c=relaxed/simple;
	bh=i9nMG+t1+b7oj8i3jnNgfbR0UjtuP79Nb3TiF20hNEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RdSbxiUGA2SW4j78dioMxVr8syXVtNVG42bDq4hTk5L+50IbL5zHXPU1HkNzWdLFE2DZq4RdFx32GAGIKgB6XC/rNLEvQi0TQH+p2C+y7kqo9URd8LWFvWcc1bAEQWTOqThtTEE2EOTNfGk7IQqToPKosfHZxvOQPdPsp8lkSqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIiq+y1J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIiq+y1J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E25EC116C6;
	Thu, 26 Feb 2026 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103962;
	bh=i9nMG+t1+b7oj8i3jnNgfbR0UjtuP79Nb3TiF20hNEU=;
	h=Date:From:To:Cc:Subject:From;
	b=IIiq+y1JkITjDWEREkj0DCMmIoDWFGbdsKjOtPAgk5/GiWqNry0RNLKS64I4otBbR
	 6Y+UKpEfX4K/w2fxNfHeYIrxB+f2pcq9Kw8Kf2Wpcf7nENcvYNkyEt7SZDvK6iFLzp
	 1UK/6sWwhf3BseOgI3Ekod2uOXSYuW117g9Ujkk7b/AhVU5OIVKinj4Rzwqzzmnm3Z
	 La5lain+2KzmUQ7xQEHovAJWE5LMdKXBNJXZDZSvcP13lgKB0B2EJCLbEkGhqhPY2g
	 Zc7KtfcNUmRmZgkALE+l2cUXvLz0/C6mmDhyFPnxaXZnfKHGd8ooEzu6P6Qrr0Lidy
	 j36tRlXmoZV8w==
Date: Thu, 26 Feb 2026 11:05:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tag could use some work in dmaengine tree
Message-ID: <6e72cc74-943a-4321-9be0-8347544165e5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KYKJEaA/Dgm8IwhE"
Content-Disposition: inline
X-Cookie: Honk if you love peace and quiet.


--KYKJEaA/Dgm8IwhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  a1adb6de361be ("dmaengine: dw-axi-dmac: Add blank line after function")

Fixes tag

  Fixes: 82b5c9d6d4de ("dmaengine: dw-axi-dmac: Add Intel KeemBay AxiDMA BYTE and HALFWORD registers")

has these problem(s):

  - Target SHA1 does not exist

--KYKJEaA/Dgm8IwhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmgKRYACgkQJNaLcl1U
h9DeKgf6AjLdliRW1q6BUK4y1BPq1JuPqTwbHx1qSD0VB1V6/mVJPb1kIVvCyrVh
DAZa4jphhjzVdUQWT/RidnkmT1KFUpRq5G9DkyeaRkH644qKbVLYHXMMHZzieVjV
s0JSgJI7+OWQA0Q84KlcCb0rtqUO95bZBdy6qY4OF4USDTD9UiX8bCa7ssRSKc6h
CFSCmrjqJtqmZlfh3dj5DmfT6zt8nNfOTfOHv600L3nONMuwnXtjWq0F6sj8hEo5
B7JwGotDiORHsjJ29Lsm6M1x7+zmkTYC+WTd4BJme8KFmHREMSKGYrKwyzDtCwk+
Pm/icHiC0Ydfzumj8VxerRnkm8bltg==
=y9h8
-----END PGP SIGNATURE-----

--KYKJEaA/Dgm8IwhE--
