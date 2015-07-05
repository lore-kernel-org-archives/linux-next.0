From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150703 build: 1 failures 73 warnings (next-20150703)
Date: Sun, 5 Jul 2015 10:36:54 +0100
Message-ID: <20150705093654.GB11162@sirena.org.uk>
References: <E1ZB04o-0001MQ-6U@optimist>
 <CAP=VYLqpwQ4OqYMBW4m9oo2ZjiZEda7vn1zSXxLEYtH7ucbOqQ@mail.gmail.com>
 <20150704165249.231cdacd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cDyoBSpeMmeqjtIY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40182 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755808AbbGEM1y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 5 Jul 2015 08:27:54 -0400
Content-Disposition: inline
In-Reply-To: <20150704165249.231cdacd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, jack@suse.cz, Andrew Morton <akpm@linux-foundation.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>


--cDyoBSpeMmeqjtIY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 04, 2015 at 04:52:49PM +1000, Stephen Rothwell wrote:
> On Sat, 4 Jul 2015 00:01:33 -0400 Paul Gortmaker <paul.gortmaker@windrive=
r.com> wrote:

> > 6e9d331aec60a3dd1bbc035fbdd84a90364b8565 is the first bad commit
> > commit 6e9d331aec60a3dd1bbc035fbdd84a90364b8565
> > Author: Jan Kara <jack@suse.cz>
> > Date:   Fri Jun 19 09:05:45 2015 +1000

> >     drm/exynos: convert g2d_userptr_get_dma_addr() to use get_vaddr_fra=
mes()

> Amazing!  Four SOB lines and lots of CCs and noone bothered to build test=
 it :-(

> > Fix seems posted here...
> >=20
> > http://permalink.gmane.org/gmane.comp.video.dri.devel/131898

And there was another, similar fix sent as a result of me reporting the
same issue earlier last week too with no response :(

--cDyoBSpeMmeqjtIY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVmPq1AAoJECTWi3JdVIfQKAsIAIL2SZ6aFLz4JnTXh4TVlNUO
/RgOfzEKQq37Hjw8I1lfr8rIjjpdx7LuBASb/7GrsdaVxIUzLZDjALI00pC8Qg0X
QUYnkkNwXlmEUc1sttB6OIatqmRtP4sK7DM3tuZrf85iBy15x68MeGk9usNEjPVe
lOyBY7eV6foOfAC4p12LIdMf4B82lYrHF9UlVIXfZzWaOicaNJQq85Kdivqz9bhO
jVB9LDz0H4hbpLWCCg2XhF1sjTUJi2RrSRlCjClBWhm2lO3eY11ojcRCN8x2bfyo
sBvfFjvW2NwrYrmr6lSq44a4/zBB9LO3iJhkDPuhBv9DoTb0kYTJtgsNhyi6Eig=
=RXXn
-----END PGP SIGNATURE-----

--cDyoBSpeMmeqjtIY--
