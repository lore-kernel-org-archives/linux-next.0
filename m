From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the blackfin and x86
 trees
Date: Fri, 6 Mar 2009 15:37:59 +1100
Message-ID: <20090306153759.c8c6b470.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Mar_2009_15_37_59_+1100_y2YEonX=.hSlBG8O"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49150 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753652AbZCFEiG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 23:38:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Bryan Wu <cooloney.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__6_Mar_2009_15_37_59_+1100_y2YEonX=.hSlBG8O
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree added conflicts in
arch/blackfin/kernel/ipipe.c and arch/x86/mach-voyager/setup.c.  I didn't
bother to work out exactly what is conflicting because I dropped the rr
tree due to the build failures that I assume are still present from
yesterday.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Mar_2009_15_37_59_+1100_y2YEonX=.hSlBG8O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmwqKcACgkQjjKRsyhoI8zlpgCgm/4oAX/aY/eL8eCO7lQGwSdG
o/sAnA9jUQh/iqIWm6W86Ye4v5Nmn3ea
=bcDN
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Mar_2009_15_37_59_+1100_y2YEonX=.hSlBG8O--
