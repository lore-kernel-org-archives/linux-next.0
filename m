From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] mfd: Fixup clients of multi_reg_write/register_patch
Date: Fri, 18 Sep 2015 11:25:24 +0100
Message-ID: <20150918102524.GH12027@sirena.org.uk>
References: <20150717143934.4f0ce5d7@canb.auug.org.au>
 <20150717094436.GC21939@opensource.wolfsonmicro.com>
 <20150717103450.GJ11162@sirena.org.uk>
 <20150717140926.GG21939@opensource.wolfsonmicro.com>
 <20150720115935.686b556e@canb.auug.org.au>
 <20150918135015.1c5ab86e@canb.auug.org.au>
 <20150918083336.GE7694@ck-lbox>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BBpm95f3IOry5CQh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41053 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750853AbbIRKZe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Sep 2015 06:25:34 -0400
Content-Disposition: inline
In-Reply-To: <20150918083336.GE7694@ck-lbox>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Nariman Poushin <nariman@opensource.wolfsonmicro.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>


--BBpm95f3IOry5CQh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2015 at 09:33:36AM +0100, Charles Keepax wrote:
> On Fri, Sep 18, 2015 at 01:50:15PM +1000, Stephen Rothwell wrote:

> > It looks like that patch has been forgotten as I am still applying it
> > to the linux-next tree every day ...

> Apologies if I am a little out of my depth here, but are we in
> the situation where you are expecting this to go through the MFD
> tree and Lee is expecting it to go through your tree?

No, -next is a merge down of trees that will be sent to Linus rather
than a tree that is sent to Linus itself.

> Assuming this is the case, Lee could you perhaps pull this fix in
> fairly soon? As it is causing build warning for some configs, in
> Linus's tree at the moment. I am quite happy to resend it on
> Nariman's behalf if required (he is on holiday at the moment).

I'd recommend resending to make sure Lee has the patch.

--BBpm95f3IOry5CQh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV++aTAAoJECTWi3JdVIfQOFYH/RBFuDE2LFNuIiuzzxeD+0Ub
CWWvebDD4q6ytEzg+5ZUg+fJFx+aHfq1Mift3WhLgfjDQpqklVd4dq76wEsgibP8
MlemWE/Ga0mErFtmtsIbR+D2HB6xk8di8El9wPRa6HONUYbDMjXijbe/inUAdHy6
ICAnJ+CGs1vCCLsQ2Cm41O/9Z8TfIaSEy6ZAFnYOMF2bu6FkYN51KwoXmeNCfIn1
GvSx72r9540RyTKoXKbYjL2/0U7+jac/5kPtWHjdqBzN9Jeb4NVNS81tQSNwc6vO
hMEYw8eeY5J0Jx6xQuPWAyBC4emeEZIAK2HmRM28IE88rfhQIx9AeXqhuXD/+oQ=
=BatU
-----END PGP SIGNATURE-----

--BBpm95f3IOry5CQh--
