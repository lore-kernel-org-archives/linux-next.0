From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] usb: gadget: fotg210-udc: Use
 module_platform_driver_probe macro
Date: Thu, 20 Jun 2013 15:16:10 +0300
Message-ID: <20130620121610.GE9817@arwen.pp.htv.fi>
References: <51C20F3D.1060700@windriver.com>
 <1371736393-5518-1-git-send-email-yhchen@faraday-tech.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:35888 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755914Ab3FTMQQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Jun 2013 08:16:16 -0400
Content-Disposition: inline
In-Reply-To: <1371736393-5518-1-git-send-email-yhchen@faraday-tech.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yuan-Hsin Chen <yhchen@faraday-tech.com>
Cc: balbi@ti.com, linux-next@vger.kernel.org, linux-usb@vger.kernel.org, fengguang.wu@intel.com, paul.gortmaker@windriver.com

--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 20, 2013 at 01:53:13PM +0000, Yuan-Hsin Chen wrote:
> Because fotg210-udc is configured as a non-hotpluggable device,
> that makes sense to use module_platform_driver_probe() instead of
> module_platform_driver(). This also fixes the section mismatch issue.
>=20
> Signed-off-by: Yuan-Hsin Chen <yhchen@faraday-tech.com>

I would rather see you remove __init annotation from your probe()
function. The reason being that it will users to bind/unbind the driver
through sysfs, which is pretty good for testing, at least.

--=20
balbi

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRwvKKAAoJEIaOsuA1yqRE5AUQAI7eIsvQ06oe8iv+YLdGtSOx
nRFMladWYJlqtK5g5l9ZT0cnyg/YStdBv399FRwDTrCHLgJkfmuwNkD4/wPy8Pe9
sUzeQfQcAXgGKRuEymnjn6fj7/lcam42qWN8djsqg/WFj7snTamdFpJpAvuyCXO1
GqFerzus4jxA58MGBWNzLiXDCwnVyf4j+EBhzl//3cwfqbLz0rntM/M52lhbxsA5
20gvYrBKOCPUunY1hgTJScQnGSz3tjwRlLQCL9i03lszCoe7Qtk9oBDMyk7qQ7tV
5usUkHnsFvaRvyoHCWg5CPCoe/H/hsoIUopjxZo4aoh8EdDWKMvJW+J/LcGBZPV7
PAsgRaMHL9Xp946uHb6M0u7unFl2cci9CXF5fXxAFrXeCuSrQb0QmK5BmG8pAiOE
G0QuiGaoFqra6oHDTWQolOyrRwDe1bplfQRtPexJlDwRSPTZiLq4PqsOTqMIGno0
c4rdzZnIupimaZSQWVinI/+ogKrJHWa7Rb/nm85L2oHEEvnpNRH8qODKdNKSbb83
XTlEhYVyRagGYHxO874zDqenYBAhSuETPlSPuREGtIwqFJ0yUwWY2+O/xOBp7j7b
PmVpizl6P4Ino+IFYBsspS0SWn76dD8Dflxp4urU43/PZ4d7e4ql4MAXRBP8fKO5
MDiy8xTE4CfUGJSK6wzx
=7Mq9
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--
