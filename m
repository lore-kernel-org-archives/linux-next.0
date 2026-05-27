Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1724737DE83;
	Wed, 27 May 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897822; cv=none; b=nVrBZvokOPBA0v2D78g9cop/BxCVh2dEliC985hI+XZSxpz+/RajQ9GoI7k1lUXKIB0tJJPaVT84R3BsnNrezvfTPfjjQ4c75kzZ2tLNKdAmgHivNGokBwUZ+8h3HSOBWUZnr/UbiMFNAhVI1Sy5wBeDdDaIVuAMxdlzVlj7OGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897822; c=relaxed/simple;
	bh=dTv2W6LrCv7OVf2Lk2sbAfC5aD0JlxEdAMWxGL7R9XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwzKVYVM5i4lVFOH9NSUE6NlHD8npdj1g6MK69hVIL5IzbzZEPyfR31ZC2MCjMQAXahOwHKa5Du6VnwXVfIacZwPegjvuIksNCqLq9hVxLsEySPbed+6FTrVufxZjV+DoE+ubXqGApOAStRhDBgJ0rMx6tUwfBG/bLyuQujkL88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkCE+voP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkCE+voP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BA91F000E9;
	Wed, 27 May 2026 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779897820;
	bh=dTv2W6LrCv7OVf2Lk2sbAfC5aD0JlxEdAMWxGL7R9XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UkCE+voPGOOhWZZ8oiCkcuNOzDIctXQF+WntL+o/DWY7O/hKZCi89Aq7emWml789h
	 VGwdsvswkGFc0O4vTMpQ+EffArEUfBx+GSufcLcxINNgmqM/66Kj2AXDmi07li0Uio
	 TCuGrI0J3dvUhYuvUZS5C/kRhRqMTqfc42zHO1VCTWFiGMmeZI04PFdE1Vmt1Tvu59
	 G3es4Hoh8kLvpiC7evfHVQ7tjbC1fFilq7fXzlL0fMYLPMH61F6m1AW/SB04M++Ysc
	 kmACthb79vHBbP5hnT/LItus/7YM+PjhaeUDP69FBxFPUvSg70QE/BxOZnmT1YPPD/
	 oUrvdVvqmN79g==
Date: Wed, 27 May 2026 17:03:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for May 25
Message-ID: <f30c47a3-2a4d-4d9e-acec-3a6ef5f94a90@sirena.org.uk>
References: <ahSDZV9eR6zJ1pxG@sirena.org.uk>
 <ahVN8WXF5WRX-Y_1@monoceros>
 <ahcOr_dZGhWspNG6@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n65ZaLk0ftYj7Tbe"
Content-Disposition: inline
In-Reply-To: <ahcOr_dZGhWspNG6@google.com>
X-Cookie: You are fairminded, just and loving.


--n65ZaLk0ftYj7Tbe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2026 at 08:33:03AM -0700, Sean Christopherson wrote:

> Build bots reported this as well[*], but next-20260527 looks correct so I assume
> Mark already handled this?

Yes.

--n65ZaLk0ftYj7Tbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoXFdgACgkQJNaLcl1U
h9BkQQf9F68tFu+TfJTAd+gAJeXu8/T88qxNXZ4w510+14pv75b+N9wczrVnEN8q
dnPmd/HC3opNMq6KWroG9wgYchPPYj5SRcrACEmQhGMZg2pNIQlJ+ugK0ldkcq0w
4BzDKktJUDi0RqnZOC1pnN+pCHbj+sQfbBTdQUXFjvGoAsZ1uuduz2y/H9yCCHdc
ZAdHLLxVzBqaheNhU7Utb5+wnie5Ehjm5a6l/h4pw413nVbN0GOgLWlMld7BU4sr
JhH5A2nPMQ5YlQWTJQM9SHn6/UTpe5wQZnWdfc++pZwMjMUhbk2KvcSRGzNzqUor
juO0XaZFwSbTlNRXSnws1DDvWN38iA==
=5309
-----END PGP SIGNATURE-----

--n65ZaLk0ftYj7Tbe--
