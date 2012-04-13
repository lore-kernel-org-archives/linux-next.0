From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: "amba: Remove AMBA level regulator support" commit.
Date: Fri, 13 Apr 2012 12:25:42 +0100
Message-ID: <20120413112539.GS3168@opensource.wolfsonmicro.com>
References: <20120413012230.GA30438@windriver.com>
 <CAAQ0ZWReL=+bm9UOnt2=Dfy0zeWbJe3=y3pPzUKRzm2y277kFQ@mail.gmail.com>
 <20120413103207.GL24211@n2100.arm.linux.org.uk>
 <20120413104452.GR3168@opensource.wolfsonmicro.com>
 <20120413104900.GM24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mln0rGgUGuXEqmuI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:36095 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1762353Ab2DMLZv (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Apr 2012 07:25:51 -0400
Content-Disposition: inline
In-Reply-To: <20120413104900.GM24211@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Shawn Guo <shawn.guo@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linus.walleij@linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--mln0rGgUGuXEqmuI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 13, 2012 at 11:49:00AM +0100, Russell King - ARM Linux wrote:
> On Fri, Apr 13, 2012 at 11:44:52AM +0100, Mark Brown wrote:

> > I did say we should've been pushing Shawn's patch in as a minimal fix
> > for 3.4...

> What patch?

The original one which just changed the return code that's checked for.

> > Regardless of what happens for 3.4 we should keep the removal for -next,
> > it's clear that we don't want the bus doing this and it's causing
> > breakage for the non-ST platforms.  Do I need to resend the patch to the
> > patch system or will the existing copy be OK?

> What I want is something that doesn't cause a regression for 3.4.

Well, if the overall result is something other than removing the code in
3.5 then we'll just get further regressions down the line.

--mln0rGgUGuXEqmuI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPiA0JAAoJEBus8iNuMP3dCEEQAJtovuOVIR4wS+j0TLJ0aKrg
wEO9Ob/PhyzZ5awjC3DgNK1UfylONn1C5/F/diTFZoAWF66xonetkfbRgX54aE4o
f2NAAC526q85Y5RtMWPVGZ6dnEJpStIPbAx0Nz6g6SjbDld0nSV2Vl1RULpHtNOV
Ky94XTsmXGn3JuB7cYU3UY7/Cb3OljkIkqoR3mUyGJ6g/jGdxIKnY9ANvvsI5uYS
JsbW51ElBzfhyDbyZy4yvDj31dO+QCaL6wwwXui8QWJ9Yxx539Dyzbti/6rMCLeN
A79wDyH4h95B8g0gWhWh09KOIhhWyUxA0s59qNaTv7oBfCScqmLRwgrEEPoMBfZH
bQOrudcufnRqNmA/0jA2MPjH49y84r8AcGb2mwn8XXuduh/ksH0G0hIIqn68hMe9
DcNRHWZiGDprBKZ6ZwgmLVIjLzd1+4dTlAqzQMN3sMId/w2+iqP1OiX/PPKb3hzi
LxmdGtA1RLsJhvWJ+g5mWKVaXBNhyNAclbBZbNBdAk+nvMJcIcSTSiJsAU57Kv3u
IR5ZZ6vVbALuGpcA+Kddc/6uZg/CjBSdZ6mjq46ZK+HR7QbIONPqExwQ20XysYTg
ySTiwvOEMKY11nrhbtn6VBSf1yZsiczNgnY7TIAIn1h5e95XndJZoQPSPwTPJhdX
TECwbJr6LmAsDg3+kRUi
=CnEK
-----END PGP SIGNATURE-----

--mln0rGgUGuXEqmuI--
