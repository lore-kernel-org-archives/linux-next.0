From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree
Date: Mon, 21 May 2012 18:54:12 +1000
Message-ID: <20120521185412.aca92107d0a8c4fdd8474e34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__21_May_2012_18_54_12_+1000_CDLgI_7T2Vzorbo="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:43260 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932088Ab2EUIyV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 May 2012 04:54:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__21_May_2012_18_54_12_+1000_CDLgI_7T2Vzorbo=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (i386 defconfig)
failed like this:

Invalid absolute R_386_32 relocation: jiffies

I am not sure what caused this (it may even been a bad merge on my
part).  I have left it broken for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__21_May_2012_18_54_12_+1000_CDLgI_7T2Vzorbo=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPugK0AAoJEECxmPOUX5FEdCEQAIrvxVeFN0CiBl3bGFA3Ca+S
8KgkdTqHiCw7HghAn8nsxWTUl7wm7arTey7BDsW4gQQiHojegJdbMfF+z9kOmiEe
+dGgvlSPAeERiH554K7SZ63xeKhC0JZv24Hzf1smASOCoA54/icUH1QHzghTUoVy
Tq0H/47fuOe20dz8x5kJcXPH68eDDQmeCcLw0odyDA10bpYifiVdR9LrXxXDJJTA
5+Cro0xUyKqd7vHxf08C/lJJlc3USieuQKO4Ojo7sWsTM6Orv6nWqrHgWfS5pOvr
d2uNWJSlH3oLWvLN2N/t8fb+jftktai6Fv51dAC8yKqKlPkvxevuR1g5ticpe7QL
WvC8yHmNbOHw8rWKMToEHR3inIjsSTHrkBUUr5oGhz6Ddx911r4vzCH6d4lO85mY
6Zdm2rg1mK7iu2byZj+WI0exCN5jEWMua24Ulyb6xVISXEq6+UyRU1Gpc1G830IL
3s5vDCvO41IBMaBF+oWg3LglR784DlBI0OYdK4AKbtPILnwFnNkXxCAWfigeAhpF
A8AHcaMGzh4XXyz0cPQ3/G890F4GhrsESEfN12e6ozHaP/I3zlXwynvUqMJmEOBT
jwJ2egR3akLIZPx36zugUk9xSZ+8d+sJuEPG3R3S7tZjw62yvBoAXvsVjlBdKJoR
Ki/ucNNX4v7IR9Xia/ez
=+IUC
-----END PGP SIGNATURE-----

--Signature=_Mon__21_May_2012_18_54_12_+1000_CDLgI_7T2Vzorbo=--
