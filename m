From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Thu, 16 Oct 2008 11:35:31 +1100
Message-ID: <20081016113531.c2f6b79c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Oct_2008_11_35_31_+1100_wQ=Lvp76QiyWvc=J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41333 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752509AbYJPAfo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 20:35:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ralf Baechle <ralf@linux-mips.org>

--Signature=_Thu__16_Oct_2008_11_35_31_+1100_wQ=Lvp76QiyWvc=J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/rtc/rtc-m48t35.c: In function 'm48t35_read_time':
drivers/rtc/rtc-m48t35.c:59: error: implicit declaration of function 'readb'
drivers/rtc/rtc-m48t35.c:60: error: implicit declaration of function 'write=
b'
drivers/rtc/rtc-m48t35.c: In function 'm48t35_probe':
drivers/rtc/rtc-m48t35.c:168: error: implicit declaration of function 'iore=
map'
drivers/rtc/rtc-m48t35.c:168: warning: assignment makes pointer from intege=
r without a cast
drivers/rtc/rtc-m48t35.c:188: error: implicit declaration of function 'ioun=
map'

Caused by commit d1dbd82e2ff02181a7102088a9fe83e17ddbcb47 ("RTC: M48T35:
new RTC driver") which also presumably should depend on some architecture
or feature.

I have reverted it for now.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Oct_2008_11_35_31_+1100_wQ=Lvp76QiyWvc=J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj2jFMACgkQjjKRsyhoI8xy/gCdHX8l09Ou87J5A83rBAZqWuKV
F1IAoIQ+imLdrOFT5W5+0kvGet2MFDrH
=rw/c
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Oct_2008_11_35_31_+1100_wQ=Lvp76QiyWvc=J--
