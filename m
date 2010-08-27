From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 27 Aug 2010 11:59:50 +1000
Message-ID: <20100827115950.dd942b90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Aug_2010_11_59_50_+1000_S__Bne9c=aGu_jws"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42568 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754756Ab0H0B75 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Aug 2010 21:59:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

--Signature=_Fri__27_Aug_2010_11_59_50_+1000_S__Bne9c=aGu_jws
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

After merging the drivers-x86 tree, today's linux-next build (powerpc
ppc64_defconfig and x86_64 allmodconfig) produced this warning:

drivers/video/backlight/Kconfig:117:error: recursive dependency detected!
drivers/video/backlight/Kconfig:117:	symbol BACKLIGHT_CLASS_DEVICE is selec=
ted by ACPI_TOSHIBA
drivers/platform/x86/Kconfig:490:	symbol ACPI_TOSHIBA depends on LEDS_CLASS
drivers/leds/Kconfig:12:	symbol LEDS_CLASS is selected by BACKLIGHT_ADP8860
drivers/video/backlight/Kconfig:285:	symbol BACKLIGHT_ADP8860 depends on BA=
CKLIGHT_CLASS_DEVICE

Introduced by commit af7ad65329f59cdfdd564ec26148160ed42a8b70
("toshiba-acpi - switch to using sparse keymap")
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Aug_2010_11_59_50_+1000_S__Bne9c=aGu_jws
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMdxwWAAoJEDMEi1NhKgbsRE8H/3giqHSaGCnh/ztb+ZpUqp/m
008ZN+vkE8ZhAQ1FuJv1IqDGK6wgWqa3UXQFsyoiToLTO7oZO5AkXAAcUH8bFc+P
YpT/S/lcYoPs+dDh0ufm4Ev59hyOYv3Y8x/40d+nvoQGixk1j9apOSLrcGvKyl8i
HEPl0FdsJnVQiIcRVa4HvADsyzaijf6BIQcFbRD8QGbRB+j9QOb8UXw0auXS79DQ
gehr61ZBcwpu+AVIkl2crPQssAE7fkSKlWWJ/FqHRMez1PsFXnKdpAV9cOU7b0FH
7kAblb5d5J6IfLF0YRHfXVFb9S7XH1z+FPiy+4hAiZKTDzhqRvfTTI7m4mdTv0g=
=SOxd
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Aug_2010_11_59_50_+1000_S__Bne9c=aGu_jws--
