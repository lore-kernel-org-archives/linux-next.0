From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless tree build failure
Date: Fri, 27 Feb 2009 13:44:11 +1100
Message-ID: <20090227134411.54e99731.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Feb_2009_13_44_11_+1100_zwSnkNQZpgtJhwvI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54738 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752095AbZB0CoT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Feb 2009 21:44:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Kalle Valo <kalle.valo@iki.fi>, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

--Signature=_Fri__27_Feb_2009_13_44_11_+1100_zwSnkNQZpgtJhwvI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/net/wireless/at76c50x-usb.c: In function 'at76_init_new_device':
drivers/net/wireless/at76c50x-usb.c:2271: error: 'struct device' has no mem=
ber named 'bus_id'

Caused by commit 26b9886dbb1e6930a8a5df9dcf64d8dacb80597b ("at76c50x-usb:
add driver") from the wireless tree interacting with commit
d3592c7c13d14e410ffbf0e86dcd7abb3a23077f ("driver core: get rid of struct
device's bus_id string array") from the driver-core tree.

This can be fixed by using dev_name() which is already available in
Linus' tree.

I have dropped the wireless tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Feb_2009_13_44_11_+1100_zwSnkNQZpgtJhwvI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmnU3sACgkQjjKRsyhoI8xTDwCcDuIYMrBXI5gK8jJmWU4ywki+
LPQAn3cDC/NF+tQ8W2wJiwQFXp3OxIQa
=sMKs
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Feb_2009_13_44_11_+1100_zwSnkNQZpgtJhwvI--
