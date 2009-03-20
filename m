From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sh build failure
Date: Fri, 20 Mar 2009 11:06:02 +1100
Message-ID: <20090320110602.86351a91.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Mar_2009_11_06_02_+1100_OgNDYmku6cyG1qP_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56313 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751708AbZCTAGJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 20:06:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__20_Mar_2009_11_06_02_+1100_OgNDYmku6cyG1qP_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Yesterday's linux-next build of sh allmodconfig failed like this:

kernel/built-in.o: In function `disable_all_kprobes':
kernel/kprobes.c:1382: undefined reference to `text_mutex'
kernel/built-in.o: In function `__unregister_kprobe_top':
kernel/kprobes.c:773: undefined reference to `text_mutex'
kernel/built-in.o: In function `register_kprobe':
kernel/kprobes.c:724: undefined reference to `text_mutex'

Introduced by commit 4460fdad85becd569f11501ad5b91814814335ff ("tracing,
Text Edit Lock - kprobes architecture independent support") from the
tracing tree.  text_mutex is defined in mm/memory.c which is only built
if CONFIG_MMU is defined, which is not true for sh allmodconfig.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Mar_2009_11_06_02_+1100_OgNDYmku6cyG1qP_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknC3eoACgkQjjKRsyhoI8zxhQCeKToiCXTYT3uLTQ5gwMBTtEos
nlIAnAi/kkwyCneUiXUSL99D/arGEY3D
=W6rZ
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Mar_2009_11_06_02_+1100_OgNDYmku6cyG1qP_--
