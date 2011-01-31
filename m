From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (net and
 tip tree related)
Date: Mon, 31 Jan 2011 17:01:23 +1100
Message-ID: <20110131170123.9ee51a40.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__31_Jan_2011_17_01_23_+1100__m0n40exP0oGnQ0y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54038 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751815Ab1AaGBd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Jan 2011 01:01:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <bhutchings@solarflare.com>, linux-net-drivers@solarflare.com, Tom Herbert <therbert@google.com>

--Signature=_Mon__31_Jan_2011_17_01_23_+1100__m0n40exP0oGnQ0y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (sparc64 defconfig)
failed like this:

kernel/irq/manage.c: In function 'irq_affinity_notify':
kernel/irq/manage.c:182: error: 'struct irq_desc' has no member named 'affi=
nity'

Caused by commit cd7eab44e9946c28d595abe3e9a43e945bc49141 ("genirq: Add
IRQ affinity notifiers").  This build has
CONFIG_GENERIC_HARDIRQS_NO_DEPRECATED=3Dy.

I have just left it broken for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__31_Jan_2011_17_01_23_+1100__m0n40exP0oGnQ0y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNRlAzAAoJEDMEi1NhKgbsVnYIAJq2+t92If/U59zDFsPv8lKx
6wPf404DUYV7AcAb+doQKt4gDqZCatUnrz7dch5cray4P+dKK9DzcCyhbAC/MOU9
Gzk2ylofFWKfiwKMuEPYrMtjneRfRR4qy1BCLBiWP9fbT9AYCo0uZdc/Qe3BMuVI
lfr49Hg3jkde3TnPCiBkP5kcBODN/kzmRLIrgquxNns+kItgTwnP6Y0mHfK7VSjQ
YAoL2TxOXRNpzRVi4gTuHMb4YLAz9FKxwpKvP61E+Dvdw/EozJEQiQtxLOpvMSE1
oD+qie9lHKNEcWjAjhXhVJQmrMLYkBdQqKKl2CDdUKd524IxNOJKIVr4m4218j4=
=H4Kt
-----END PGP SIGNATURE-----

--Signature=_Mon__31_Jan_2011_17_01_23_+1100__m0n40exP0oGnQ0y--
