From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Wed, 9 Jul 2008 13:13:07 +1000
Message-ID: <20080709131307.dae1e74a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__9_Jul_2008_13_13_07_+1000_GTgQUhUIFOag6.1V"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43623 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752902AbYGIDNO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 23:13:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Zhao Yakui <yakui.zhao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>

--Signature=_Wed__9_Jul_2008_13_13_07_+1000_GTgQUhUIFOag6.1V
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
arch/x86/kernel/process.c between commit
aa276e1cafb3ce9d01d1e837bcd67e92616013ac ("x86, clockevents: add C1E
aware idle function") from the x86 tree and commits
dbce8340e4549b612ac74fc7175721f9aed67b62 ("ACPI: Create "idle=3Dhalt"
bootparam") from the acpi tree.

Just a case of overlapping additions.  I did the obvious fixup and can
carry it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Jul_2008_13_13_07_+1000_GTgQUhUIFOag6.1V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh0LMMACgkQjjKRsyhoI8x2SwCgntOvdJRuZFh7/W2g9H8vqX1g
5jkAn3OvPunXOrQXF4NqBLxAIV9LO5ky
=soKV
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Jul_2008_13_13_07_+1000_GTgQUhUIFOag6.1V--
