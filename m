From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Wed, 23 Jul 2008 17:17:43 +1000
Message-ID: <20080723171743.1436cf2a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Jul_2008_17_17_43_+1000_yyXBe.4OkHaIj0ht"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57154 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750996AbYGWHRu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 03:17:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

--Signature=_Wed__23_Jul_2008_17_17_43_+1000_yyXBe.4OkHaIj0ht
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next build (m68k defconfig) failed like this:

drivers/char/vme_scc.c:186: error: 'struct gs_port' has no member named 'op=
en_wait'
drivers/char/vme_scc.c:187: error: 'struct gs_port' has no member named 'cl=
ose_wait'
drivers/char/vme_scc.c:425: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:456: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:503: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:515: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:516: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:525: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:526: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:530: error: 'struct gs_port' has no member named 'fl=
ags'
drivers/char/vme_scc.c:532: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:533: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:553: error: 'struct gs_port' has no member named 'fl=
ags'
drivers/char/vme_scc.c:556: error: 'struct gs_port' has no member named 'op=
en_wait'
drivers/char/vme_scc.c:559: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:560: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:581: error: 'struct gs_port' has no member named 'fl=
ags'
drivers/char/vme_scc.c:639: error: 'struct gs_port' has no member named 'fl=
ags'
drivers/char/vme_scc.c:640: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:640: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:655: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:655: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:662: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:681: error: 'struct gs_port' has no member named 'fl=
ags'
drivers/char/vme_scc.c:683: error: 'struct gs_port' has no member named 'fl=
ags'
drivers/char/vme_scc.c:859: error: 'struct gs_port' has no member named 'fl=
ags'
drivers/char/vme_scc.c:883: error: 'struct gs_port' has no member named 'tt=
y'
drivers/char/vme_scc.c:884: error: 'struct gs_port' has no member named 'co=
unt'
drivers/char/vme_scc.c:887: error: 'struct gs_port' has no member named 'co=
unt'
drivers/char/vme_scc.c:890: error: 'struct gs_port' has no member named 'fl=
ags'
drivers/char/vme_scc.c:894: error: 'struct gs_port' has no member named 'co=
unt'
drivers/char/ser_a2232.c:195: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:229: error: 'struct gs_port' has no member named '=
flags'
drivers/char/ser_a2232.c:245: error: 'struct gs_port' has no member named '=
flags'
drivers/char/ser_a2232.c:279: error: 'struct gs_port' has no member named '=
flags'
drivers/char/ser_a2232.c:281: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:281: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:312: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:312: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:348: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:385: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:403: error: 'struct gs_port' has no member named '=
flags'
drivers/char/ser_a2232.c:405: error: 'struct gs_port' has no member named '=
flags'
drivers/char/ser_a2232.c:485: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:486: error: 'struct gs_port' has no member named '=
count'
drivers/char/ser_a2232.c:489: error: 'struct gs_port' has no member named '=
count'
drivers/char/ser_a2232.c:492: error: 'struct gs_port' has no member named '=
flags'
drivers/char/ser_a2232.c:496: error: 'struct gs_port' has no member named '=
count'
drivers/char/ser_a2232.c:525: error: 'struct gs_port' has no member named '=
flags'
drivers/char/ser_a2232.c:580: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:581: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:595: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:596: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:616: error: 'struct gs_port' has no member named '=
flags'
drivers/char/ser_a2232.c:621: error: 'struct gs_port' has no member named '=
open_wait'
drivers/char/ser_a2232.c:624: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:625: error: 'struct gs_port' has no member named '=
tty'
drivers/char/ser_a2232.c:658: error: 'struct gs_port' has no member named '=
open_wait'
drivers/char/ser_a2232.c:659: error: 'struct gs_port' has no member named '=
close_wait'

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Jul_2008_17_17_43_+1000_yyXBe.4OkHaIj0ht
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiG2xcACgkQjjKRsyhoI8z4KACfdl2/alRU/JpZDfczyBFCjosk
rXsAn3faoEuvOz2b/adQMh9tRgqS5+Rv
=p3Ib
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Jul_2008_17_17_43_+1000_yyXBe.4OkHaIj0ht--
