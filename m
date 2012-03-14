From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix regulator related build fail in
 magician_defconfig
Date: Wed, 14 Mar 2012 12:32:36 +0000
Message-ID: <20120314123236.GE3133@opensource.wolfsonmicro.com>
References: <1331084814.11802.YahooMailClassic@web29012.mail.ird.yahoo.com>
 <1331242494-3157-1-git-send-email-paul.gortmaker@windriver.com>
 <CAN1soZzDRR4XQ34WDL48=j+Ff8t5fsCFaccqZAKOQ1OAPeDXcA@mail.gmail.com>
 <4F608F4F.8020106@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:34078 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760935Ab2CNMci (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Mar 2012 08:32:38 -0400
Content-Disposition: inline
In-Reply-To: <4F608F4F.8020106@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, lost.distance@yahoo.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org


--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 14, 2012 at 08:30:07AM -0400, Paul Gortmaker wrote:
> On 12-03-14 04:38 AM, Haojian Zhuang wrote:

> > How do you think about Mark's comments? Use dev_name() at here.

> I'm not sure I quite understand you.  I'd looked up the
> structs and got their respective value that would be
> returned by dev_name(), which is what I thought was
> requested of me.

Yes, that's what you should do.  Calling dev_name() is only possible if
you have the struct device and removing the need for the struct device
is exactly what we're trying to avoid here.

--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPYI/bAAoJEBus8iNuMP3dqakP/jSpCxt/V05+kOTnRCkCmA6x
t0BOLGt3uiE7IXyY8nWhWcnlHh/6xU5/yiLP4t5ga8COrfKT2DuOgqT2vgY2THqp
z9HJT3ieaFGhL0Q+DWosBZZn7ICchOR4Eyo0Gbhq91EEWurbaKGRidiipxh9srDD
iWIhfEy6kg0B3e2bKTxYwhtqFzdf/J+L33HP5wLHtOgsaB8l+UEFyeZU5YfnKYT6
vzTEiqsiM9niFqItW/YmEoj1BTEn4bHjOeGeTwmhFQMepvtICSoqn6CbLpt6VA3D
XaAe1KgywaC7ySnRVOWQYy/ucnNwAJd5LZmYNT+iX6apRbjH9VQAqtpc09b+sFCo
JnJ9jfpGGrKqSZ1aL+RPmUreJ4zLl2kCeeWsKI+k1RfbdadpX+vXGy4SWsoqEbrp
hr8qR73kljhyOwjRjNT4jD2skTQX1ybb4t+ooknSkDQjCoLSR7dACObf95VN9SCg
5a6aBVHQq9pwoFmFZHci9gwOorcUFhvqGI8pFm/8SOUIa3FesKkejtbA6t07mwH+
GlovsEmk2lFd4RErc/bpVwdKzPfAg4LILtpm4MRszWSHt8LpRh/O7lD8DJ19DjA4
yiTmgXDMrSbORMf4SBfFNxMXKeaECfBfT91viXrP23gUi0V/fTpmoG1QJHHC+b71
GBo/lZvTnZn6fjsrqH3s
=dTCP
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
