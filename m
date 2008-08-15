From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Fri, 15 Aug 2008 13:58:08 +1000
Message-ID: <20080815135808.e10f62dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_13_58_08_+1000_Anm6QtSdnwCU90M/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53346 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752183AbYHOD6S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 23:58:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Arjan van de Ven <arjan@linux.intel.com>

--Signature=_Fri__15_Aug_2008_13_58_08_+1000_Anm6QtSdnwCU90M/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a trivial conflict in
include/asm-x86/pda.h between commit
af9ff7868f0f76d3364351b1641b9dfa99588e77 ("x86: simplify stackprotector
self-check") from the stackprotector tree and commit
77ef50a522717fa040636ee1017179ceba12ff62 ("x86: consolidate header
guards") from the x86 tree.

I fixed it up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_13_58_08_+1000_Anm6QtSdnwCU90M/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkik/tAACgkQjjKRsyhoI8wEbACeJF5JIoiTHrSnlAXS7Uq6cxRF
AHcAoJ0KvuAvMbbNAUl8T0B4LnN3SUN9
=xuFO
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_13_58_08_+1000_Anm6QtSdnwCU90M/--
