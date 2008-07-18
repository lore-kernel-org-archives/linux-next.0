From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Fri, 18 Jul 2008 18:20:15 +1000
Message-ID: <20080718182015.bf3ef4e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_18_20_15_+1000_W3ecypH3elOAid8c"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43156 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751860AbYGRIUY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 04:20:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Adrian Bunk <bunk@kernel.org>, "John W. Linville" <linville@tuxdriver.com>

--Signature=_Fri__18_Jul_2008_18_20_15_+1000_W3ecypH3elOAid8c
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/net/wireless/strip.c between commit
94d9842403f770239a656586442454b7a8f2df29 ("remove the strip driver") from
the wireless tree and commit 08bec19ee22b6d02bf354323e6b5a3e61070c04a
("tty-fix-strip") from the ttydev tree.

I just removed the file for now.

I think I remember some discussion of this a while ago ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_18_20_15_+1000_W3ecypH3elOAid8c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAUj8ACgkQjjKRsyhoI8xmJQCgum5A7K1bpuQMaLhBILFKdFLO
Bw0AoMAzooJiUdG+AqnlOFEpefq8Rz9N
=oaUb
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_18_20_15_+1000_W3ecypH3elOAid8c--
