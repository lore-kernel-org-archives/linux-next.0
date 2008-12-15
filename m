From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the boot-params tree
Date: Tue, 16 Dec 2008 00:21:07 +1100
Message-ID: <20081216002107.8082e98e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Dec_2008_00_21_07_+1100_bJI=KEo=r93_Rk62"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45749 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751392AbYLONVN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 08:21:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>

--Signature=_Tue__16_Dec_2008_00_21_07_+1100_bJI=KEo=r93_Rk62
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the boot-params tree got a conflict in
arch/sh/boards/mach-migor/setup.c between commit
2f75cd4d60aa955f983134f7ceb656b1b8cb8c30 ("sh: mach-migor: Kill off
unused Migo-R machvec") from the sh tree and commit
0de5c2d9f02d2018fd671ca1015432dffa5eb338 ("param:
arch_get_boot_command_line()") from the boot-params tree.

The former removes the code that the latter modified.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Dec_2008_00_21_07_+1100_bJI=KEo=r93_Rk62
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklGWcMACgkQjjKRsyhoI8y8NgCfXJ10FN1vcVLmvQJW5LBVjU5H
xZsAn1rTkq4kesh0FuJSQlfjmRPr2vvF
=TmZB
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Dec_2008_00_21_07_+1100_bJI=KEo=r93_Rk62--
