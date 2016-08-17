From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160817 build: 2 failures 5 warnings (next-20160817)
Date: Wed, 17 Aug 2016 11:45:35 +0100
Message-ID: <20160817104535.GI9347@sirena.org.uk>
References: <E1bZvGr-0000Fe-Gg@optimist>
 <20160817092644.GE9347@sirena.org.uk>
 <20160817101453.GT6232@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R0KYKl6i9Fj1nV1E"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49456 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753066AbcHQKp7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Aug 2016 06:45:59 -0400
Content-Disposition: inline
In-Reply-To: <20160817101453.GT6232@phenom.ffwll.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel-build-reports@lists.linaro.org


--R0KYKl6i9Fj1nV1E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 17, 2016 at 12:14:53PM +0200, Daniel Vetter wrote:
> On Wed, Aug 17, 2016 at 10:26:44AM +0100, Mark Brown wrote:

> > caused by d25bcfb8c2 (drm/hisilicon: Don't set drm_device->platformdev)
> > which does a a partial conversion to new APIs.

> Yeah I screwed up since I naively assumed that compile testing on arm
> 32bit multiarch is good enough. I'm setting up an arm64 environment now,
> but would be nice if arm folks would stop loving bazillions of configs so
> much ;-)

There's only two you really need to care about for this sort of thing,
arm allmodconfig and arm64 allmodconfig (the equivalent of i386 and
x86-64) - there are some things that don't fit into either but they're
all legacy systems, those in active use are pretty much covered by those
two.

It's also worth adding || COMPILE_TEST dependencies onto architecture
lists to improve coverage if they don't have any actual architecture
dependency (which is the norm these days, at least for ARM), the
dependencies are useful for normal users so they're not asked about
drivers which clearly they can't use.

--R0KYKl6i9Fj1nV1E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXtEBOAAoJECTWi3JdVIfQc2cH/3rgcThAFJpzKTTZpR5MT0JK
rAdRvJFrGLCP4FFPgVdlLM7ePbu6v+yg9JRHyfPzcqUARP3ROW3ahA5SMaoieZWl
5hUEHiBEB/LdbrZ1nyo+95Ooo6XxkwU5T9nbSOP0k24sO+XH50CAKK7yrECxyYnK
rG7xVjZD5+vozL+oazve16KDTkbysKKFUUTpa98QE0gar5eYg8RB8l/QuAWEl4VQ
4u3AwMn3K2SBvH/BhYMkkxyN4AeIZevWgTXtL10BuHilYIMrws/K4GxhwyTMZQse
tpiAl8M7IX6TquwBeSXt4GT6HcC31wAEH6OUyD1Hp8ZeXdh2oaZZ5blSSWTzVa4=
=bdS7
-----END PGP SIGNATURE-----

--R0KYKl6i9Fj1nV1E--
