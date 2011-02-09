From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rr tree
Date: Wed, 9 Feb 2011 13:01:15 +1100
Message-ID: <20110209130115.f340396e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__9_Feb_2011_13_01_15_+1100_3R4j2E/Ed4RVv.YA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60268 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756171Ab1BICB2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Feb 2011 21:01:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dtor@vmware.com>

--Signature=_Wed__9_Feb_2011_13_01_15_+1100_3R4j2E/Ed4RVv.YA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the rr tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/net/myri10ge/myri10ge.c: In function 'myri10ge_select_firmware':
drivers/net/myri10ge/myri10ge.c:3341: error: request for member 'perm' in s=
omething not a structure or union
drivers/net/myri10ge/myri10ge.c:3341: error: request for member 'perm' in s=
omething not a structure or union
drivers/net/myri10ge/myri10ge.c:3341: error: request for member 'perm' in s=
omething not a structure or union
drivers/net/myri10ge/myri10ge.c:3349: error: request for member 'perm' in s=
omething not a structure or union
drivers/net/myri10ge/myri10ge.c:3349: error: request for member 'perm' in s=
omething not a structure or union
drivers/net/myri10ge/myri10ge.c:3349: error: request for member 'perm' in s=
omething not a structure or union

Caused by commit b3e402b450f954d0a8ec04e05433654d4a9df2a6 ("module: deal
with alignment issues in built-in module parameters") so I have used the
rr tree from next-20110208 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Feb_2011_13_01_15_+1100_3R4j2E/Ed4RVv.YA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNUfVrAAoJEDMEi1NhKgbs72kH/i1xJs8LlC6wkBvHYxhpU0x9
pHalxu1tFHycy1XcB2kgiaxUeA7jeRPwPNnKCTv6ENO0XPf7+08z6dt//2rJrxGy
lTNWDrxzfxcdOkM0sM0WQSfUAz7s9xpV6yL2Okk0V6tnwwiMYr9CPvEL1fKHkxmr
bf7rduEENo6qzPw+5tcaIzw+XybjJ2mg+p2854rxoLv47kOjB94r8JPzrvGnK+xJ
aUMFROWcyKeKnyu9sknFPlQBvQB0WT6FS658HDBRgn/n5UhHktmxOqn6/Ws8nBww
YEnEX29M9COdrJza7ct2TFdOlTnlOVZH3QJEbH8pZKcSGM8snA4GrV8pE6cSP94=
=d4BN
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Feb_2011_13_01_15_+1100_3R4j2E/Ed4RVv.YA--
