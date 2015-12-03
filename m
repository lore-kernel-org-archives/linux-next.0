From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the  tree
Date: Thu, 3 Dec 2015 00:07:17 +0000
Message-ID: <20151203000717.GN1929@sirena.org.uk>
References: <20151202201743.15940e7e8853122af01ddff4@kernel.org>
 <20151202220750.GA23818@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pHQZnkZJcpgkVomt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58296 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757808AbbLCAHW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 19:07:22 -0500
Content-Disposition: inline
In-Reply-To: <20151202220750.GA23818@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--pHQZnkZJcpgkVomt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 02, 2015 at 02:07:50PM -0800, Greg KH wrote:
> On Wed, Dec 02, 2015 at 08:17:43PM +0000, Mark Brown wrote:

> > Hi Greg,

> > Today's linux-next merge of the staging tree got a conflict in
> > drivers/staging/rtl8188eu/include/phy.h between Linus' tree and commit
> > "staging: rtl8188eu: using unique names is good" from the staging tree.

> > It looks like the patch is already applied so I skipped it.

> Sounds good thanks.

> Note, the "Subject" here looks a bit odd :)

Well, I couldn't entirely figure out what it was a merge issue with.

--pHQZnkZJcpgkVomt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWX4e0AAoJECTWi3JdVIfQ5vAH/jGNgO3u6dTfW7T7Df9SXWkk
B2NlgzrdNvZuaqm3qeb4xo4ZPBh/q36Zz39hxjvUs6gST5XO1+Kjtf1taAz7olW2
w/yJMX+Hvl6NJ93KEWg4URhZzO9hc+DbpVTiKM+OH91c9NUjJ2ZRQOUDIYRYsmQc
2dngKvmQxMMSp5WCVRgPQnbnrRoxRAnC2hKyoGMKgjN8+hGVuU94iqV04+sYpVn5
+KGBxX4nXQ6EfA4oGdduN8MhQolmREnJMSsVJMz407ntGSub97Gg0vUdNfgbB5m1
EKZl7xzglwuqmCG0onzhU4ax6Gxz8KTnB3HCFLYc2C3jXRYBec7Zdu94MUfHj5I=
=itTA
-----END PGP SIGNATURE-----

--pHQZnkZJcpgkVomt--
