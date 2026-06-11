Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E744921B1
	for <linux-next@vger.kernel.org>; Thu, 11 Jun 2026 18:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204305; cv=none; b=l2vY4VyXYbe2JNMifz9qBkZ2V569B26fwtEvlUwMDyT8hUDtr+Z7W5kjWLQx1K8pxQ3G2ATnURaHsr8zfiivpC9ShiX5UKn81KzmUtw9RypkiUNIs2JWJ1X9JMSpPY73C6ZFpkrcJTmfJSYYlSdc4jvWarrn/zx1zmUOf9CZpa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204305; c=relaxed/simple;
	bh=AbeDg5fkw0NK9xDqSfHURkXFb/3aAsFrhxDngrdvNiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go3n1WRdrQEhKLV2y+mNL4f2flYy1RnBwFv0qlu06ykIXTL4dH+Y04PzKH047fyx3C2qDe8K/MdurgNmpEV/SBT2pz7bx59seCVgTzsBHseJGf9lrFYYSbW5SWh+R40hc/V84nnLhNYxAgmwH3EQFk1UhpkwIutqgXcYYfL35t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1mQNe+q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1mQNe+q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59971F00A3A;
	Thu, 11 Jun 2026 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781204304;
	bh=yikRSLavvKVSQ+d5xDSak8Z6QcKthDmovp2A2ybuNZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e1mQNe+q2KcaqYpYenl2t2p3Ll1bZe6rdjXjBQewbtOJpbQu+8gjAU5aWq8YF+P4L
	 2oihEMKWFQh1VHoaazHiJz7SGQqUScODXsyxijZX+PGtgyN046tdxWetFPoZT+KBEF
	 QTVUxt4a2YxT57mN909t/DohIgAPRKVVQTyqWCTwYJbr3sH4QFZZePXM2f2SxnOKyw
	 PR4TUMayZFJe7PVNasYsJg6gschCU7AzVvBg86rhU4uHDk/pXRxC11HP1yYpQWiyg5
	 TLxHByVodbGgDIJ9eJf/i62ryTB6XJ4T+PBoT9pDQTuZPJoVvk4lMiStwgWdRdWQ7u
	 Efj2CLrLZk7yw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 39F4B1AC56C9; Thu, 11 Jun 2026 19:47:46 +0100 (BST)
Date: Thu, 11 Jun 2026 19:47:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	helpdesk@kernel.org
Subject: Re: linux-next: Tree for Jun 10
Message-ID: <aisC0nU0ZnN7wv6e@sirena.co.uk>
References: <aimIc7ciEUrhXV23@sirena.co.uk>
 <608ff135-c113-4bda-9812-26ee8f8cdf7f@infradead.org>
 <ac803cb5-37c8-4e41-af3b-1c15955cb219@infradead.org>
 <20260611-invincible-whale-of-progress-69ffd1@meerkat>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pyx9863uBv0Z5gQx"
Content-Disposition: inline
In-Reply-To: <20260611-invincible-whale-of-progress-69ffd1@meerkat>
X-Cookie: Leave no stone unturned.


--pyx9863uBv0Z5gQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 02:39:19PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Jun 11, 2026 at 11:24:50AM -0700, Randy Dunlap wrote:

> > linux-next-20260611 is also not present.

> Not anything on our end, afaict -- the latest upload I see is from 20260608:

I see kup running and didn't notice any errors, the output is lost to
scrollback now.  I'm on my laptop rather than my desktop, presumably
there's something different though not knowingly.  I'm not sure it
matters, I don't know that anyone but Randy even looks at the patch
files.

--pyx9863uBv0Z5gQx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmorAtEACgkQJNaLcl1U
h9Bzywf+PrhGkkxhZC5BWER0WuQa0Qxz+DDY+K2dtQydmBKAnxE9HXXaH7HVzfT0
ISoadOjQKjOEOE9y6eWFtgHJMSNYQTsUO3jelCKYZ9X0S4exfpQgjSo643pc4vKX
HIVInksmM7F6U703kKNxFm7N4KhwPkk11x92myxK2SvHjBRClAYnyx67cEjHjgX/
odkSZEVGZWEqi966lilprcQG/0s71q8Em/n6mu2+pjGgXIjTt12+a2cimonuKa5Y
c3kqu1n6ulk8ghMtGmNlRvJOz1z/VKxm76fQBCoKHYdmppQwEwQv5MSzRs7avyPn
GIIvcpwQjnWigEw7hHMWdOdlgd1xkQ==
=Fv3G
-----END PGP SIGNATURE-----

--pyx9863uBv0Z5gQx--
