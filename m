From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in
 em-x270.c
Date: Thu, 29 Mar 2012 16:11:57 +0100
Message-ID: <20120329151157.GT3668@opensource.wolfsonmicro.com>
References: <CAP=VYLp-weNj35OHtmZ6pf5-t7OUxWREeu8r5sSOLhFYu0CppQ@mail.gmail.com>
 <1331244366-6147-1-git-send-email-paul.gortmaker@windriver.com>
 <4F732C97.2030804@compulab.co.il>
 <20120328152743.GW3232@opensource.wolfsonmicro.com>
 <4F73356D.5080401@windriver.com>
 <20120328161305.GZ3232@opensource.wolfsonmicro.com>
 <4F73437B.6070806@windriver.com>
 <4F7471A0.6070208@compulab.co.il>
 <20120329145436.GS3668@opensource.wolfsonmicro.com>
 <4F747844.9000900@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jPC/Tkukgh9ZDT79"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:33365 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932491Ab2C2PL7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Mar 2012 11:11:59 -0400
Content-Disposition: inline
In-Reply-To: <4F747844.9000900@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Igor Grinberg <grinberg@compulab.co.il>, haojian.zhuang@gmail.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org


--jPC/Tkukgh9ZDT79
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 29, 2012 at 10:57:08AM -0400, Paul Gortmaker wrote:

> Would you like me to send a v3 with the .0 and .1 added, or
> are you OK with making that small change to v2 yourself?

Please resend, makes life easier.  I'm not sure if it's me or Haojin
who will end up applying the change anyway.

--jPC/Tkukgh9ZDT79
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPdHteAAoJEBus8iNuMP3d6ysP/iXpk9zoutcm4AI+feSWK0L6
kcsw1JNqDV+yVnzE07+3l4GOmqbp3XZwxtmz6gn5839hgyQBJALlIqM30QnBB9yD
G0Tzv0cjWf5b7Gk4zMzFz+YNR4qgQbfZbJ0Db7F0NuXYaNDu5EmUVFgdFuD/CpHd
7vaHrwiRGtfz2NC/SG/4FRaoGmmWmTPzcZiNG04fhfjjy9IQiXl2OSweo+zjbI9T
uto2uPDMX7NQUz8Kr91Y5e2pnUx9uOTstVMgF1aAHWW5Pinr59P59/GQd0s2STnM
mCD/InXw7PTaVYmVcIX4mH2UWz9Ja3hjrb8NIdcjiRvyLWw52Wabi7aYHoV5+/MF
FGoyfVh4bJj/oXKw+D3Ei0ZuWgxjTdWp+JUHiOmQPcTWWv17tUyfQ4gylrLSA3PP
l4RcQjnyd1kKojWsm8VpxTafAyf+I4FHvnQHDdztyqxzYUAn1PBH4zw/VYSvQNkM
bl16OPIDMtrWWCG6GxTAf+ugJ+Qj0HC03o6iaCD/Q+STXvdc575i7fOcGyLsmzbp
KajnqKeTXJbMBG3A35T7pLp/gmBBvO4E+wufcsbI11bJyF4iU131yY/N/GM0/Lrv
Eh1g+B//BP9gLKCvW6Ng7wnwV4u4Iy7vemQf0sOnaLNMEEblYLamNYW0KXn6hDhM
BeQ750z0SHH+3lMVu5IC
=VQUZ
-----END PGP SIGNATURE-----

--jPC/Tkukgh9ZDT79--
