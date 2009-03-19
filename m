From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: s390 build failure
Date: Fri, 20 Mar 2009 10:42:08 +1100
Message-ID: <20090320104208.0cb4b2b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Mar_2009_10_42_08_+1100_KIX1SvfJl6mDP+lD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59320 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754845AbZCSXmQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 19:42:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__20_Mar_2009_10_42_08_+1100_KIX1SvfJl6mDP+lD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

The linux-next build for s390 allnoconfig failed like this:

In file included from arch/s390/include/asm/tlb.h:29,
                 from arch/s390/mm/pgtable.c:25:
arch/s390/include/asm/smp.h:95: error: redefinition of 'smp_send_stop'
include/linux/smp.h:125: error: previous definition of 'smp_send_stop' was =
here

Caused by commit d1dedb52acd98bd5e13e1ff4c4d045d58bbd16fe ("panic, smp:
provide smp_send_stop() wrapper on UP too") from the tip-core tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Mar_2009_10_42_08_+1100_KIX1SvfJl6mDP+lD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknC2FAACgkQjjKRsyhoI8w4vgCffYCrsl/TRVMoSu+FbDL3wdB4
S2kAn1pzzzaagjSn1E1U2/chAI6rik58
=Z0AT
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Mar_2009_10_42_08_+1100_KIX1SvfJl6mDP+lD--
