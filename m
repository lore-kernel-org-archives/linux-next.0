From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: attempted manual merge of the ubifs tree
Date: Wed, 23 Jul 2008 16:11:09 +1000
Message-ID: <20080723161109.a5e44c91.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Jul_2008_16_11_09_+1000_U.hH+ayrr81LL0AA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50083 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751263AbYGWGLT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 02:11:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__23_Jul_2008_16_11_09_+1000_U.hH+ayrr81LL0AA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

Today's linux-next merge of the ubifs tree got a lot of conflicts against
the ubi tree.  I can only assume that the ubifs tree was based on a
different version of the ubi tree than what I have in linux-next today.

I have dropped the ubifs tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Jul_2008_16_11_09_+1000_U.hH+ayrr81LL0AA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiGy30ACgkQjjKRsyhoI8zcOwCfSpYwkTh6pts1G2AK3LIC+HFZ
SEUAn0ocUnAVZAyOpk4ZpNaqHtpr/nUu
=EaL3
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Jul_2008_16_11_09_+1000_U.hH+ayrr81LL0AA--
