Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC742CAF0;
	Mon, 27 Jul 2026 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171720; cv=none; b=MGqs74N6mk/SVwLBJ5RfpLT8SGwslWpmTAKpFMkTHg+v/r52ZfcLWzriaGHQIOG6jrOaygxVZ8ZQr/OksUYS97kl9cPxYfQ69VToffV/HXKMpqElON7pPV/ELO6B52QW7YvsS7bIeA00t16L0QH59lPM/JrIo0iCvB8nZ4k1gPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171720; c=relaxed/simple;
	bh=MxEYfcXqJbmCymT0D7jErkjZ5hCaYyLTUlDTsdm6t1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/wp40WhK/TtuzAp+WvHDBV8/S/s7LBidjKW4cUlNjk0GcbpQWw2q3cKNmSZQ/n3YPX3EfNFZ+hwa9URpwtaCw1/ZAvP38CsnWmLQEFN3gnLNcT+qDlWuQNgyFKPTQ3sLcwVdHEVd0NxFxi8NkO4xhGAhmtodJnkYk7HvxJtFWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxC4j/Ko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxC4j/Ko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089C11F000E9;
	Mon, 27 Jul 2026 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785171716;
	bh=8v662VCiXm2ju4XM4T4oTLcZUesU+waSfpi8kiF84GY=;
	h=Date:From:To:Cc:Subject;
	b=kxC4j/KoYu7PMIhGPwUdClsz31yNlROgzQmxDA5oJYmyw8eJ2K1NETPh2tTLWwv6v
	 rlqPJbORT7/SHTS81tkp1FaQG6TFghBHufEk46CJhSyznDEzCzyPONncNqR3bskvjF
	 GOt0Jp4W/NrT9rnu/T68RD+R89xwCR49gzBc5urGApqBoJBnuksO9UzYSF9SRpW7sb
	 mDh8lazgzOZ8G6eoX2qvuwRBQTvK3zNlV0ZHbLSZWGGF2mySFgMM9XSJFWSwfJk9MH
	 VolQSYXcsQKKPvfO8YmWiL3cROcbA0SlsUuuS86CKgPYDZRds7MIVLE92HxVFuTXTp
	 fFxPvMGHnSdeg==
Date: Mon, 27 Jul 2026 18:01:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.2-rc5
Message-ID: <6a779c9a-a5bc-42d4-a359-707786cdb33f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbUTntZ1GQFmDflI"
Content-Disposition: inline
X-Cookie: Did I do an INCORRECT THING??


--tbUTntZ1GQFmDflI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Everything is fairly standard at the minute, still seeing a lot of
collisions due to the point in the cycle we're at.  The number of build
breaks is a little high but not really enough to write home about.

Trees being held at old versions:

  fastrpc        	next-20260723
  thunderbolt    	next-20260726
  vfs-brauner    	next-20260723

Trees with signoff problems:

  arm-soc	(missing author)	(A merge got turned into a
					 patch somehow, fun.)
  arm-soc	(missing committer)
  driver-core	(missing committer)

Non-merge commits relative to Linus' tree: 8523
 7932 files changed, 390407 insertions(+), 122539 deletions(-)

Top trees adding commits to -next:

  1353	drm
  587	mm-unstable
  340	qcom
  301	net-next
  279	sound-asoc
  262	tip
  173	iio
  172	v4l-dvb
  156	vfs-brauner
  154	bpf-next

Thanks,
Mark

--tbUTntZ1GQFmDflI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnjwAACgkQJNaLcl1U
h9Aodwf+OppD0867kT1Pp0z9Th12rdQTjSeJpC7pBd0UuirctSt4mNvGEbPDx4Ng
pY2NY35PJznqJo59sGtcVuzuQP/tywKaFYEriKfzlG6CL3KkRnjkDmJAPA9bPgcI
o4pwU/AVhIb+z9B/hgiOJ9GJ79LcIX7qM1f23urzb72jSxmWrEWlRqewmOtqG4yJ
pJWl9uEwUykPqlfbjZxnXGMVC0IfuT15/KO7C0GX7/NOLXNfCFvXOb4frxjvQZ54
PSn7hd3XBLLrFXFew8VgNnfbpMNDwtEFjEJ2l/k/s3pq3l0Pz24iLCKUkYXnQnoH
wgCYKckvWEvUkA9rC0bANI2t0HWoqg==
=DR5y
-----END PGP SIGNATURE-----

--tbUTntZ1GQFmDflI--
