From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparseirq tree build failure
Date: Mon, 25 Aug 2008 19:50:24 +1000
Message-ID: <20080825195024.d42b72e6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Aug_2008_19_50_24_+1000_3J4WAEgY3F=nh4fE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48294 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753834AbYHYJuc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 05:50:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>

--Signature=_Mon__25_Aug_2008_19_50_24_+1000_3J4WAEgY3F=nh4fE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/platforms/cell/interrupt.c: In function 'handle_iic_irq':
arch/powerpc/platforms/cell/interrupt.c:257: error: 'struct kernel_stat' ha=
s no member named 'irqs'
arch/powerpc/kernel/irq.c: In function 'show_interrupts':
arch/powerpc/kernel/irq.c:193: error: 'struct kernel_stat' has no member na=
med 'irqs'

Presumably introduced by commit fb6dc57946f9ebfeac546dd0698d9f065c191668
("x86: move kstat_irqs from kstat to irq_desc").

Looks like there is more work here ...

Its late, so I just dropped the whole tree for today.  We can try again
tomorrow.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Aug_2008_19_50_24_+1000_3J4WAEgY3F=nh4fE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiygGAACgkQjjKRsyhoI8x72QCdG6DNr5CASoxKJDjim7K5j2Kc
0ncAoLEz81QcV8C8BmwbiEx3yOx7/jq8
=MP5W
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Aug_2008_19_50_24_+1000_3J4WAEgY3F=nh4fE--
