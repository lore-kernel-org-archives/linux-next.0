From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree
Date: Tue, 14 Oct 2008 13:27:45 +1100
Message-ID: <20081014132745.051f6418.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_13_27_45_+1100_d6+nD9zlUY+P3TKg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40603 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755512AbYJNC16 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 22:27:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Felipe Balbi <felipe.balbi@nokia.com>, Wim Van Sebroeck <wim@iguana.be>, Syed Mohammed Khasim <khasim@ti.com>, Tony Lindgren <tony@atomide.com>

--Signature=_Tue__14_Oct_2008_13_27_45_+1100_d6+nD9zlUY+P3TKg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/plat-omap/devices.c between commit
2817142f31bfbf26c216bf4f9192540c81b2d071 ("[WATCHDOG] omap_wdt.c: sync
linux-omap changes") from Linus' tree and commit
cc26b3b01bc96a8b8c36671b0dc4898b2a152ea8 ("ARM: OMAP3: Add minimal
omap3430 support") from the arm tree.

The former removed code that the latter modified.  I fixed it up
by just removing the section of code as the former patch seems to take
account of what the latter is trying to do (but it may not be correct).
You can fix it by merging Linus' tree and doing this or a similar (maybe
correct) fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/


--Signature=_Tue__14_Oct_2008_13_27_45_+1100_d6+nD9zlUY+P3TKg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0A6EACgkQjjKRsyhoI8wp4gCdFB2eRhT0Gmro2WaXdaGN+fYM
ygwAoKz7XRZrUZejb8LcsxuU1wOnuAqn
=X154
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_13_27_45_+1100_d6+nD9zlUY+P3TKg--
