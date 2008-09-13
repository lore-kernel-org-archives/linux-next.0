From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tip-core build failure
Date: Sat, 13 Sep 2008 11:14:23 +1000
Message-ID: <20080913111423.981554c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__13_Sep_2008_11_14_23_+1000_p1mM4BXRKXQ_Nh8X"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43366 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751462AbYIMBOk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 21:14:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Rui Sousa <rui.p.m.sousa@gmail.com>

--Signature=_Sat__13_Sep_2008_11_14_23_+1000_p1mM4BXRKXQ_Nh8X
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next build (powerpc allnoconfig) failed like this:

In file included from arch/powerpc/include/asm/system.h:8,
                 from include/linux/list.h:7,
                 from include/linux/signal.h:8,
                 from arch/powerpc/kernel/asm-offsets.c:16:
include/linux/irqflags.h:89:1: warning: "local_irq_save" redefined
In file included from arch/powerpc/include/asm/irqflags.h:11,
                 from include/linux/irqflags.h:55,
                 from arch/powerpc/include/asm/system.h:8,
                 from include/linux/list.h:7,
                 from include/linux/signal.h:8,
                 from arch/powerpc/kernel/asm-offsets.c:16:
arch/powerpc/include/asm/hw_irq.h:115:1: warning: this is the location of t=
he previous definition

And it went downhill from there.

Introduced by commit bd8fbdee6562ee526f3c2582a3b373ef195015dd ("lockdep:
fix compilation when CONFIG_TRACE_IRQFLAGS_SUPPORT is not set") which I
have reverted.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__13_Sep_2008_11_14_23_+1000_p1mM4BXRKXQ_Nh8X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjLE+8ACgkQjjKRsyhoI8zGqgCgiRSUITF0wKpjsFcx0N5L4Q2q
T+0AnjBodcuPplSDBLUeK/4v9tkcde2j
=IyV5
-----END PGP SIGNATURE-----

--Signature=_Sat__13_Sep_2008_11_14_23_+1000_p1mM4BXRKXQ_Nh8X--
