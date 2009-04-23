From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree with the usb.current
 tree
Date: Thu, 23 Apr 2009 14:34:21 +1000
Message-ID: <20090423143421.b942d41a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Apr_2009_14_34_21_+1000_LAAoVa1y_o8ncJzk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42153 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750710AbZDWEe2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 00:34:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>, Greg KH <greg@kroah.com>

--Signature=_Thu__23_Apr_2009_14_34_21_+1000_LAAoVa1y_o8ncJzk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/option.c between commit
3355625b2b58b213e481b071aa01d15240f0d8dd ("USB: removal of
tty->low_latency hack dating back to the old serial code") from the
usb.current tree and commit 1156df675ae541b21dc343912413f201f87a3909
("tty-usb-use-port") from the ttydev tree.

Just context changes.  I fixed it up and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Apr_2009_14_34_21_+1000_LAAoVa1y_o8ncJzk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknv780ACgkQjjKRsyhoI8yXFQCgu1UARwDagFUJ/LJlzqRAW75U
L9AAoJYI/Jdcx0setM6GdAqCLU8/gzSY
=Ibwk
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Apr_2009_14_34_21_+1000_LAAoVa1y_o8ncJzk--
