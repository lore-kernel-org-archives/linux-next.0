Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596C92BEFF8;
	Mon, 26 Jan 2026 23:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769471709; cv=none; b=MxKLDRBACUkn15CIysR4r3GRGOB605gd8O6VXGcbB9LLq3JDPUzQ5ODf8gs4HBP9cFg3ca+wMQsWTrQejBBo40XZpZa+pZFC7GFn6QEK7IMUej0Sb3T6y5LCzEGgH3ua2d/0YvjQJ0ARKMVm+dIFXlJZazejRTsphgfg1bOC8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769471709; c=relaxed/simple;
	bh=kKXWsAuKt1WfQKrEoc3hvWli83jsBg8wNk15osjj/Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tIGLgUsC9Ne3Dp4LoAZH1Zhw3ZvZY0SS/DaekU7eZf+ibc0nlGfOLgSnj28s9aOWvR0uFtOa4Tq/BDYGCNVZGFlvExgX1ntHNgbRMT9tX0NdwDXpY6OxTmhCxzkJgyEKwRyhnGJIb2EpPXbAp4Mjj84+NMH72m/fEMcAY0oIj7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2GqaFYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2GqaFYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3871EC116C6;
	Mon, 26 Jan 2026 23:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769471709;
	bh=kKXWsAuKt1WfQKrEoc3hvWli83jsBg8wNk15osjj/Bc=;
	h=Date:From:To:Cc:Subject:From;
	b=Y2GqaFYB9jrFw4fGTeaQ7Dqj0GTceQk3pAvisZywSGSY++5rSBc0PkvV+xWvbqi21
	 /PgFJm9EtAr62+AwJEneqs6NoUJ2qLR7F+RhE78/4cb3W0f15GXHZy0xxZxIaMf5tW
	 +ISLR1gVKlCL3bBdJOuN517rkV3ja2m8BPxJsjmwbaF/hPzJpdEgcMjpyFvZSDgS48
	 SKGeUUSF58hvXMnqBIYE2GZy+xjsSslPKERt12rS5QxKvDzb3+g416Vzj2fHAeM/yU
	 eH/AdKtwWkPBn4SbOnuK5coj1hgIDZVLjFHCLw3pMScDTOHKSLGoUUI0QARl7bGvk0
	 U9QpjLxjAAF3w==
Date: Mon, 26 Jan 2026 23:55:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: -next status as at v6.19-rc7
Message-ID: <342056c6-9535-46e1-a643-00b4c97b6fcc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3cJf2ln5a2/uo71"
Content-Disposition: inline
X-Cookie: Haste makes waste.


--o3cJf2ln5a2/uo71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Another summary of -next as of -rc7, just the same information as last
time with a little more commentary:

Trees currently held at old versions due to build breaks:

ipsec-next	next-20260123 (fix applied, should be sorted tomorrow)
leds-lj		next-20260108 (submitter has been ignoring prompts for a
			       fix from Lee who was getting fed up)
net-next	next-20260123 (same issue as ipsec)
perf		next-20260116 (some discussion of a fix on the list)
random		next-20260122 (extensive issues due to removal of an
			       unneeded include, submitter aware and
			       investigating)

The Tyr driver now builds cleanly so is no longer disabled.

There are currently signoff problems in these trees:

risc-v

Thanks,
Mark

--o3cJf2ln5a2/uo71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3/tgACgkQJNaLcl1U
h9BJxgf9FS1A2YRY3xX7ZqRmopArNl51onEty+bwKrVW4SN02HYvIDL1BUPPDD/v
gBqPG71Ta0XCIqhl9rYGhwuLeTqraN8H8m9yosQj4m8psr7du2gjma939wTqNlMU
FuGCVsJCFKrGx0Q5spsPiBkkwtIpF8pbAeByjHhxfIRGuEW0gotW6I0GppI+gEZj
4KSkLOezC0sCDnXtLUeI3Ua/Lg06cjyKP+6IjIaJc+Z0spNZ7nMOFey+DH8zk6tS
eBJ9vWmQ9X7xrNa+zauV1sCFfx2c6vmxWxTycrPoYyyPMzGlkvDp2//q00rcw/c4
0qkXP3k7GlUDaBDFhOrD4EG3FzqUbQ==
=bO91
-----END PGP SIGNATURE-----

--o3cJf2ln5a2/uo71--
