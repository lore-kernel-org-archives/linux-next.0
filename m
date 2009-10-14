From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kbuild tree build failure
Date: Wed, 14 Oct 2009 12:20:24 +1100
Message-ID: <20091014122024.f5fa52a2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__14_Oct_2009_12_20_24_+1100_Yz=1RTD15DFE9qrN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36273 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751373AbZJNBVK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2009 21:21:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Arnaldo Carvalho de Melo <acme@redhat.com>

--Signature=_Wed__14_Oct_2009_12_20_24_+1100_Yz=1RTD15DFE9qrN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Today's linux-next build (x86_64 allmodconfig) failed like this:

In file included from arch/x86/kernel/syscall_64.c:28:
arch/x86/include/asm/unistd_64.h:665: error: array index in initializer exc=
eeds array bounds
arch/x86/include/asm/unistd_64.h:665: error: (near initialization for 'sys_=
call_table')
arch/x86/include/asm/unistd_64.h:665: warning: excess elements in array ini=
tializer
arch/x86/include/asm/unistd_64.h:665: warning: (near initialization for 'sy=
s_call_table')

Exposed by commit a2e2725541fad72416326798c2d7fa4dafb7d337 ("net:
Introduce recvmmsg socket syscall").  include/asm/asm-offsets.h did not
get updated even though arch/x86/kernel/asm-offsets.s did.  Ah,
generated/asm-offsets.h has been updated but my build tree still has the
(generated in a previous build) include/asm/asm-offsets.h which is
presumably found before the new arch/x86/include/asm/asm-offsets.h
introduced by commit fe5ff47a5d79ca99ec7e3155eb19469b44905b2c ("kbuild:
move asm-offsets.h to include/generated").

Sam, can you think of a better migration path?

I removed include/asm/asm_offsets.h from my object tree and everything
builds ok.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__14_Oct_2009_12_20_24_+1100_Yz=1RTD15DFE9qrN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrVJ1gACgkQjjKRsyhoI8xV1QCdGTIB5hpulTSyMdnUvY4IVJQd
LHMAoLTeBWSV9SXNRpKBA4bSJvywsjKb
=w0HK
-----END PGP SIGNATURE-----

--Signature=_Wed__14_Oct_2009_12_20_24_+1100_Yz=1RTD15DFE9qrN--
