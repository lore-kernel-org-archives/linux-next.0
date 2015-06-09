From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150609 build: 2 failures 40 warnings (next-20150609)
Date: Tue, 9 Jun 2015 19:23:05 +0100
Message-ID: <20150609182305.GW14071@sirena.org.uk>
References: <E1Z2Ny7-00019f-Dj@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UY5t8JEv+jjMAULN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50688 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932161AbbFISXN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2015 14:23:13 -0400
Content-Disposition: inline
In-Reply-To: <E1Z2Ny7-00019f-Dj@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Y Vo <yvo@apm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linaro-acpi@lists.linaro.org


--UY5t8JEv+jjMAULN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2015 at 07:09:47PM +0100, Build bot for Mark Brown wrote:

> 	arm64-allmodconfig
> ERROR: "acpi_gpiochip_request_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!
> ERROR: "acpi_gpiochip_free_interrupts" [drivers/gpio/gpio-xgene-sb.ko] undefined!

Today's -next fails to build an arm64 allmodconfig due to commit
733cf014f02040b3ad (gpio: xgene: add ACPI support for APM X-Gene GPIO
standby driver) which adds ACPI support to the X-Gene standby driver
without either adding a dependency on ACPI or there being stubs in the
ACPI headers for the above functions in !ACPI configurations.  My
instinct is that the stubs are going to be nicer since it'll save on
ifdefs in drivers which seems nicer.

--UY5t8JEv+jjMAULN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVdy8IAAoJECTWi3JdVIfQ/JUH/2gXCt9iVNUHCcefrUTJ3lbC
9aVsX5A16lzviyA6aXym267sNCSKHiRFHJG7kqJLQmhlPCUnegyVddbLBXEKx/6d
l/DsDR/gbAnhM+/XfZ6J77J7lzNIrM6ttr+V0bPQxiOf0i7bhya/IHagRr4o3nYU
t1gJOXOJ+tfS/itvIfMOA6Ru32dvpmRBfFnzBplrdjOlCT6r6YtaaqGtz3VRyuG4
8fh0nbLM9L0mMEI6vZSOXX6r7Au7GZlt3DEayfhVV17W4SWPfQMYKZxwXFi/OROQ
Tz2L9FDoUSriRYe7GGskSDlcMc+4VOftXIGCtuoCBA9PBj/+Itg8bqRCFa5Si38=
=kJ4/
-----END PGP SIGNATURE-----

--UY5t8JEv+jjMAULN--
