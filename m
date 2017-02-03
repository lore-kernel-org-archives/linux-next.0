From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Fri, 3 Feb 2017 12:31:54 +0100
Message-ID: <20170203113154.3aeiwo7mg2cty6dz@sirena.org.uk>
References: <20170201134221.7a413d9b@canb.auug.org.au>
 <20170201100343.yv5e66pxkdmlnoxm@sirena.org.uk>
 <20170203092955.62f9681b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bwowsnxouccibt4e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59364 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753070AbdBCLcD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2017 06:32:03 -0500
Content-Disposition: inline
In-Reply-To: <20170203092955.62f9681b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>


--bwowsnxouccibt4e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2017 at 09:30:04AM +1100, Stephen Rothwell wrote:

> > Discarded that commit.

> The patch is still there ...

Only in the merge branch, it got dropped from the source branch but the
merge ended up not being rebuilt.

--bwowsnxouccibt4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAliUaikACgkQJNaLcl1U
h9BwcAf9FQcC3WhNaaG3rgJ/zDU3De4aH8+fTxqU0raCvfcmqh4CW+Ikg1gf20ZD
1yhETye9gefiAXTOVSdhhONlgiAm2nDolmAYzqfam2aeF9cJ2SK+VUHuAQ0f/u2D
7TiFxrRnTnKHECk5i1KfZerHvucqGJ6te4QyWhvRETL7WAXa80xhjF5XHKl6AzoW
sB8ZG0vV3PNCgLEuoUbFQzAL27mya3AAleztjmUonw25o0Es8X5yFMKY1UAB46K2
zC8x+bKldUZHIqMRF0YVOdzOm+E4mGHs1DO2FM+1YV96dw77P30gYpsiFrid7RBd
msdNU9xZ3hUMv+9QpiGPlB68x+o1SQ==
=oV/G
-----END PGP SIGNATURE-----

--bwowsnxouccibt4e--
