From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree
Date: Thu, 17 Jul 2008 10:54:30 +1000
Message-ID: <20080717105430.a81c9657.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Jul_2008_10_54_30_+1000_tr65GfiHaRI1kx4K"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38713 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760226AbYGQAyo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 20:54:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

--Signature=_Thu__17_Jul_2008_10_54_30_+1000_tr65GfiHaRI1kx4K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Now that the firmware tree has been merged into Linus' tree, the files
drivers/usb/serial/ti_fw_3410.h and drivers/usb/serial/ti_fw_5052.h no
longer exist, so the patch "ti_usb: kick firmware into user space" no
longer needs to patch them.  I am not sure if that patch is needed at all
any more (probably not).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Jul_2008_10_54_30_+1000_tr65GfiHaRI1kx4K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh+mEYACgkQjjKRsyhoI8zZywCfd9/aUV2ZFTnLJiMOaZmMhXTX
ILAAnjq4EtRwQ7tDvaaX4R4m2nkppi0Y
=e5SO
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Jul_2008_10_54_30_+1000_tr65GfiHaRI1kx4K--
