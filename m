From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 21:37:04 +1000
Message-ID: <20080701213704.13a88ee1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_21_37_04_+1000_AyFr4IttOO6oGpwG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33262 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752609AbYGALhJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 07:37:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

--Signature=_Tue__1_Jul_2008_21_37_04_+1000_AyFr4IttOO6oGpwG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a trivial conflict in
drivers/usb/serial/io_fw_down3.h between commit
47794b33055da7b52e6718bc97258c95cba8cd67 ("USB: io_ti: FIrst cut at a big
clean up") from the usb tree and commit
ce8194a09dee5b7e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change")
from the ttydev tree.

The same change has happened but with a simple white space difference.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_21_37_04_+1000_AyFr4IttOO6oGpwG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqFuAACgkQjjKRsyhoI8yscgCeO7mLCCdtXaneeOBwAiyhqgDl
MR0An12zntVWrHUYecPutRtd5cmPxUqJ
=rAMd
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_21_37_04_+1000_AyFr4IttOO6oGpwG--
