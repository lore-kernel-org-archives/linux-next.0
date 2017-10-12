From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the FIXME tree
Date: Thu, 12 Oct 2017 09:36:45 +0100
Message-ID: <20171012083645.o5prct7zs4gqfw2f@sirena.co.uk>
References: <20171011161035.sudulg5gpvw4lp4o@sirena.co.uk>
 <20171011172328.GB14971@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5cckca4e3xi67ksz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53174 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752670AbdJLIhX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Oct 2017 04:37:23 -0400
Content-Disposition: inline
In-Reply-To: <20171011172328.GB14971@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--5cckca4e3xi67ksz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 11, 2017 at 06:23:29PM +0100, Will Deacon wrote:
> On Wed, Oct 11, 2017 at 05:10:35PM +0100, Mark Brown wrote:

> > I'm don't feel confident I can resolve this conflict sensibly without
> > taking too long so I've used the tip tree from yesterday.

> It's a shame that the conflict is so messy -- most of it is just context
> because that file has changed a lot in the s390 tree so the cleanup doesn't
> apply. I resolved it below.

Thanks, I'll give that a spin today.  It did look like it should be fine
but it was such a mess I didn't want to try to resolve by hand.

--5cckca4e3xi67ksz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnfKZwACgkQJNaLcl1U
h9CEpwf/UTIACdjABfBoFPYJ4wxtklmejG9MHDhGDbc0DCPRy27SzYLIvmCh4sLT
Nhq1Uk8kZvgn/Hi51mdHzLily8guEAVDHS6GiZpVcAEPhfavk+ryIHeWNRyiQGpd
yG7QU2Hl1IWlM2Yg6Eb+I9Lmy/7qcgznZOzWjQzkISRVxQmfLuTE8g6CfJfnwc50
AL1aDGRZAZtNtTYpDYq8gRacfE0vRdjby8c7NHiORm2uus/0Uqb2U/tnU5TIVnfT
v2p4a2/YtGvMU0MiTShJMY3wW3zSBaGirwE25+DPtD4iwg0WC9OclvroSnnI7Ubh
bD8E6ZuWP943IJva43ERogmmO5WR7Q==
=33e5
-----END PGP SIGNATURE-----

--5cckca4e3xi67ksz--
