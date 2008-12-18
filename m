From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the boot-params tree
Date: Thu, 18 Dec 2008 20:35:07 +1100
Message-ID: <20081218203507.572c455d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__18_Dec_2008_20_35_07_+1100_zU3+Sn_XIf2m=Qac"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57185 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751996AbYLRJfQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Dec 2008 04:35:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>

--Signature=_Thu__18_Dec_2008_20_35_07_+1100_zU3+Sn_XIf2m=Qac
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the boot-params tree got a conflict in
arch/sh/boards/mach-microdev/setup.c between commit
cee3e05ee0c727945280b754b3d4bfe0d7bcb622 ("sh: mach-microdev: Split out
the fdc37c93xapm initialization code") from the sh tree and commit
0de5c2d9f02d2018fd671ca1015432dffa5eb338 ("param:
arch_get_boot_command_line()") from the boot-params tree.

The former removed the code that the latter changed.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__18_Dec_2008_20_35_07_+1100_zU3+Sn_XIf2m=Qac
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklKGUsACgkQjjKRsyhoI8yK9ACeNHc2i1aLEPmjfQqbhivk44vi
YE0An3uhGP6A51SuZqM+F3CgJAtS3HJg
=ca8D
-----END PGP SIGNATURE-----

--Signature=_Thu__18_Dec_2008_20_35_07_+1100_zU3+Sn_XIf2m=Qac--
