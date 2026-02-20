Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E973242AB;
	Fri, 20 Feb 2026 15:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601905; cv=none; b=fQ6Gnze++XCPNkK0mi4chaIkRhp4rvihoBOVijlyrMc1vyz0azIhO+wUTLiHJ6JVGrOBypj/5JSPuJTq65bc2/ZFQ0q5srTW6WcLacneislcWS+RpHbEWF37lcYUbaIPiKqVMdVlliO+InCJKBzPd7FRn6Lj9fK++ihitnniELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601905; c=relaxed/simple;
	bh=b5du+TDmEKM8mDVtcmqdWr5EQnp9N5TcUk96xJuX91M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9dlVBxUNgIrnOZGDyGiRSxfr075h411zbBQpdu3hXUIij/E5UExYifs89Lc9HyLXVWGuwHk3GJ63uUpv2VOafFkzsohb85J587niIzgZ4DSkEJuQGM4qaPE4A5r4KpviDrQrelUvO4FFT7FSuAK00ebUsdug1quRIPRzQhNNF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3AQAo4/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3AQAo4/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61FCC116C6;
	Fri, 20 Feb 2026 15:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771601904;
	bh=b5du+TDmEKM8mDVtcmqdWr5EQnp9N5TcUk96xJuX91M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3AQAo4/zhqmdRYMlII3NuLZiNwo7RRonqzQwB1BxJ0H3FKQ4mfGKAS658Wf6IDU3
	 A1mEJXLWgd+4nvaHvpmP6824HlFKU1q/OYWbsy7KGhMhH3Zn/d4TSw98/s3N3HWu+C
	 kTXZP9qMpETBHgBVY0ZMIf83VQCwLNSwijTTtuSvEMXovHJunK1vyJ/gABa3+Z7bgd
	 az9Yi3qFbEj7w370RuGK3CTx70RxCMmsK/9vc/kzy/NH/CDED2GhUROCJMvSMAFnNh
	 7Q6fuUbOAZUWyEFWwU23R1rMhmTgJDuMXDZmNUFKNpLALQu4uvSQGOSUCY2ztENegD
	 H4IvS7HG5XZiw==
Date: Fri, 20 Feb 2026 15:38:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the mm-nonmm-unstable tree
Message-ID: <f8f75f80-eb83-4a63-97c9-b4016edde49d@sirena.org.uk>
References: <aZhmDGF4Z75dPduE@sirena.org.uk>
 <20260220073517.2bf4d8cc090f01cf9962bec5@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dIz8BWP09erIxsp4"
Content-Disposition: inline
In-Reply-To: <20260220073517.2bf4d8cc090f01cf9962bec5@linux-foundation.org>
X-Cookie: Booths for two or more.


--dIz8BWP09erIxsp4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 20, 2026 at 07:35:17AM -0800, Andrew Morton wrote:
> On Fri, 20 Feb 2026 13:47:56 +0000 Mark Brown <broonie@kernel.org> wrote:

> > Fixes tag

> >   Fixes: 61a28784028e6 ("proc: Remove the hard coded inode numbers")

> > has these problem(s):

> >   - Subject does not match target commit subject
> >     Just use
> > 	git log -1 --format='Fixes: %h ("%s")'

> Looks OK to me.  Is it possible that the script got upset at
> "61a28784028e6" having 13 digits instead of 12?

I think it's saying that the commit in -next is:

61a28784028e6d55755e4d0f39bee8d9bf2ee8d9 [PATCH] proc: Remove the hard coded inode numbers

with the [PATCH] not having been removed when applying.

--dIz8BWP09erIxsp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmYf+wACgkQJNaLcl1U
h9AGPwf9EDCxeJxN9BVZSbvL9C1Jqb9PSz5RyhAiMQx9mXQcJET5sH+okHJ+XUFr
VEFRNbKuNGju2txNlNg5QxulLTYGP07sZijuaweNINkOIRI63iwPPDvj8AWF+xO2
PKaGkCYUzs9zoyAHksYdkYq6b3px8+X3uYRzJTCuwrR/Qjq/tUv+MfHEp0PqVjVi
SiEL0FUGfd8sn6HcaC0CtB4o49eRmOnQEagR92F53vYRLlrGqoP2/wd9RfgQ5Ewm
GJUJqLAMQstNa9qPnJIO4kwBOT/BBXt8Z2VdTZz9kC+gXg9NyIvL54yR4xmxQO12
xV5SeuS8kxAl2MckrFndjw0132melA==
=sqFi
-----END PGP SIGNATURE-----

--dIz8BWP09erIxsp4--
