From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Fri, 11 Jul 2008 16:32:58 +1000
Message-ID: <20080711163258.1c926c9c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__11_Jul_2008_16_32_58_+1000_v7m.oU5GFpWGu0bU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34796 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752488AbYGKGdM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 02:33:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>

--Signature=_Fri__11_Jul_2008_16_32_58_+1000_v7m.oU5GFpWGu0bU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/kernel/traps_64.c between commit
badc76527f7e29302f0bde3d366c59101fb2ab87 ("x86: traps_xx: shuffle headers
and globals") from the x86 tree and commit
862849a36e6087faac6349de0b1bcc66ff98411b ("x86: add hooks for kmemcheck
on x86_64") from the kmemcheck tree.

Just overlapping shuffling and adding of include files.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__11_Jul_2008_16_32_58_+1000_v7m.oU5GFpWGu0bU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh2/poACgkQjjKRsyhoI8yq3wCfTsNGyN/2GmAXOQqaIAJK3L0S
CkgAnR/XqfFywxsUPVIAoQfgnNw+GMvL
=I0oS
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Jul_2008_16_32_58_+1000_v7m.oU5GFpWGu0bU--
