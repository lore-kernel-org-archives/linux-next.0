From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Thu, 11 Dec 2008 17:26:45 +1100
Message-ID: <20081211172645.f40c8b9f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Dec_2008_17_26_45_+1100_cyZEi_aVUh2uV8pB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44531 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750990AbYLKG05 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 01:26:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, David Daney <ddaney@caviumnetworks.com>

--Signature=_Thu__11_Dec_2008_17_26_45_+1100_cyZEi_aVUh2uV8pB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/serial/8250.c between commit
507ce132910803e8fd1116467e99f59da3d526f0 ("iop13xx: workaround errata
that causes uart interrupts to be missed") from the async_tx tree and
commit 63c4074301f79f1620d6c880973d6ef1cc770990
("tty-serial-8250-regops") from the ttydev tree.

I have reverted the async_tx commit for today. Please try to figure out
what should happen here.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Dec_2008_17_26_45_+1100_cyZEi_aVUh2uV8pB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklAsqUACgkQjjKRsyhoI8ym2wCeL9s8xg2OecJSB38p4TcVNLLe
U7gAoJ/i92pzdIOo/4mAd7ijldbK7R5W
=af56
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Dec_2008_17_26_45_+1100_cyZEi_aVUh2uV8pB--
