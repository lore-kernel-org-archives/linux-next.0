From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merg of x86 tree
Date: Fri, 13 Jun 2008 13:32:40 +1000
Message-ID: <20080613133240.b8e527b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Jun_2008_13_32_40_+1000_khhU9kIHC4CtJE9G"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56676 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757486AbYFMDcs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 23:32:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__13_Jun_2008_13_32_40_+1000_khhU9kIHC4CtJE9G
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict involving these
commits:

0b6a39f7ebcb1c82587ce35b401c513eed41ac5c ("Revert "x86: fix ioapic bug agai=
n"") from Linus' tree
b61d37f073055f838b03c4ad5683a4d05bb95fbf ("Revert "x86: fix ioapic bug agai=
n"") from the x86 tree
b697c77b2ce6f526abbe749afec51666b6a69f45 ("Revert "Revert "x86: fix ioapic =
bug again""") from the x86 tree
4b151813a40a968fce405ee561a321bea23f459c ("x86: I/O APIC: remove parameters=
 to fiddle with the 8259A") from the x86 tree

I simply used the version of the file in the x86 tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jun_2008_13_32_40_+1000_khhU9kIHC4CtJE9G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhR6lgACgkQTgG2atn1QN9EbwCfZ4yC1h3NmsnCAPiNW0pQzAT3
dLkAnieEr9BXFI2C0PygG9xhcaldKm1k
=PpPo
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jun_2008_13_32_40_+1000_khhU9kIHC4CtJE9G--
