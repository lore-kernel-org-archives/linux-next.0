From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Fri, 12 Sep 2008 09:34:43 +1000
Message-ID: <20080912093443.2f226fe7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Sep_2008_09_34_43_+1000_XhVrfu7VEMs6dj.R"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44859 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751126AbYIKXfA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Sep 2008 19:35:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Daniel J Blueman <daniel.blueman@gmail.com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

--Signature=_Fri__12_Sep_2008_09_34_43_+1000_XhVrfu7VEMs6dj.R
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in lib/swiotlb.c
between commit 36223a399f639b13b7a454349565934e6d3e2db0 ("swiotlb: fix
back-off path when memory allocation fails") from Linus' tree and commit
9dfda12b8b769e224ca4efbc35ace4524b9c017b ("swiotlb: use map_single
instead of swiotlb_map_single in swiotlb_alloc_coherent") from the x86
tree.

It looks like the bug fixed by the former is also fixed in the latter, so
I used the latter version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Sep_2008_09_34_43_+1000_XhVrfu7VEMs6dj.R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjJqxMACgkQjjKRsyhoI8yZlwCfeu7m+XMhmUTQVTMfRCjzMY+w
geYAn1XtGOVE2Ry877E5BAvDZPEfNc71
=PtXk
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Sep_2008_09_34_43_+1000_XhVrfu7VEMs6dj.R--
