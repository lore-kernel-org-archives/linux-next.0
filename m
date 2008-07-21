From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Mon, 21 Jul 2008 17:20:28 +1000
Message-ID: <20080721172028.dc8e91c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__21_Jul_2008_17_20_28_+1000_O._L_BmiA8sxBKp2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58530 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752679AbYGUHUs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 03:20:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>

--Signature=_Mon__21_Jul_2008_17_20_28_+1000_O._L_BmiA8sxBKp2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got conflicts in
drivers/usb/gadget/serial.c between commit
4d5d46818a74ff3bf7d7cedb9ecc3f0c362a1275 ("usb gadget: use new serial
core") from the usb tree and commit
7ba6ca8da2aca59d29196b7df3f71b0175354644 ("tty-gs-remove-break") from the
ttydev tree.

I used the usb tree version as it seemed to have removed the use of
break_ctl anyway.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__21_Jul_2008_17_20_28_+1000_O._L_BmiA8sxBKp2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiEOLwACgkQjjKRsyhoI8zmOACeKS1xjDlsID5/3EKh08vuCwbW
N30Ani83z+wKqalLajc1VbUcdegxRfU5
=zFYS
-----END PGP SIGNATURE-----

--Signature=_Mon__21_Jul_2008_17_20_28_+1000_O._L_BmiA8sxBKp2--
