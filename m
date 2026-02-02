Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8BA1F09B3;
	Mon,  2 Feb 2026 16:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050223; cv=none; b=UpHMTzEVXc37le7mu/4ICbi0FsG8W8cYFD4p1S9GptvHf1Vpm0XuKf2f4Y3Em/Mg4hIwoQtWEiNpfjLYEj0Mejm41u/HzMQ/PxNF9JAv+hU22B3DfJBzWJGyl66fuQcU5NH3iSxGQeALGsQWqs3Wv3bBjPkBcilMKp3cr1ROVeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050223; c=relaxed/simple;
	bh=8yrIXtZ0KwwL/QqfUsglgA4m+DCAbX/enWGlmGLhysY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EdB1kr6fhx3RJiGJF2fFPqqdkjSqcoKuQ+DEtJc9PH7RZYW5BHOr+fRQYqLGFtWK1m6Y6cse9EqGmMa7ejrotk2K5AOwdk+9oM1uhIiobFgsHC513kygi9CrDU02x4ntZ++mJkzvPP5p0cTIpoW4X79BD0C3Vo9jY/qiZ5697vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzhZxqQ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzhZxqQ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9EEC116C6;
	Mon,  2 Feb 2026 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770050223;
	bh=8yrIXtZ0KwwL/QqfUsglgA4m+DCAbX/enWGlmGLhysY=;
	h=Date:From:To:Cc:Subject:From;
	b=BzhZxqQ5JzAPL6jImaY5pSUCYhhNuPX9cqcC1Lwjcdol1SZ6gs3qQCLMbqemH7gf6
	 teoBfuBAUgzbYlyISa4H6VjaSFNEmHXFPA6yzhUZQfGFKecmEqTrtItND+p1jMWGuk
	 EcKJxJblDD2YZT7vXg6XM4lJ3GWIrFjJutpRy7zJydsEUwfNEm0lMjB/oeNfk4u3p2
	 H3SLvcUSwQpJp5PdVOJUcc7w6nX7q5jVIrVIUqUZhaYkpA8DVi35Da9lTVL2RdPLzR
	 /HVOhju1EP3wl2hqk8xfyO5ffC8dNQudxZByckIlo9lu71zO0GQxjv0vHEIGdhHNL0
	 dQRRCQ2UXXCqA==
Date: Mon, 2 Feb 2026 16:36:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at -rc8
Message-ID: <d4521b5f-39c4-486d-8dfd-84143c11f4af@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uZUIfiCornFIPQCl"
Content-Disposition: inline
X-Cookie: Bedfellows make strange politicians.


--uZUIfiCornFIPQCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Another week, another of these reports - hopefully they're useful.
Since last week I've added a KUnit build and run to the merge, this was
slightly delayed as I found an issue with what was already in -next
which needed fixing first so it's definitely catching issues.

We added a keys-next tree.

Trees being held at old versions:

apparmor	next-20260130 (New today)
btrfs-fixes	next-20260128 (No response)
leds-lj		next-20260108 (Lee aware but no update, submitter ignored)
random		next-20260122 (No maintainer response, no fix posted)
vfs-brauner	next-20260126 (No response)

There are signoff problems in these trees:

device-mapper
drivers-x86-fixes
risc-v

The drivers-x86-fixes and risc-v trees did fix their prior issues but
added new ones.

Thanks,
Mark

--uZUIfiCornFIPQCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmA0qoACgkQJNaLcl1U
h9Ak1gf8DMRK896A9F+95GGoEzu6fUeGdd6w+h92fFxswLDuPXiN/8rFNWr5oi1/
O2YOYu+i17Eq5l8PLycuXGUkwABW9PTLsBpUpiC9O3mhcDP9oKCQ2/6GkvPcEUvF
7YdoIs/BK6NVnhb1CxZnvmCRjdpG4A+lwYckYR6nKshJF6Ukjf3T0vrCuUrNg2Ge
75ezb2/1lpB96G45JsmPBOMXpDF8VXhuuFAIiH3+7rYwD73JpM0iUKfUEkncRbvK
E8DiUVsPo7W7l7fvUhdgZzcHHrBKZHD/+N+xKtfXD5urFd8XuHKpk+v5509sJP5L
5IE8/QhckqwFhhtPlN7oxvbvg8bVcg==
=wIar
-----END PGP SIGNATURE-----

--uZUIfiCornFIPQCl--
