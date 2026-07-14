Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148EE38C43A;
	Tue, 14 Jul 2026 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029625; cv=none; b=XptmY6CNgjIl5Bq3e4oAVHGeLSpK7BtbSTbrbA31FYHbKfaq1DP9+oeWp1iv9WPFjRvJQpFNUSsCe/VZKVp5BQeyYfGMmV/8AE9MCBI3YCMyHyWZU86iFE3aQFSgR8Le8NL2xwie19Ckn1tx0wwSNmdeMsOjKyqtPuHgiZgiCrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029625; c=relaxed/simple;
	bh=D9uEF9oubVuW4g8SpoJmMl9sEXKldnKc/L4T7LK1lmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dk/0/mBWI3ie4BY0dtgWHfLVgYEdC/bUquci5TB7c5I9hSALcBiF4VHfRa2DWgwlfa1ig+AN8ALNd/n1ns4ghVgFi4TKwxAtfO3ykG4M8Sz/2HJBpHJcQ1tCwh58bJzOdvGKD01j1ECO5qQFsM+/QodBm/HwL2D47lewiG6g9mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHwyXQWm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHwyXQWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BEC1F000E9;
	Tue, 14 Jul 2026 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784029623;
	bh=ln5WPGLe19x+VbgszBcOfv2DZljhtOY4/AgqGzCy/ug=;
	h=Date:From:To:Cc:Subject;
	b=aHwyXQWmLc0hD7H5DumvbW5KHtZUBYzhXhsf2A1fzbKkrVEUj/f5tUExJ4QKCobmS
	 BhuM4uT4rFNkKY3JDWKp0rvpqSB0Iz5b63n4vD5LjwcX70bH6N2WhaNlIP2Ttnix/Z
	 uftaYvG9YdRIiXHkrukBPOosV3F8zTJzRKYsTpU5z83DeNBihEJxi4ntjHGcCJTEMk
	 uhhHnrLlVq054f4qGbhOrOZJBgT6AmvY+MqpouHCa6f9Imfv4f58RV9zwYLsFXWyGx
	 CKT6C6Wr0ORWiK0aiYTfHLF7SRfeeU4XJ8jLJCX5Es9nAnXF5QE6MEAuuRxO8RRtLH
	 KMk6Bx93ox1nQ==
Date: Tue, 14 Jul 2026 12:46:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the powerpc-fixes tree
Message-ID: <alYhs4-Le_VfbGcj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v+x80NNBOQoEIGSN"
Content-Disposition: inline


--v+x80NNBOQoEIGSN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  19dbc55d400b8 ("powerpc/vtime: Initialize starttime at boot for native accounting")

Fixes tag

  Fixes: cf9efce0ce31 ("powerpc: Account time using timebase rather  than PURR")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--v+x80NNBOQoEIGSN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWIbMACgkQJNaLcl1U
h9CnIQf/WWOUcGUdGt+9biaLiSDpgrYpE06a2eRIbddH85VhG60XHUUD2PUMJawI
7balj/6wkowUUTuqyCSzN920l1FVyGp1dXiFiQGau54VodsJGEvyd1Q+BBpGZbwM
map2b9LmsSYIR5zvKb4XGaNXAgBoDIPXh/hCgVzzWN1u1Ht5TQsnlVt6F7ou7gC+
nojkaJ36pTjxqJSYUMlBiEKvL3so4Y1k6iIRcx11Ur3XrIauwRiDjhJrNk3Tme7B
wJesfUNPWRC/dFtrf8BCyLmpRM2ki6c8p6Opt9sFLBS184DCDESfPp4XQvfkCzQR
pNvwsOHTzl/JU3P4JFz/j5EDKm8nlw==
=G4nd
-----END PGP SIGNATURE-----

--v+x80NNBOQoEIGSN--
