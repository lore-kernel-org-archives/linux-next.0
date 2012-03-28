From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix regulator related build fail in
 magician_defconfig
Date: Wed, 28 Mar 2012 11:18:52 +0100
Message-ID: <20120328101852.GE3232@opensource.wolfsonmicro.com>
References: <1331084814.11802.YahooMailClassic@web29012.mail.ird.yahoo.com>
 <1331242494-3157-1-git-send-email-paul.gortmaker@windriver.com>
 <CAN1soZzDRR4XQ34WDL48=j+Ff8t5fsCFaccqZAKOQ1OAPeDXcA@mail.gmail.com>
 <4F608F4F.8020106@windriver.com>
 <20120314123236.GE3133@opensource.wolfsonmicro.com>
 <20120328094351.GB22414@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:33118 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757656Ab2C1KTS (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Mar 2012 06:19:18 -0400
Content-Disposition: inline
In-Reply-To: <20120328094351.GB22414@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>, lost.distance@yahoo.com


--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 10:43:51AM +0100, Russell King - ARM Linux wrote:
> On Wed, Mar 14, 2012 at 12:32:36PM +0000, Mark Brown wrote:

> > Yes, that's what you should do.  Calling dev_name() is only possible if
> > you have the struct device and removing the need for the struct device
> > is exactly what we're trying to avoid here.

> So what the hell is happening here to fix the breakage which the
> regulator tree caused in mainline?  From this thread, it looks like
> it's been known about since 8th March which is now twenty days ago,
> and it's still broken.

Yes, please at least apply Paul's patches - honestly, given how old
these boards are and the general lack of activity I'd rather expect that
the only thing anyone's doing with them these days is build tests.

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPcuVAAAoJEBus8iNuMP3dl60QAI2ubNFAOyJJlMOnuqNfs/7J
XKs4D7C5oJXpYlVIl7dUCoVYoPPgJSw9uI0+gciGv4Q3JVihryBw0WvGnsVkU7kk
GqrUa+RG5gF14z5oF+W21YkwR+I0nCYoHAlDSDssRzHWJWVmi3C9BrFP0+sLVtg1
HXr9uKff/0BMVLtC8sqGVQin4NgccO2gvA8PkzpF82KZ381xDcm8MkI34R9opg+3
y53BGXhE6wBRoaoVWHzFIX+U3QIasSorxXJ8xFldHw+XGGZrzcs4B4WvzRJLWXpE
sILTYoJRIEBOQd9WTS794TcU0bUFJZiso8Zddlq5FNha9lcgP++cvc4QrycnuNY+
2aAxgCs5rTIqeDCAibWgmf1+QjEWla0/aWXhJUbO38d7azquJzB0sAsnj5MzAdd2
hsUFJrwZ/6CwE0bFnJH4VHgJQEqU3Sfj86neScN4527pd3Qmhs2gQm0dM0SbRbPk
rtmcwXpqe4a1WQbGpo6jg8Pcf8sm3pscOz3cBN3F6ipe8FjyWt2LRrO6XIUzXbMx
wBQoJTZ+wzUNofjFpPOToPPbkPzLJ+y7vBnthTjg9gPgTz4K5cwDqmbfQAeufynI
fJPdmzLq5c+Tdscx8kF/gUq/9yCGhg83uDIReIHjyjCMGLYykzQXtWrDUYVuQGA0
KgPsbymeizu/Oy/1aIVp
=N0iS
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--
