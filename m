Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B4330D3F6;
	Tue, 23 Jun 2026 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782218629; cv=none; b=MX8CpC8wf3LI6PD7ijXvTnQ4XawN+O2WBaC3CWzHtnsA7I10wi1opP0xnPMxWlnuFD0om/U8SBzXUdQN7FTCdLNzr9U0pZSYwMo4GQU2w28h9Icz380HqZmnDDoS2c5sW+x380exki3SD+FU+0p6BpgvtrxiJ1pEnwXitle9sIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782218629; c=relaxed/simple;
	bh=JK3JkpaIothCMnN4/IG3WU31fmDKjM0nW+irBS5aU24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RATTLb1qvds8wD2rHKJfn7jzqLTh3rEIyiPt4MrftkBTrMMgj4noAWNR7+mlBR3jYi31ZyYca9+wQQPHMDdphWYI5F+unMhvQ3l5bSg4kpmSIjQWTdt+rfqZMdipHKGYdrCJR2LhQzoa8OIRvZTgaKvKk0RLuxyG9EZl43UlvA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C84y9Xht; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C84y9Xht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCB41F000E9;
	Tue, 23 Jun 2026 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782218628;
	bh=o433k64pGYL9vDyWqmTApHJ1LOe58S1jsNiBAIa5nBk=;
	h=Date:From:To:Cc:Subject;
	b=C84y9XhtSSoGltocAz52qyeFtqI+Yxit8TRV2P1/LA0jnajqpIlZ6UMEwrprDYqEO
	 XLoE/VFp4vzjhURejq8LQAttvxFqOy1jUnBX7BK+h1NkDXkLDF4LnXlovV051UYvqv
	 OIq/6X61FY6t8ogHpkdBNzcRWuKXn+3+NxQBJggOJPxP2H6KY4Aqaz0gSz+V+FbsZ6
	 LMXgDXzIkldbwgngalKz71RkQk+XxCUF/bv1N17TooaSWysIjMym+s2u9+AmCZa5/z
	 VelR0xyhsVrRyPHhL59BSJ0fW0VDZHWtlvO6/bVES20kMQ8/HBgFG++yx1Dvys8D1M
	 TSif0NW4YaJMQ==
Date: Tue, 23 Jun 2026 13:43:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the block tree
Message-ID: <ajp_gRnpBLQpnyGc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZGjYhm2GiaE1OHWr"
Content-Disposition: inline


--ZGjYhm2GiaE1OHWr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  0ab5ee5a1badb ("blk-cgroup: fix UAF in __blkcg_rstat_flush()")

is missing a Signed-off-by from its author

--ZGjYhm2GiaE1OHWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo6f4AACgkQJNaLcl1U
h9B8Sgf/ftU3vEQgwJa9XuDCCVFBvEGkRGLo3Klig3lXdOsXOcVevqjOkc2qP5FT
0sZ0a5QqOxzT5AG0DEM+n37y30k84inJYX00R8TykdtWhMGnDliS83gFfmYSAM7a
JAg42EOxEpokG1fv9XQVpDRp0XT1TZOMWpdqr4J6z1cvmAvu5zcYy3edVrYED/0x
7Xkp8sKHAAGlQWvBTF4fr1A7dGtgbZ6N0ufU5fskRgT5N6k/B7H94XvL6MKMFmWs
MaQVcoPSeqsOPJEVm4+0UaLI28DyEa72jLNz5fWmYeBk11i6vO4Z6u4pZ9pN1fDi
XoB13Q6Hiy5U88q7UfwTRVuXx453MA==
=kMe0
-----END PGP SIGNATURE-----

--ZGjYhm2GiaE1OHWr--
