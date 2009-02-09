From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree with the x86 tree
Date: Mon, 9 Feb 2009 11:24:53 +1100
Message-ID: <20090209112453.7bb773f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__9_Feb_2009_11_24_53_+1100_P23+BMsN3ED_mt1s"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46998 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754061AbZBIAZD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2009 19:25:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Cyrill Gorcunov <gorcunov@gmail.com>, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>

--Signature=_Mon__9_Feb_2009_11_24_53_+1100_P23+BMsN3ED_mt1s
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip-core tree got a trivial conflict in
arch/x86/include/asm/setup.h between commit
dbca1df48e89d8aa59254fdc10ef16c16e73d94e ("x86: headers cleanup -
setup.h") from the x86 tree and commit
15c554439faedfa490389b31db893dc764245e88 ("headers_check fix: x86,
setup.h") from the tip-core tree.

I fixed it up as in tip/master.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Feb_2009_11_24_53_+1100_P23+BMsN3ED_mt1s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmPd9UACgkQjjKRsyhoI8zcZQCghTUBz0b2JyBwWHRuuDrrRceS
99EAn2b1g4qX4ZHiR+WAtduO7okaK1Jc
=XoeK
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Feb_2009_11_24_53_+1100_P23+BMsN3ED_mt1s--
