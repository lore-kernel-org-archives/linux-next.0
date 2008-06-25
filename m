From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree
Date: Wed, 25 Jun 2008 10:49:28 +1000
Message-ID: <20080625104928.d26f77fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_10_49_28_+1000_LxXG0EciE8oxb/hn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37618 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751250AbYFYAtn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 20:49:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>

--Signature=_Wed__25_Jun_2008_10_49_28_+1000_LxXG0EciE8oxb/hn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip-core tree got a trivial context
conflicts in arch/x86/xen/enlighten.c, arch/x86/xen/mmu.c and
arch/x86/xen/mmu.h between commit
28499143933f19b28008a556ed59255d6009391a ("xen: remove support for
non-PAE 32-bit") from Linus' tree (and also exists in the tip-core tree)
and commit e2426cf85f8db5891fb5831323d2d0c176c4dadc ("xen: avoid
hypercalls when updating unpinned pud/pmd") from the tip-core tree.

I fixed it up and will carry the fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_10_49_28_+1000_LxXG0EciE8oxb/hn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhlhgACgkQTgG2atn1QN8qmQCgkosVa84px1WvB2kie4MN3oUX
UmEAn3YFZtaj1uKQql4fb3LoDr4/RdTc
=PbMO
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_10_49_28_+1000_LxXG0EciE8oxb/hn--
