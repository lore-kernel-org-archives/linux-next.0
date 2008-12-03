From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: warning with import of ttydev series
Date: Thu, 4 Dec 2008 10:00:32 +1100
Message-ID: <20081204100032.1271ed0a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Dec_2008_10_00_32_+1100_xN_Y_2uyoXtPypcT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57537 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753689AbYLCXAp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Dec 2008 18:00:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__4_Dec_2008_10_00_32_+1100_xN_Y_2uyoXtPypcT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

While importing the ttydev quilt series today I noticed that patch
tty-usb-console-kref is empty.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Dec_2008_10_00_32_+1100_xN_Y_2uyoXtPypcT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk3D5AACgkQjjKRsyhoI8wtGACfRvaLNqjvrfdEmF3CIfI6ZR1q
Wu4AnAvMR8s6iV/e3xGMB3T3vLry7QgC
=zfxk
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Dec_2008_10_00_32_+1100_xN_Y_2uyoXtPypcT--
