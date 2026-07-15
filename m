Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A7B3B14D1;
	Wed, 15 Jul 2026 16:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784133834; cv=none; b=gJDnnj9UG5C/cpI9Q+80Z04+YyxWtoSqtYk/dSF45NaaQDKpAsRcmEc1PgX8rRsbzVrDPHhBYVtEDorBKQlYwvrdWuCGxlgop05g/EBxLphbtJe7QT0xb0ndh8hgMuOnr1mo7afl+RGoL2jy9QLZlVRLMd/OW3ri8Ojkpp3hxYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784133834; c=relaxed/simple;
	bh=jkCy5LkVsp5Lw21yI5Z3qsWQIH1dcOei8fNPZ6O5MYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLN8S4bcqoXHx+Bj8hvb2TFWH1lVxx3o4+v5ggUNEOcH6lzhPPTF6aHtsu5Uai9jJ5gTcYjLfk+strS/MgYQ9kb+nViC+rkmkbplVuwBMAinjOmUMXnVA6lQ2YJB/gwIfD2naRNeJNYuaWe9OuVMBOKJ9iosEP8NoAAdOoZyUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKqt5cYy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKqt5cYy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7CA1F000E9;
	Wed, 15 Jul 2026 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784133832;
	bh=dUedFmkLpcaJNO0CNCuZSrpmH4viLuYdZNcEqauDcW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKqt5cYya0aV9FX7oibJHHhzPKUcy9Dj255xxSa+X/GQxgFR80rMvzRcYVUoOuajM
	 lRpjYRj4gpzuQ/zl1LebV+AUutgan5hyxA4bVF0DhAsoOGuFPZ2n5cnFKdEdMsuvOD
	 sUZulAUPOVyvdP9XxJIWXiUL0Q/fF1fPwfbuMDH+++lMuJh4LCsz/IperJ1VZ7zFHH
	 H3QSvu5thDwsHxZI1fyoGt1m0L6av9AMit1abespOsB0LanFL5ZHDCQ3uYV0/eWNoY
	 uJeZ+DYG5HRDzWxQoPPTjZiST4EKC0wWVeNmugP+gRiGQpoYsN1d6sxGsi3KKKIgvm
	 LhpCkJRth7tfQ==
Date: Wed, 15 Jul 2026 17:43:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the
 mm-unstable tree
Message-ID: <bf85f35e-965a-4fb4-b7dc-19c2185e6b7c@sirena.org.uk>
References: <alep4zhJYFTXqBe9@sirena.org.uk>
 <20260715092029.18a9334f73e3b1517f3d47b3@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ttp+6BBU6k7k9I8Y"
Content-Disposition: inline
In-Reply-To: <20260715092029.18a9334f73e3b1517f3d47b3@linux-foundation.org>
X-Cookie: "Speed is subsittute fo accurancy."


--ttp+6BBU6k7k9I8Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2026 at 09:20:29AM -0700, Andrew Morton wrote:
> On Wed, 15 Jul 2026 16:40:19 +0100 Mark Brown <broonie@kernel.org> wrote:

> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.

> There was no "see below".

It was a noop resolution (just take your copy) so didn't generate a diff
and I forgot to do a diff -c instead, sorry.

--ttp+6BBU6k7k9I8Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXuMMACgkQJNaLcl1U
h9BYyggAhnguDBnUpPEjCZ5oHT5sz8leElmnoaSxBP+CfDtaPZVIPJywl+DHKetu
hy6qGSdBknjQLADnzz0G8FSheeQuN9Q+Q2rsSb5fik+dlFSjSJ/VsgPOXDvsYZLP
me7MUx2Um9mqbUUGJANU+wJVsDL1bCgEZWmnprmqHe3E49T0ZEh/0WP9JPuht4w4
IFP1UMsqYqQwYNVu/Q0hg/5rS3FvPWY4mJ1iPRCcgf6hdUN6I4B7ID2UWjEV+V2b
nymYz/eess0F/IUJK7cteoDZ9D7TAklsJuIMYRm3dsf8W9Zvi+YXm3UkRdeASogS
s+KasoB8Ix4oLm76QoEzwcvfYp8Erg==
=lZJh
-----END PGP SIGNATURE-----

--ttp+6BBU6k7k9I8Y--
