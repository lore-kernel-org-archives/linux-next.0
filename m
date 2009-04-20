From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb series import failure
Date: Mon, 20 Apr 2009 10:21:37 +1000
Message-ID: <20090420102137.ae71f973.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Apr_2009_10_21_37_+1000_oZxL7fu_eIuadBh2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53306 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750925AbZDTAVr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Apr 2009 20:21:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__20_Apr_2009_10_21_37_+1000_oZxL7fu_eIuadBh2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's import of the usb quilt series failed like this:

$ git quiltimport --author Greg KH <greg@kroah.com> --patches ../quilt/usb
musb_gadget-fix-unhandled-endpoint-0-irqs.patch
musb_gadget-suppress-parasitic-tx-interrupts-with-cppi.patch
error: patch failed: drivers/usb/musb/musb_gadget.c:349
error: drivers/usb/musb/musb_gadget.c: patch does not apply

I assume there have been some changes in the upstream tree to cause this
since that series hasn't changed since Friday.  I will have to drop the
usb tree for today (and the staging tree that depends on it).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Apr_2009_10_21_37_+1000_oZxL7fu_eIuadBh2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknrwBEACgkQjjKRsyhoI8yQagCfSMMfyQ++NpFL7tWKHtPWy9mh
MbEAoIZYQlO0ttXDNwREtcatjisLwrNV
=HR4V
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Apr_2009_10_21_37_+1000_oZxL7fu_eIuadBh2--
