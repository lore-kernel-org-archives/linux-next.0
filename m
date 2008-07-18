From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Fri, 18 Jul 2008 15:33:28 +1000
Message-ID: <20080718153328.958e3009.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_15_33_28_+1000_TgCzDZt/67y2AK/J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34079 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751128AbYGRFdi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 01:33:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, David Miller <davem@davemloft.net>

--Signature=_Fri__18_Jul_2008_15_33_28_+1000_TgCzDZt/67y2AK/J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
include/asm-sparc64/namei.h include/asm-sparc/namei.h between commit
0d4b5053275562b4ff7a9a98942936c9eb9b5c18 ("sparc: join the remaining
header files") from the sparc tree and commit
2d810d154f1ffc5c637acdb067693773efb09540 ("[PATCH] kill altroot") from
the vfs tree.

I removed the files and the _{32,64} versions as well.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_15_33_28_+1000_TgCzDZt/67y2AK/J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAKygACgkQjjKRsyhoI8x6wwCbB2MGwQaGecZcgisyCU2NgrPn
jxIAn2sl+xvlHDnDDXAvxncJTSvIC9jF
=zoJ9
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_15_33_28_+1000_TgCzDZt/67y2AK/J--
