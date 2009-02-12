From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the  tree
Date: Thu, 12 Feb 2009 16:38:25 +1100
Message-ID: <20090212163825.ec7bcdd0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Feb_2009_16_38_25_+1100_g9QguF7=UYzb/8ak"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36887 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750774AbZBLFig (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Feb 2009 00:38:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>

--Signature=_Thu__12_Feb_2009_16_38_25_+1100_g9QguF7=UYzb/8ak
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got conflicts in
arch/x86/include/asm/pgtable_32.h arch/x86/include/asm/pgtable_64.h
between the unification commits in the x86 tree and commit
5faef0d73631a368f375a5b852e7149f44542670 ("Merge commit 'v2.6.28-rc2'
into kmemcheck") from the kmemcheck tree.

I used the resolution from tip/master.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Feb_2009_16_38_25_+1100_g9QguF7=UYzb/8ak
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmTtdEACgkQjjKRsyhoI8xBHwCeMgs0gBtmLIyAM+yjTDVLmxjy
Fu8AnReR1uwyn5Te35S0GDjksg2Kt/ut
=JX32
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Feb_2009_16_38_25_+1100_g9QguF7=UYzb/8ak--
