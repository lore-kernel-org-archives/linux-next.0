From: Simon Horman <horms@verge.net.au>
Subject: Request for inclusion of ipvs and ipvs-next trees in next
Date: Fri, 2 Oct 2015 09:56:26 +0900
Message-ID: <20151002005626.GA4802@verge.net.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46322 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbbJBA4Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2015 20:56:25 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, David Miller <davem@davemloft.net>


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I would like to request the inclusion of 'ipvs.git' and 'ipvs-next.git' in
linux-next.

https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git
https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs-next.git

I have been maintaining IPVS using those trees for a number of years and
maintaining IPVS without those trees for a number of years before that.

Usually 'ipvs-next.git' feeds into Pablo's 'nf-next.git' which
in turn feeds into Dave's 'net-next.git'. Likewise for s/-next//.

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDdY6AAoJENfPZGlqN0++K58P/jneqAURGzUN+gFRQ3R9PW2R
0vJ7gJx4rH7ya2DBgHxOZzQhrFwcLQtJ2I0S1H8q8pNnIEvMOxe9M1NOSZWSb1Ci
Gl/C+N4xoPxV7eqUrxjnm8DANhjQQPg2BU3RbHmSg6uURHIckA3IYJSDdDnPsl3l
atCAk8y3aXs/pZVBV2Xmq+67XVbiXoEnzBWN1KeyI0YmJRYGlNE+KY9D06vK0OiH
a/6+S6UE9QS7TUyPFvyY+ZxPDWRygO4KB452AQeYI880mtuFdvlKxJmr6l51S0U0
DEQxO+BU3hirV28ujF3zcndMzDfurr/NXDnOc8qCyMyz+mYur9lRfD/1SARVZePp
iuRSe69C9X8jfeo4JvxjF5arfPjXxToEh7GhqTZ8kHc+LjrtfTqALfkGi4WCIF0O
OS8Z70YG4fumIl2Si+6CSg1kp+wYSBANQqwu9mFnP+8aGUUijeHO5bVc+KaTE8jZ
1WqdtyeTj+DODPgHZimZUs2RSIgEqmLeHVqr/z0NbNsRZxTraVPFNGBLivT6Mn0w
XEo+E63MB1GUuHX23FwZJM+yRKTE/C8OtlkgYtpX9xsx4GPisI1ncMza0y5wi/bU
D5uK8HUMJv6WBrWSNrKyXcd1C6lxchF788eXDVtz2QING3E7NKeiSfEREzlBCow2
dKBdldI8ubAS29TUUKnb
=dots
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
