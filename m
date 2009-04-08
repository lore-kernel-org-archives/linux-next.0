From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Wed, 8 Apr 2009 10:10:32 +1000
Message-ID: <20090408101032.75afd7af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Apr_2009_10_10_32_+1000_kwpSavlbI9d0X+3o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34420 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757211AbZDHAKi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2009 20:10:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Christian Pellegrin <chripell@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Wed__8_Apr_2009_10_10_32_+1000_kwpSavlbI9d0X+3o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next build (x86_64 allmodconfig) failed like this:

make[3]: *** No rule to make target `drivers/serial/max3100.c', needed by `=
drivers/serial/max3100.o'.  Stop.

The commit 1dcb884ca8048efb4ce2999d367c26369ab2227c ("Add support for the
MAX3100 SPI UART.") added everything except the file above.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Apr_2009_10_10_32_+1000_kwpSavlbI9d0X+3o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknb63gACgkQjjKRsyhoI8yyagCcCzjURscJhT/PBR3T+fAi+uKB
tTQAnjcr+ewGrImFpIjzPamCLiUevA/G
=JVc0
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Apr_2009_10_10_32_+1000_kwpSavlbI9d0X+3o--
