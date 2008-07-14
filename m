From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Mon, 14 Jul 2008 11:30:58 +1000
Message-ID: <20080714113058.916987d3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__14_Jul_2008_11_30_58_+1000_p9qKO3_GC1V+Vexc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55319 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753118AbYGNBbM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 13 Jul 2008 21:31:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__14_Jul_2008_11_30_58_+1000_p9qKO3_GC1V+Vexc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a trivial conflict in
arch/x86/kernel/Makefile between commit
4c7f8900f1d8a0e464e7092f132a7e93f7c20f2f ("x86: stackprotector & PARAVIRT
fix") from the stackprotector tree and commit
3d0decc4f49e8645cd6369b02ed076bebd3d61ad ("x86: fix tsc unification
buglet with ftrace and stackprotector") from the x86 tree.

Just a addition next to a modification.  I can carry the simple fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Jul_2008_11_30_58_+1000_p9qKO3_GC1V+Vexc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh6rFIACgkQjjKRsyhoI8w4BwCfQ50tu9p73+QrNLt9T3cATiC9
oxwAmgJM6Z3p7XmPiT/pWCZmC599obFY
=5k8V
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Jul_2008_11_30_58_+1000_p9qKO3_GC1V+Vexc--
