From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the ttydev tree
Date: Fri, 5 Jun 2009 15:41:18 +1000
Message-ID: <20090605154118.9e9521f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__5_Jun_2009_15_41_18_+1000_5rqt.T=DAPeQA37U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59714 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750876AbZFEFlT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jun 2009 01:41:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Alan Cox <alan@lxorguk.ukuu.org.uk>

--Signature=_Fri__5_Jun_2009_15_41_18_+1000_5rqt.T=DAPeQA37U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/serial/kobil_sct.c between commit
d6ba273795c1260745197dc93f64c321c80a5ecc ("tty-usb-use-port") from the
ttydev tree and commit 8a5870836006ec7dd112082a39e0057b49e5bd91 ("USB:
usb-serial: replace shutdown with disconnect, release") from the usb tree.

The latter removed the code (from kobil_shutdown) that the former
modified, so I just used the latter.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__5_Jun_2009_15_41_18_+1000_5rqt.T=DAPeQA37U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoor/4ACgkQjjKRsyhoI8zfVQCgkBYvjTdMqfggvcDiUU7YzC52
vzoAn0DwD7wUbdBFlIopYVNrPp0OUS7L
=6K6k
-----END PGP SIGNATURE-----

--Signature=_Fri__5_Jun_2009_15_41_18_+1000_5rqt.T=DAPeQA37U--
