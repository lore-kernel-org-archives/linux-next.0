From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Wed, 2 Jul 2008 00:09:51 +1000
Message-ID: <20080702000951.ab1f6666.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Jul_2008_00_09_51_+1000_7baCarETxrGh1+gk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55942 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759288AbYGAOJx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 10:09:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Wed__2_Jul_2008_00_09_51_+1000_7baCarETxrGh1+gk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in drivers/usb/s=
erial/airprime.c between commit 31c3b66aea5816d8c9406a272de71ea474ef86b5 ("=
USB: delete airprime driver") from the usb tree and commit ce8194a09dee5b7e=
101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change") from the ttydev tree.

The former removed the file.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Jul_2008_00_09_51_+1000_7baCarETxrGh1+gk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqOq8ACgkQjjKRsyhoI8y39wCgvM2cAxOmlhF8k7Y4vD1Pwov/
0GcAoKLF1Ah7yCSJwtOlcHEmUEvnkjEQ
=Fumh
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jul_2008_00_09_51_+1000_7baCarETxrGh1+gk--
