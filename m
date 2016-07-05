From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160705 build: 2 failures 6 warnings (next-20160705)
Date: Tue, 5 Jul 2016 11:52:42 +0200
Message-ID: <20160705095242.GP6247@sirena.org.uk>
References: <E1bKMRb-0005l2-N2@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NFhhVVeDTkyNvWHh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44472 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268AbcGEJxN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jul 2016 05:53:13 -0400
Content-Disposition: inline
In-Reply-To: <E1bKMRb-0005l2-N2@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-usb@vger.kernel.org


--NFhhVVeDTkyNvWHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 05, 2016 at 10:15:03AM +0100, Build bot for Mark Brown wrote:

For the past little while both arm and arm64 allmodconfig builds have
been failing with:

> drivers/built-in.o: In function `nbu2ss_drv_probe':
> binder.c:(.text+0x29438c): undefined reference to `usb_ep_set_maxpacket_limit'
> binder.c:(.text+0x294468): undefined reference to `usb_ep_set_maxpacket_limit'

That function is a static inline in linux/usb/gadget.h which does seem
to be included (the driver builds fine) so I'm not entirely sure why
this is failing - I've not had time to investigate properly, I don't
know if the compiler is misfiring here.

--NFhhVVeDTkyNvWHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXe4NoAAoJECTWi3JdVIfQuSYH/A4HLp6mxh9SpiRIqRBDayOZ
AQ8eXg69UOCmmYPje7Ai4+WLz5Ltlfvk3PBGoMpmC4agY7Z9tLtakHmZdr025AtH
sbFhY04XRdf8Jd5oT3L3eADJ+QYtEXApKQM7kUJChXz7A1jRYUyAmjtZXVuW4mMt
nZ4zPK4HHWUP4UEXWMHQVp653s5+gIWdkTGxPf98Pt7iWuExZCeKIhQUVjq9gVwG
K5kEDLubc2cjcwCStFiAs9lWmscKqiOm/chmHIL9O+w1Vp3ej8ne5psf5KQt62yZ
jnorOiRELsgHCx1d08ZG7gbvt8MO14jCCgVChuoVmv9leqbX6y/l+j5NOcP8X6w=
=aVqR
-----END PGP SIGNATURE-----

--NFhhVVeDTkyNvWHh--
