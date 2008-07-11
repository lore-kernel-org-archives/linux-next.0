From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Fri, 11 Jul 2008 11:47:29 +1000
Message-ID: <20080711114729.1c0454b2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__11_Jul_2008_11_47_29_+1000_4WpoA0droYk6Wp4m"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56765 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752354AbYGKBri (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jul 2008 21:47:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Glauber Costa <gcosta@redhat.com>, Steven Rostedt <srostedt@redhat.com>

--Signature=_Fri__11_Jul_2008_11_47_29_+1000_4WpoA0droYk6Wp4m
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
arch/x86/lib/Makefile between commit
81d68a96a39844853b37f20cc8282d9b65b78ef3 ("ftrace: trace irq disabled
critical timings") from the ftrace tree and a couple of commits from the
x86 tree.

Just an overlapping addition (from the former) with changes (from the
latter).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__11_Jul_2008_11_47_29_+1000_4WpoA0droYk6Wp4m
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh2u7EACgkQjjKRsyhoI8yZvwCfW0uer8i2/XseLZXbcSmB1Y6C
l0MAoIgd3iJFF6uEcLBBZhsvTec5t43I
=7Tu/
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Jul_2008_11_47_29_+1000_4WpoA0droYk6Wp4m--
