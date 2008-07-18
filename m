From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Fri, 18 Jul 2008 18:48:50 +1000
Message-ID: <20080718184850.c9da8b18.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_18_48_50_+1000_.Bf0V=qdVo1xIMaZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57942 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752351AbYGRIs5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 04:48:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>, Greg KH <greg@kroah.com>

--Signature=_Fri__18_Jul_2008_18_48_50_+1000_.Bf0V=qdVo1xIMaZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/usb-serial.c between commit
f26eeced85fb3bdce383febcbb064147d5e15e91 ("USB: fix usb serial pm counter
decrement for disconnected interfaces") from the usb tree and commit
serial_close ("usb-serial-api-change") from the ttydev tree.

A simple context conflict which I fixed up and can carry the fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_18_48_50_+1000_.Bf0V=qdVo1xIMaZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAWPIACgkQjjKRsyhoI8zw+gCfT1wCYBmdU6SEJ4D+4V1UgPTM
CWMAn00+O42QbDs7AP0PZuixj6rktqHl
=+Imf
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_18_48_50_+1000_.Bf0V=qdVo1xIMaZ--
