From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree
Date: Mon, 7 Jul 2008 13:15:38 +1000
Message-ID: <20080707131538.25a05c1c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_13_15_38_+1000_PpC.7VFV/k6hhKwb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38621 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751056AbYGGDPu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Jul 2008 23:15:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Arjan van de Ven <arjan@linux.intel.com>

--Signature=_Mon__7_Jul_2008_13_15_38_+1000_PpC.7VFV/k6hhKwb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip-core tree got a trivial conflict in
kernel/softlockup.c between commit
3b7253238801a7b97b3929d8db2fa7a0721fb17b ("softlockup: print a module
list on being stuck") from Linus' tree (which also exists in the tip-core
tree) and commit 8d5be7f4e8515af461cbc8f07687ccc81507d508 ("softlockup:
show irqtrace") from the tip-core tree.

It is just tha the latter change modifies the section of code modified by
the former.  I fixed it up and can carry the fix.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_13_15_38_+1000_PpC.7VFV/k6hhKwb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhxiloACgkQjjKRsyhoI8wy9QCdGPhgbfA2kDvJUpHaZ6vllnXP
7l0AoIlKaULY26zuJuC0IUwnXF/slOVU
=y1ip
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_13_15_38_+1000_PpC.7VFV/k6hhKwb--
