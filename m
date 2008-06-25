From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Wed, 25 Jun 2008 14:13:11 +1000
Message-ID: <20080625141311.7132d5fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_14_13_11_+1000_TMskS65eo093yLOQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42351 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750930AbYFYENX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 00:13:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__25_Jun_2008_14_13_11_+1000_TMskS65eo093yLOQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a trivial conflict in
arch/x86/kernel/process.c between commit
8750bf598db6a0ea3475d1cf8da922b325941e12 ("x86: add C1E aware idle
function") from the x86 tree and commit
5ffc8862cc917ae5107049f3c5fd549fb6c19cac ("ACPI : Create "idle=3Dnomwait"
bootparam") from the acpi tree.

It was just a case of overlapping additions of includes.  So I took both.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_14_13_11_+1000_TMskS65eo093yLOQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhhxdcACgkQTgG2atn1QN/F1gCfZkb61uWlZeBSsKIHez/ZPW6V
MzMAn047YUxWjZRbByKLvZDaeZj8EUNm
=ajsC
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_14_13_11_+1000_TMskS65eo093yLOQ--
