From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: x86 tree build warning
Date: Fri, 6 Mar 2009 11:47:44 +1100
Message-ID: <20090306114744.faf153c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Mar_2009_11_47_44_+1100_AMAXIG9CHwA2.WcT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52866 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751149AbZCFArw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 19:47:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Cyrill Gorcunov <gorcunov@gmail.com>

--Signature=_Fri__6_Mar_2009_11_47_44_+1100_AMAXIG9CHwA2.WcT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

In file included from drivers/char/epca.c:49:
drivers/char/digiFep1.h:7:1: warning: "GLOBAL" redefined
In file included from include/linux/linkage.h:5,
                 from include/linux/kernel.h:11,
                 from arch/x86/include/asm/system.h:10,
                 from arch/x86/include/asm/processor.h:17,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from drivers/char/epca.c:29:
arch/x86/include/asm/linkage.h:55:1: warning: this is the location of the p=
revious definition

Probably introduced by commit 95695547a7db44b88a7ee36cf5df188de267e99e
("x86: asm linkage - introduce GLOBAL macro") from the x86 tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Mar_2009_11_47_44_+1100_AMAXIG9CHwA2.WcT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmwcrAACgkQjjKRsyhoI8weOACggXpOo1u2e0bUWl0uMaWeHqdP
TJUAn3hGagEggXR9ptjjx5x8cqNgGf0l
=A+S0
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Mar_2009_11_47_44_+1100_AMAXIG9CHwA2.WcT--
