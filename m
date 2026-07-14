Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40189364038;
	Tue, 14 Jul 2026 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024767; cv=none; b=AsbfkYZkbjHuBeNNhmWsUO8q9IC20Bm4pjVAqabsadIyw3lEddEaNMzzUCHPaBi+PbviqC4GT+/pR44v9telH+wVLkeIIrDT6J0iMUk2yGhhzfxDN0gqZleq7frp1x4cXq3cC+gbvnY8JGWbxqhUfv7wkX+tPfuYxTdqQ8MPHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024767; c=relaxed/simple;
	bh=N9BJ/SpEin3zgTFgiXqi8vMSdWseztXhITgzUWgznBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUs/RB9rZWzJmZKvvpQo9BvvjITHTYMuaV1KhHoBrL3T0Hq+aRo4ZcHGrqIDFh9VgVhQvgJOLREtdEYjHcOUqqJqBfvAaKFZnkX/C+qYC91o3NSJiQfaDxxU5Ab5xbIdIvlBLEf+NI+NuwC425Ou6eFa1mZWLtNne8Wnh86+f+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jW9SLDiE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jW9SLDiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2591F000E9;
	Tue, 14 Jul 2026 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784024765;
	bh=e+FybJ+/HEZSzEBl4ktyCbgizPo2EJKYFxjzOaqPNGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jW9SLDiEAtIwqPCt2XfY9RdVDkbaGCUA98vCNNb40LOySgWes0WoJZDxVsfPlaVpY
	 3Ni8dUMR89GRyCdJtkTdmgSWPnfeMHqp//nXgY9BEMdSZfemrp5pBirkSxlfKP7dAq
	 jiViCYGMbl2BTDYV4As2NoYUnMmoT4UtjAo2caweA1MY63hrIPXSkxYlpoHAoKrQlE
	 vHCAip78q/tj0FQYKETs25q0uiWg7+I8zE3xwNX4W6UyAtTKeJ0ht4tNzq9Td//i+A
	 125+SGlQAC5jtKkNBEm2492O5XHFWgEb083p0HTdXhPkc3Un6FULpvLXcdevvyQv06
	 NUIPKXKq6b+mQ==
Date: Tue, 14 Jul 2026 11:26:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <7fc86c5f-289c-4b77-b3f8-98dc30d89c28@sirena.org.uk>
References: <alT5UdRqcfFmadZT@sirena.org.uk>
 <12e1f767-d126-4f36-ab95-caf3252a5728@oss.qualcomm.com>
 <2026071417-fritter-mahogany-bb97@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aX4GliwucGt7nPuk"
Content-Disposition: inline
In-Reply-To: <2026071417-fritter-mahogany-bb97@gregkh>
X-Cookie: Neutrinos have bad breadth.


--aX4GliwucGt7nPuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2026 at 08:45:54AM +0200, Greg KH wrote:
> On Tue, Jul 14, 2026 at 11:36:44AM +0530, Praveen Talari wrote:

> > I don't see these errors in my local build. Is there any specific way to
> > build to see these errors?

> Nope, I can't duplicate this either on my side just by building this
> branch.  Is this coming from a change somewhere else that modifies
> PM_RUNTIME_ACQUIRE_IF_ENABLED()?

It's something clang reports.

--aX4GliwucGt7nPuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWDrkACgkQJNaLcl1U
h9CLLwf9H3naBq+ajgzZCiqsup82FXxRyWVGG5o/VjaRWy5ldpgYswQ1CGTAL8om
R3Y+UnuKR24MEQCzzAY6oB1i8jYl2zKxUrHydoy1F/pimjINaGdlWe71hpjD07U6
n5KSRK69qBPNzhqbV3E38jf7FSP/ys9GS6rQWRaPZRPRU0mt+edLx8sXDXMa67sH
0TpTrcu8QWdFeHO5gIU4coM9p0xc5RhSi3IcfrXs16PCTATO6xeBbTiNCl2FwKgm
picACdI8KqLpCC7ijG3lyH6KCVzuvlHZJq7rN/Pbk8uSiEl2Il3iPf+EtEMTePqL
3n3lLncHUec++uwjOuGpSlQrI9Zu3g==
=RyeS
-----END PGP SIGNATURE-----

--aX4GliwucGt7nPuk--
