From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: powerpc tree build warning
Date: Mon, 24 Aug 2009 10:22:56 +1000
Message-ID: <20090824102256.3e8d69b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__24_Aug_2009_10_22_56_+1000_TsIzUDLM0EdywED="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59624 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750781AbZHXAXF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Aug 2009 20:23:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

--Signature=_Mon__24_Aug_2009_10_22_56_+1000_TsIzUDLM0EdywED=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

kernel/time/tick-sched.c: In function 'tick_nohz_stop_sched_tick':
kernel/time/tick-sched.c:261: warning: format '%02x' expects type 'unsigned=
 int', but argument 2 has type 'long unsigned int'

Introduced by commit 6826a57d1abc8ac9f59b24f1a008554c6560a995 ("powerpc:
Switch to asm-generic/hardirq.h") which changed
irq_cpustat_t::__softirq_pending from "unsigned int" to "unsigned long"
on powerpc.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__24_Aug_2009_10_22_56_+1000_TsIzUDLM0EdywED=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqR3WAACgkQjjKRsyhoI8yuxACdENh3S1MUrabBRkUusT73XveS
BxcAn3kXMNnBe0PxH3H8DiujgkMYbWKA
=SnUD
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Aug_2009_10_22_56_+1000_TsIzUDLM0EdywED=--
