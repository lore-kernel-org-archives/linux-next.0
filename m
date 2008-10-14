From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree
Date: Tue, 14 Oct 2008 14:37:02 +1100
Message-ID: <20081014143702.211591a6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_14_37_02_+1100_jgPpYM=7w685o1sc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59324 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754203AbYJNEl5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 00:41:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__14_Oct_2008_14_37_02_+1100_jgPpYM=7w685o1sc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/media/video/zr364xx.c between commit
69025c934b21a9ce49a76dfef59f1ebdfbe96c78 ("V4L/DVB (8731): zr364xx:
remove BKL") from Linus' tree and commit
598abe853e0084a625b0d554fa9afe8562bd2aa7 ("USB: remove info() macro from
usb media drivers") from the usb tree.

I fixed it up by using he version in Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_14_37_02_+1100_jgPpYM=7w685o1sc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0E94ACgkQjjKRsyhoI8zpAwCeMhzoCyGehJ2PdkdhrYk+FUvp
wycAn0TXC8BkA0lTAGZtTnrYalcYFIC2
=qpPi
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_14_37_02_+1100_jgPpYM=7w685o1sc--
