Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7602D432E62;
	Wed, 15 Jul 2026 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113720; cv=none; b=FC6SZEeptlT1NtTJ3XBeE5VFYnzo8ECXYnibk5DW254Jufkp1/aQlv64zqMfoOV9Sm6CBbwgdD3XeZCpQFORjN/GLNO8Dyj5RC6Hdb71IP9DA9cx/VkoutdJOzY4rw0Xom+z0Zs2kK20kCBbQyyIH26LCfggZW+llK4m8xKEEkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113720; c=relaxed/simple;
	bh=cXPb4P9QXuNUEKaaFLQvqgICITwHzEKb5GT4zzsgVDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocrRYz+8Irek99Lkd3ZZDdD37wWt1ZiWgfC6ODz/UA/7rgCTxya1B9R/dnVWKMKdU94azQyaqvYjDGDkgInVswUuqN8YnSCVxA9J20pzynLT0KF/byGLyR/iG+45x9MP3OYiQeqUvZkus/J8+4Vmr4K53pgDqUYRQX1HukfUYlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIUCISYX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIUCISYX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4749B1F000E9;
	Wed, 15 Jul 2026 11:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784113719;
	bh=Ptgrn/evLAEwSfzX9qDjHyGQiRkJcXJqaq6HAAvfEGA=;
	h=Date:From:To:Cc:Subject;
	b=UIUCISYXXQx0C4xXq2CYcwmTJm8x9vsEl667KT5Kif9ShoVy6jvTyYNnSGsnfT+1E
	 90vkdrzZ2+W+CVUE4V95Rxg3iFDFOhdrWHULM4ilwudT/rQexS3SA/y4zCKWkBSkTJ
	 ZutvgEwqe5SFCK3xrVugKrW9m0rvzR7vZ8o4m+Qu+OkI/Psp7OFeiGHa2+HwmUwMwQ
	 r6EhSVzgtevcwe7mqrGrDk9Rk214qPaXqRblFuXWtoMOFqxMW74LVV0rJWBBmybZGa
	 ydanzfsTpBogS1B9Jz24LC2mFl2dAKMr55NyXcMemTJFx96GcsLHEO0cCf6HV/dhh6
	 BjDEdqlzPFf6A==
Date: Wed, 15 Jul 2026 12:08:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the powerpc-fixes tree
Message-ID: <aldqM4Rr9xc8-j8O@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vUCnrw+KxzcmmPWH"
Content-Disposition: inline


--vUCnrw+KxzcmmPWH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  c1c1ffa490fc3 ("powerpc/vtime: Initialize starttime at boot for native accounting")

Fixes tag

  Fixes: cf9efce0ce31 ("powerpc: Account time using timebase rather  than PURR")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--vUCnrw+KxzcmmPWH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXajMACgkQJNaLcl1U
h9DU8Af+LBUvqYZNKl7SFHCXU1Mv2wHQTtzfGyeDG1yyNR3o/0PEb/1pVWLXSmQI
zdWXHnRjynv4j442EA1YsxUwKbo9ajcEIWcC/Y/78/dNRJALCleVDUK7iey8mGVo
/P9fn6qpzmKZdjM022ta3iVnaQNq+RsmQx6AlMRE4Ch1D+ZunjIaKwbS3yamiDEy
TVsz1Mi5aWljQXTro2EV9dw+o3YW/qCAGDOixgASuZjAyZhKonYeTXHXATJeIp5I
6fJSsz4r4ZaicOdEw+IP2P7s2wKtk7ylfks13XCfF+o6UogghyrmfPPY8HFkkX7U
/5Y5l6sypSTHuANWWlibsj+lhodxBg==
=tuUf
-----END PGP SIGNATURE-----

--vUCnrw+KxzcmmPWH--
