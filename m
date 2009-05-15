From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: asm-generic tree build failure
Date: Fri, 15 May 2009 14:18:53 +1000
Message-ID: <20090515141853.59d2019b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_May_2009_14_18_53_+1000_Za0AQ7XZpY8mhXWc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48183 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751152AbZEOETD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 May 2009 00:19:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, Remis Lima Baima <remis.developer@googlemail.com>

--Signature=_Fri__15_May_2009_14_18_53_+1000_Za0AQ7XZpY8mhXWc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

Today's linux-next build (powerpc_allnoconfig) failed like this:

arch/powerpc/mm/tlb_hash32.c:65: error: expected declaration specifiers or =
'...' before '(' token
arch/powerpc/mm/tlb_hash32.c: In function 'flush_tlb_mm':
arch/powerpc/mm/tlb_hash32.c:66: error: number of arguments doesn't match p=
rototype
arch/powerpc/include/asm/tlbflush.h:57: error: prototype declaration
arch/powerpc/mm/tlb_hash32.c: At top level:
arch/powerpc/mm/tlb_hash32.c:145: error: redefinition of 'flush_tlb_mm'
arch/powerpc/mm/tlb_hash32.c:65: note: previous definition of 'flush_tlb_mm=
' was here

Caused by commit f8089f1f5eaf4925b0925e69cd311d7d1d423e6a ("asm-generic:
Add missing generic tlb_flush definition").

I have dropped the asm-generic tree for today (since I have no earlier
version).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_May_2009_14_18_53_+1000_Za0AQ7XZpY8mhXWc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoM7S0ACgkQjjKRsyhoI8zRXgCgjklaRgb7fWCoCy3bbY9jKpKU
leUAoKRJa99/qZJydIOARKHj1VQ58Gxr
=slrW
-----END PGP SIGNATURE-----

--Signature=_Fri__15_May_2009_14_18_53_+1000_Za0AQ7XZpY8mhXWc--
