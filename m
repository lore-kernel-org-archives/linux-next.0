From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree
Date: Tue, 14 Oct 2008 14:27:13 +1100
Message-ID: <20081014142713.2d03ae75.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_14_27_13_+1100_b6UnT9RpiQpE1non"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59315 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751784AbYJNElw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 00:41:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Tomi Orava <tomimo@ncircle.nullnet.fi>, Mauro Carvalho Chehab <mchehab@redhat.com>

--Signature=_Tue__14_Oct_2008_14_27_13_+1100_b6UnT9RpiQpE1non
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/media/dvb/cinergyT2/cinergyT2.c between commit
986bd1e58b18c09b753f797df19251804bfe3e84 ("V4L/DVB (9107): Alternative
version of Terratec Cinergy T2 driver") from Linus' tree and commit
58e43f3f48c28cc35be7502b5aa81ce53de51815 ("USB: remove warn() macro from
usb media drivers") from the usb tree.

The former commit removes the file, so I have done that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_14_27_13_+1100_b6UnT9RpiQpE1non
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0EZEACgkQjjKRsyhoI8x0PwCeN2c6v0Rvk2asVCL61c6kkdvD
NzoAnRNh20xv2W/2eKp5HJ31swIclcAX
=jWet
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_14_27_13_+1100_b6UnT9RpiQpE1non--
