From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: Tree for Aug 20
Date: Wed, 20 Aug 2014 10:52:22 -0500
Message-ID: <20140820155222.GA24407@sirena.org.uk>
References: <20140820061703.6128f99c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9aHjqRFB8NC1b71K"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51410 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751744AbaHTQ3Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Aug 2014 12:29:24 -0400
Content-Disposition: inline
In-Reply-To: <20140820061703.6128f99c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--9aHjqRFB8NC1b71K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 20, 2014 at 06:17:03AM +1000, Stephen Rothwell wrote:

> The sound-asoc tree still had its build failure for which I reverted
> a commit.

Are you sure about this?  There's a bunch of updates to the tree
including one that's supposed to have fixed the build failure on PowerPC
which haven't made it into the tree, was there a problem with the fetch
perhaps?  I just checked and cgit says I pushed 23 hours ago so it
doesn't look like a problem with the push.

--9aHjqRFB8NC1b71K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9MQtAAoJELSic+t+oim9b/QP/Rjlm9TTwFF8iQMeQCJfa9IV
jj/3wsIxlnRgcC4GQz8Nx3gYQsS/rIixD9XtlhwhcdCj21DtpD+yILSHez+y/nvb
HiiHj/j3Re1HaBF8cPmA05J8GXwx6B2mMH7+LWv4xSaK51sIIDAGxcCd1LAD32DP
0o3AVq+wttc9FT43FrRfGdT1RvqqsFHeook4Cop6VSIQJV2ja9qK6C6YaMhJbbUD
vtOijiKfRYYB04CJoPbxYiA8HYib0D8oyPm4DqWIOWgDiKQPZHe/Uh8Ew9fgbaBh
Te/f3aPowomq3IVQK6A9d7YyyO9Ncx/19JHdnEDu/1asQ3PJW4thWISyxCj2s0Fm
h5CuiJh+AB1RanSxKeUAK6mlbuMPICPbOeLE0tXwu0aNfPbncyFF7aXb2G9Dll4Z
NfK5n14zHkcTNqzta1q4vDAdce8vy8XjLBaVwzMdZ6aOwQGFgodmaAYg9k++OiMo
+4qRVcw6JAnNWQOCckM6+giTKb8Dh0kSk4Ise+Buv/FRVG9RAiAcIY7B6Vp92hKC
dYAhco2QGUMm3+/ptnyoYsq9UgTthP9LikuVeHrIk28sTPbAbYBI2Ea9fyNEe9D1
gPEPim462NpUWvGEUuybpC3noigxmlgxO6iELz2KS92hkJ6Z/7kjSw/eLe+6oLea
Hq8cR8/NUOpEm3cpH0/A
=QEM1
-----END PGP SIGNATURE-----

--9aHjqRFB8NC1b71K--
