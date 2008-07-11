From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of ttydev tree
Date: Fri, 11 Jul 2008 17:28:04 +1000
Message-ID: <20080711172804.a3ff6b3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__11_Jul_2008_17_28_04_+1000_e7mu/thl3=kJwHX5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52549 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753426AbYGKH2M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 03:28:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__11_Jul_2008_17_28_04_+1000_e7mu/thl3=kJwHX5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today while importing the ttydev tree, patches
"49-tty-tidy-usb-io-edgeport" and "88-tty-moxa-warning" failed to apply
so I removed them from the series.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__11_Jul_2008_17_28_04_+1000_e7mu/thl3=kJwHX5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh3C4QACgkQjjKRsyhoI8xh6QCgiBcli7KcJI8mfhzsyK4BoQCb
gLQAnR89BDkvXS7hCaanYOr7lyOpksks
=qPtO
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Jul_2008_17_28_04_+1000_e7mu/thl3=kJwHX5--
