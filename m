From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build warning
Date: Thu, 11 Jun 2009 11:27:46 +1000
Message-ID: <20090611112746.802a24cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Jun_2009_11_27_46_+1000_Yhg6R19VrnqtYfHQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43024 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751504AbZFKB1v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 21:27:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Herrmann <andreas.herrmann3@amd.com>

--Signature=_Thu__11_Jun_2009_11_27_46_+1000_Yhg6R19VrnqtYfHQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

arch/x86/mm/memtest.c: In function 'memtest':
arch/x86/mm/memtest.c:56: warning: comparison of distinct pointer types lac=
ks a cast
arch/x86/mm/memtest.c:58: warning: comparison of distinct pointer types lac=
ks a cast

Introduced by commit c9690998ef48ffefeccb91c70a7739eebdea57f9 ("x86:
memtest: remove 64-bit division").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Jun_2009_11_27_46_+1000_Yhg6R19VrnqtYfHQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkowXZIACgkQjjKRsyhoI8yXVgCglhw1kGQD5ntjiUt50BwtEHV2
LGgAnRi3hXqCFTZWoKI0knwqj1r0A5/S
=Yd11
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Jun_2009_11_27_46_+1000_Yhg6R19VrnqtYfHQ--
