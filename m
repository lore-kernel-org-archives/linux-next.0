From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb series import failure
Date: Tue, 14 Jul 2009 11:26:48 +1000
Message-ID: <20090714112648.d2157b44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Jul_2009_11_26_48_+1000_ZMDK9gkEJk_eopLM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33943 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752185AbZGNB0z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jul 2009 21:26:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__14_Jul_2009_11_26_48_+1000_ZMDK9gkEJk_eopLM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next import of the usb quilt series failed like this:

usb-make-the-usbfs_snoop-log-more-pertinent.patch
error: patch failed: drivers/usb/core/devio.c:347
error: drivers/usb/core/devio.c: patch does not apply

I commented out the above patch which lead to:

usb-gadget-pxa25x-basic-transceiver-support.patch
error: patch failed: drivers/usb/gadget/pxa25x_udc.c:2162
error: drivers/usb/gadget/pxa25x_udc.c: patch does not apply

And on ...

It looks like the some of the usb patches haven't been updated for the
rebase onto -git9.  I have dropped the usb and staging trees for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Jul_2009_11_26_48_+1000_ZMDK9gkEJk_eopLM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpb3tgACgkQjjKRsyhoI8y1EACeIUBfpVwIc74E7vjN8MLJ5CGM
0ZsAnjpsKlHA9qXzW06z715QyVCLrW1T
=kAoM
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Jul_2009_11_26_48_+1000_ZMDK9gkEJk_eopLM--
