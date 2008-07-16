From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree
Date: Wed, 16 Jul 2008 12:02:19 +1000
Message-ID: <20080716120219.a3de00bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_12_02_19_+1000_2EbKkVp_mO=Rsqaa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55189 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751935AbYGPCCd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Jul 2008 22:02:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jaswinder Singh <jaswinder@infradead.org>

--Signature=_Wed__16_Jul_2008_12_02_19_+1000_2EbKkVp_mO=Rsqaa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
drivers/usb/serial/io_ti.c between commit
d12b219a228efe92f0778ed3af21305e65fbb052 ("edgeport-ti: use
request_firmware()") from Linus' tree and commit
1f023570c8d00d3511799ccad21dc3525a6160e1 ("USB: io_ti: FIrst cut at a big
clean up") from the usb tree.

This conflict used to be in the firmware tree and my solution then was to
remove the commit now in Linus' tree because the fixup was going to take
to long.  Now my solution is to remove the commit from the usb tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_12_02_19_+1000_2EbKkVp_mO=Rsqaa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9VqsACgkQjjKRsyhoI8zi6ACfRK7m3NHDmNzNZo3KBNTmDrbo
ZecAnRE5L7efaici9zdHSo+Xn5o0kRwR
=khs3
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_12_02_19_+1000_2EbKkVp_mO=Rsqaa--
