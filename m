From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Wed, 25 Jun 2008 12:28:29 +1000
Message-ID: <20080625122829.88386973.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_12_28_29_+1000_qLFxB=pS9iuYZ.B6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36797 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754515AbYFYC2v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 22:28:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__25_Jun_2008_12_28_29_+1000_qLFxB=pS9iuYZ.B6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a trivial context conflict
in arch/x86/kernel/entry_32.S between commit
9b7dc567d03d74a1fbae84e88949b6a60d922d82 ("x86: unify interrupt vector
defines") from the x86 tree and commit
395a59d0f8e86bb39cd700c3d185d30c670bb958 ("ftrace: store mcount address
in rec->ip") from the ftrace tree.

I just took both changes to the includes.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_12_28_29_+1000_qLFxB=pS9iuYZ.B6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhrU0ACgkQTgG2atn1QN8IeQCeJGsqJSrLsUeOiX74lbAPC43h
0SgAnjfOols6byU5bMlzXVMlTPvWqtyZ
=oFZm
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_12_28_29_+1000_qLFxB=pS9iuYZ.B6--
