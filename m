Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005742D780E;
	Thu,  4 Jun 2026 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584631; cv=none; b=T3Ww1V8/TeFDaySwqsAenXFj240PNesBTLubMdtXRo9Apdxj21QpEnlhqHiSuOlcOGZ3RkcdY1NqYDamsJrhlzDcNSTea2qOpKmo1KeZS4GrzqeH42RBFtujwoXPA73aJTdF1uHjNRyTsXxku5veixF3/HEjtLAAByUR8ZuWu9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584631; c=relaxed/simple;
	bh=/SfqTKiWGbGa7gYoSN32EBZEFUwjF0Ji+fLvu3grvkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gp/r00KldQdFuXenoHt40Fr4khgyf2gyk0a7lrP3Maoj1Cu1ufNItGSKK7hRms/uBUXrsE5L5kWw+bhPfGBn/Wl9BUqiSvcSM9s6VIyc8vavR1q6Djex8WLMzqr1EYnkd17WHhm5kAkIl2DkVOL6B/S74wclpcvg+m4B88AbLa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikUHqzvM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikUHqzvM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F3E1F00893;
	Thu,  4 Jun 2026 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780584630;
	bh=1td/sgaYlpj7VVpnPq0zz027w0HQznec8R0iN182gLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ikUHqzvMuAC5yvxsJyOPds7SqVA9zZxcf8/0q5FKcUZ6pXbxIcNwPUxM1N5a2qiYz
	 t6+y8+kmymMYO4IbI6g+Nvvfr8gU3j5b76cobwPOWcS5ybbLNQBT7z3I8hXfQ0S12B
	 mHlpzNsXflzJVEfxWlm7t68XZcjUI8l5jw6DVpeSnKh2TLH95NPAnjAIk2+qEP83Le
	 0rwSqZL+x7l4ylAEX7j/mH57VeT1WnG8NwpvVvgek8X/MmJFDQqrwjRPVaIeWfhoxz
	 yHT2NCfYcKQ23emRpzYMdP7qKxdn114MzzeCMbW1qtUIBFqok5Ts/eyjCc4cgf07RN
	 Y+0TUmaD30TsQ==
Date: Thu, 4 Jun 2026 15:50:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>,
	Gustavo Sousa <gustavo.sousa@intel.com>,
	Violet Monti <violet.monti@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <551d384f-d151-4d1e-bcb8-a1cde0860a30@sirena.org.uk>
References: <aiAz4DmtngY0r6Cx@sirena.org.uk>
 <bfb0dee8-b243-47ba-a89d-71472b0d51c5@sirena.org.uk>
 <f9094757b2aab617feb8fc3f8a66f46595e0ae27.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6MiZsoqq4HKfrECh"
Content-Disposition: inline
In-Reply-To: <f9094757b2aab617feb8fc3f8a66f46595e0ae27.camel@linux.intel.com>
X-Cookie: Q:	Are we not men?


--6MiZsoqq4HKfrECh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 04:43:17PM +0200, Thomas Hellstr=F6m wrote:
> On Thu, 2026-06-04 at 15:35 +0100, Mark Brown wrote:

> > /tmp/next/build/include/linux/compiler.h:200:84: note: expanded from
> > macro '__BUILD_BUG_ON_ZERO_MSG'
> > =A0 200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...)
> > ((int)sizeof(struct {_Static_assert(!(e), msg);}))

> Funny, I see no build errors with drm-xe-next allmodconfig. What
> compiler is being used? Any sha1 of the drm-xe-next top commit you're
> testing?

This is after merging the tree into -next, that'd be on top of
09b893db4d9e68c2679e76624d420f438f8d3e98 for today (not published yet).
It's possible it's some interaction with other trees (like the main drm
tree) and works as a standalone thing, it wasn't obviously that from a
quick investigation.  The toolchain is gcc from Debian stable.

--6MiZsoqq4HKfrECh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohkLAACgkQJNaLcl1U
h9CQiAf6A5ddfaJ9zDsPntLJpT3kooA5vvLtLjTnRrqBGtzmMDxVIQQoVEtWnpUv
19zvl3tezsj4yJ0Cnmxd/RLxYCvpS/57KHdw0RW/b5C6MkgFHiSAxUsHzuy6xRTe
wkxglTifLMFTVT3HDW8EOh3S1yoKAIBLc7j0wnW8r5n1LbpfFMXiYLsn4BMDrf8b
I8ippFu9MggVdygFvzhdA32lTiDnlMs1xGG9co1iLK8bcyNwwjLq4xPveIUkMhXG
BDX41cNDPjsNejVLPv3FYBeOECglaM4HyiepHSuZmYr9/aIo2GGNy9FwzyKpgZAm
O5dWdMyaikt1BLzatWTnMCn9QtYlvw==
=VG1p
-----END PGP SIGNATURE-----

--6MiZsoqq4HKfrECh--
