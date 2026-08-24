Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BD3B05A7
	for <linux-next@vger.kernel.org>; Mon, 24 Aug 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576732; cv=none; b=uGkF+cirMQZGcwjbCCK5DDW4FU4gf/wSxSt/e564hx8fDqu/YLB9fsKlF7EAaACdmVGc3nU7QoXEswTBIRhG73hy22kNA3Uq97YJyYeRwPCE+AeV0e4HCtvP1xyrbM0dxfMoYrX+ZfyuUF9fOBuWow2gjh240+ghYrnRGdB5FYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576732; c=relaxed/simple;
	bh=Pk3UKM0zxeIXt3aCCUuntOZnxIcOr6G6LDqrBOHT4kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrOod9l/Z7uON6txNLGYwRYQoszNf/4YkZNob+E+ANj+ycLsgxRWVihSxFKCfsLbKYF+0pwdO6kJaZKF26a6XEFUGGoEI5TuSji1a1bhGzbd/UOJ3BDshYFi+mti2/9m6tVFEWpbhrEtQpfZ3MBPySrAYFncWkAmyYMWK9W7bWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlI1O2iK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlI1O2iK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38771F000E9;
	Mon, 24 Aug 2026 13:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787576730;
	bh=gpfbRocnVsU4wDVdpDsr38vI2XJvoG6ToWHLl1zL6Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JlI1O2iKY8V8jEOvo/LZbSJvWiveqEjLUdz60+DUgUs427JcA/mttFJQ0h6QlckVF
	 8YNl08qR/2P6E9NgYf2Pm5BuIvkMkH29JVpbwW3uGJnXNL0lQ7wsZOTU0fkOkb3rvs
	 4g2HsyPHJId3uGnK0Z7IWhu2oRoMov+TNV7EoPFXQMqZYC0B3Jfy90HBr9s9j8QO5w
	 ZaCb9aKWAkRugdWp6+l62BjtLIJOcaTGluVP80Wqqn/E0QBIwNAJnGTDWWzGr1QWaY
	 AdweE6Qk5AwXGEVhRSEUd9z7noxizvWJ23bL2RQr0PSBqVXKSZTra4EYVEtiS5RFm8
	 tJ909nGprpTgw==
Date: Mon, 24 Aug 2026 14:05:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Paulo Alcantara <pc@manguebit.org>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: -next for CIFS
Message-ID: <e2f818f5-c2cd-4975-9be8-f73101a36081@sirena.org.uk>
References: <d6f9af6b5fb15945b594c5fec0ad9d7e@manguebit.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2DM1neKhoqZxVy3O"
Content-Disposition: inline
In-Reply-To: <d6f9af6b5fb15945b594c5fec0ad9d7e@manguebit.org>
X-Cookie: Accuracy, n.:


--2DM1neKhoqZxVy3O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2026 at 09:42:20AM -0300, Paulo Alcantara wrote:

> The new -next for CIFS patches are in

>         https://git.manguebit.org/linux.git cifs-next

Thanks, I've updated and will use this tree from tomorrow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--2DM1neKhoqZxVy3O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMQZYACgkQJNaLcl1U
h9Cmiwf+J56XHxJnvyw+5flhXiTFDkVFGtTZrtdXDy1CijU2CChEmg6Pydiqe8z2
60jQ1BmLsMBJ30IEM/uHnnVStyYoUOoEtfbK94e8nyOmt2RT3IP8i1F4UWZ0VZwF
PRFjHDEANxcjcwW65bXOcSGPbOHmDGmu5cpolPjAecTK88lLjdqMKOS2nVletlMx
46XALjZgIRXRzzH8J5Ek4Rbu9uDgIag9My5enBJTVkaEVrj4DJl+X1j35qkHRioE
xy3/DIQKE1KzlP2w/yHNHo/7ffpVq/ieHCHkUIHljEOYRuYfES1et733zvhAQocR
PCaVSF9R24U4apHujFepnq2bE39TXQ==
=H2Yn
-----END PGP SIGNATURE-----

--2DM1neKhoqZxVy3O--
