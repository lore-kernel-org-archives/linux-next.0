From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree
Date: Thu, 10 Jul 2008 14:33:54 +1000
Message-ID: <20080710143354.729601d6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__10_Jul_2008_14_33_54_+1000_00EktTj8s7Ui/Sjm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41683 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751828AbYGJEeL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jul 2008 00:34:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Philipp Zabel <philipp.zabel@gmail.com>, Greg KH <greg@kroah.com>

--Signature=_Thu__10_Jul_2008_14_33_54_+1000_00EktTj8s7Ui/Sjm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
drivers/usb/gadget/ether.c between commit
41df25fad30d0e88ddc042358556f19a72d70054 ("usb ethernet gadget: use
composite gadget framework") from the usb tree and commit
7a8576204333d133d58cbcc59dacf49a5546e3e4 ("[ARM] 5120/1: pxa: correct
platform driver names for PXA25x and PXA27x UDC drivers") from the arm
tree.

I am not actually sure what to do with this.  To make it build, I have
just take the usb tree's version, but there is probably more to it than
that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__10_Jul_2008_14_33_54_+1000_00EktTj8s7Ui/Sjm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh1kTIACgkQjjKRsyhoI8xpWQCghmpNFHmYWzrpOQf16h90Tosg
HukAoIMJm1IwhpxbdWbhEWyarryIHTX+
=3Xie
-----END PGP SIGNATURE-----

--Signature=_Thu__10_Jul_2008_14_33_54_+1000_00EktTj8s7Ui/Sjm--
