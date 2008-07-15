From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Tue, 15 Jul 2008 12:26:03 +1000
Message-ID: <20080715122603.c8c4cf33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__15_Jul_2008_12_26_03_+1000_Nmg2MIqUzdN_50UX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43167 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751394AbYGOC0P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Jul 2008 22:26:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>

--Signature=_Tue__15_Jul_2008_12_26_03_+1000_Nmg2MIqUzdN_50UX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflicts in
arch/x86/kernel/cpu/amd_64.c, arch/x86/mm/pageattr.c, arch/x86/mm/pat.c
and arch/x86/pci/i386.c between commit
965194c15dc9e4f3bc44432b39c441c86af7f11d ("x86: max_low_pfn_mapped fix,
#2") from Linus' tree and commit ea3abad8a2dd30263c3b7b4c8ae9ccdc35c86244
("Revert "x86: introduce max_low_pfn_mapped for 64-bit"") from the x86
tree.

I reverted the x86 tree commit which may not be correct.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__15_Jul_2008_12_26_03_+1000_Nmg2MIqUzdN_50UX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh8CrsACgkQjjKRsyhoI8xMAQCeJeF/OhnLfgvE1s5cTqBrvB43
HH0AniXOkPm5NwESnp1bxyNvfDsIwPt8
=EF9y
-----END PGP SIGNATURE-----

--Signature=_Tue__15_Jul_2008_12_26_03_+1000_Nmg2MIqUzdN_50UX--
