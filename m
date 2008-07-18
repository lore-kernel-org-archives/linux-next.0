From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Fri, 18 Jul 2008 12:29:16 +1000
Message-ID: <20080718122916.605d0cd2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_12_29_16_+1000_KWNptTOWIREMy42M"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39335 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752012AbYGRC3X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 22:29:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__18_Jul_2008_12_29_16_+1000_KWNptTOWIREMy42M
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a trivial conflict in
include/asm-x86/pci-direct.h between commit
e3f2baebf4209b5927e23fa65d5977d31db936b3 ("PCI/x86: early dump pci conf
space v2") from Linus' tree and commit
aa27f95867447916d97c7aa6e5422ff6518630dd ("x86: consolidate header
guards") from the x86 tree.

Just a simple add/modify overlap.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_12_29_16_+1000_KWNptTOWIREMy42M
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh///wACgkQjjKRsyhoI8yZHQCgm+1WY/VWmlJL7YobzVIm+Mtc
x3oAmwY3ss3EJRqywrkWQdsaB0sD0wNh
=o7lp
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_12_29_16_+1000_KWNptTOWIREMy42M--
