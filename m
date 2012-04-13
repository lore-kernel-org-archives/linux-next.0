From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: "amba: Remove AMBA level regulator support" commit.
Date: Fri, 13 Apr 2012 11:44:52 +0100
Message-ID: <20120413104452.GR3168@opensource.wolfsonmicro.com>
References: <20120413012230.GA30438@windriver.com>
 <CAAQ0ZWReL=+bm9UOnt2=Dfy0zeWbJe3=y3pPzUKRzm2y277kFQ@mail.gmail.com>
 <20120413103207.GL24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eyYj78xbwv+yMvU1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:49446 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754933Ab2DMKo4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Apr 2012 06:44:56 -0400
Content-Disposition: inline
In-Reply-To: <20120413103207.GL24211@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Shawn Guo <shawn.guo@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linus.walleij@linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--eyYj78xbwv+yMvU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 13, 2012 at 11:32:07AM +0100, Russell King - ARM Linux wrote:
> On Fri, Apr 13, 2012 at 10:01:52AM +0800, Shawn Guo wrote:

> > That's because Mark's patch removes "#include
> > <linux/regulator/consumer.h>" included indirectly by
> > drivers/dma/ste_dma40.c from linux/amba/bus.h.  The ste_dma40.c should
> > really directly includes consumer.h.

> Okay, I'll drop this patch because it's causing regressions, so it can't
> be pushed as a 'fix' during -rc.

I did say we should've been pushing Shawn's patch in as a minimal fix
for 3.4...  Alternatively if you're happy with the code just keeping the
header in place should avoid any issues, the one regression was just an
implicit header dependency.

Regardless of what happens for 3.4 we should keep the removal for -next,
it's clear that we don't want the bus doing this and it's causing
breakage for the non-ST platforms.  Do I need to resend the patch to the
patch system or will the existing copy be OK?

--eyYj78xbwv+yMvU1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPiAObAAoJEBus8iNuMP3dLo8P/Rw9M7V9DrfMeNuLsLfBGqJW
9X/z5OZvoog6HlRbQulAc0eFZlA73vU4OtPea1ddf4U9DzCWW6zYPGvbmAivIBt7
IyRpSaxt40yaOW55Qwe/gLlZf+1DCon488KBR9w5456HJ1e0LdOu7iBpqzyfYQPj
Hs0jajJU7b6D8X3aB6oA2G746YAUz3K/TBRqXQdmfJY1eFGmSvDe24cMKiovc54L
61sLUkC46rtEcDTTDpqE1/ixeRFsB5GuBeY+/NaLEvVDXbUIz8XutMAgTttirQbS
VlLq1C0MauNtRmDZUIwE1yIpOCx0Bxs/X6mAdeMfSGq6GYGHXvzP1CGKFshcmJYe
OURHiaDLmQz6Ge8Fe0IB1T01U2oDI1b52CzA0oavcZ1r7cA4ZN2mfqszk0XXmIJZ
zm//Fp9yLUNppgkuZQ/mANO0dCYazMADRhoAEZs/Pg+cWC6udfuV8ndN0QEZMq+G
HK/13LUv9lPf5RsmZbH1YizUm17gYuTUCqYpBv8KjTkEMFAHSvo/3sfARcqeGyzQ
v7U16AJqWaaCH9QNe2+KHoktA+/hdWyU1DKdOUhEyXh9Wtj6QvnYqEbsHBKBKl/j
5X2B+VmvYQmwLD+DGi1CJlXqmI0tJux14cdlEkn6agRJ5g2EI4hfrjxKFwjlv9xL
XRe9gBh0k4NgO7Op/pVf
=9nQm
-----END PGP SIGNATURE-----

--eyYj78xbwv+yMvU1--
