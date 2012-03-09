From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next broken by "ARM: S3C2440: move mach-s3c2440/* into
 mach-s3c24xx/"
Date: Fri, 9 Mar 2012 12:16:22 +0000
Message-ID: <20120309121621.GH3273@opensource.wolfsonmicro.com>
References: <20120308162326.GA30941@windriver.com>
 <20120308191207.GC7557@sirena.org.uk>
 <4F590F74.2030007@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42187 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754796Ab2CIMQY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 07:16:24 -0500
Content-Disposition: inline
In-Reply-To: <4F590F74.2030007@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: kgene.kim@samsung.com, heiko@sntech.de, ben-linux@fluff.org, tiwai@suse.de, linux-next@vger.kernel.org


--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 08, 2012 at 02:58:44PM -0500, Paul Gortmaker wrote:

> The "it" was the commit in the subject, and the ID in the above text.
> That was the last commit to have touched this file (via moving it).

> What I took as a relation to fix/asoc was shown in the text you've
> gone and deleted here in the follow up.

You'd written some text but the text wasn't teribly clear - nothing
about the code looks at all audio bug fix related.  Are you sure the
error wasn't just in Linus' tree?

> In any case, it does appear the file was broken before it was moved.
> The offending commit is actually c1ba544f81544ed9613ad5d058968533dbcef4b2

> 	"ARM: S3C24XX: Fix restart on S3C2442"

> It appears that a closing brace was dropped when it was integrated.

Right, and that commit doesn't appear to be in the ASoC bugfix branch
which is why I was mystified.

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPWfSPAAoJEBus8iNuMP3dIYMP/RZmUqu727jfKFX14wtAHVCU
wMqBoItFqlapBdlbFPsTdayjK1WqttSkaJMC7YSVttYFt5PimpHc1cC/kQRBRUcD
r/CrWXMO1IpVuS3fET1UC4S1PETzUCPkZAl9VAiPhDEZKyoD6iYqLQGnFaOxr4EC
OccBRuZheiXnRC0dGXsC4juxxfgdOSKmXFJOSrtMiLKb0hnJwe934q3p7n0jxj+i
/hBxM5ahQPohDWWEn2dSlB+TxdYgfd9eoIxg4VO8apunjuFaQOHJVnmJ0eER1vjn
PWlfVhuIy+VwDqifhWEb5PbFc/9c35aBzxS+ZOoLyoB9Jkm7nbPz7kFCQCdSLKEP
cf37i9aA9T/myIiPeWMd/g90/lqHVHsNiacdyH0He/TJpnaS/A183FxTQ/MDZyAR
KpyoUqViz6VykLFAgja30mQ3l4VykP8/Q+WYHdvfiJWExkTkn2avA2++9x3G38Tj
88agxue7s67Okt4CAVkduk3xE4drYhWtzrOS6Ni3Oe0aT6eDpUxan+Y7x01L9Vl6
8Xu5S9fjJSVtNZmPMkmdgpAQvIIvqFKUITtzob4jwjYpCC7JssDcvy0FPzYnmDx5
X5IbLDm3BX+alfQN2lFsk6sSkEhoKqZpxd4kDy3xWK++Baf0nd6XF6XZjQXTmxpr
i3oDc0FuYQfh3TvtamXa
=9uJW
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--
