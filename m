From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Tue, 10 Mar 2015 10:40:17 +0000
Message-ID: <20150310104017.GC28806@sirena.org.uk>
References: <20150310134441.1aa4bb60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dUQ3G7okZyz11iOi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33644 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbbCJKk0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2015 06:40:26 -0400
Content-Disposition: inline
In-Reply-To: <20150310134441.1aa4bb60@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Hai Li <hali@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Yaniv Gardi <ygardi@codeaurora.org>, Christoph Hellwig <hch@lst.de>


--dUQ3G7okZyz11iOi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2015 at 01:44:41PM +1100, Stephen Rothwell wrote:

> grep is your friend ...

Indeed :(

> This patch should be applied to your tree as it is based off v4.0-rc1
> already.

Applied, thanks.

--dUQ3G7okZyz11iOi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU/soQAAoJECTWi3JdVIfQMiIIAIJVo5dg7/zX1gQjcUrmQpp9
hRb6lzkkAb3L8L43qXCX3+IfrOAbQlruLy6+5HY7JEdj+FHYwAtDAoi0ooYy/+5W
lN39R/uI3R+oaP4dzQiOTa5Sys0o+oqX20+c+3P6EfezLZmvP4475452c8BbUJS5
Y01ccaviaDKr6EjPBep0SlHN2hX7JAUk09ZZeN/qjjMcXm2Q3yycSkyIkcnk8b1S
UA2Ofb1dNxtSnQfFYQWbamQ7dL22JPaLSOK+jb0Qz0Bo0KBmd4Tc42oq/Kalk+lz
Ju1u+0UCZQkbVaeJqdLPIJjilP0VIJGJMYBvGwAPSFTvBwsjPir2w0MaPpCDLig=
=UftS
-----END PGP SIGNATURE-----

--dUQ3G7okZyz11iOi--
