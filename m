From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree with the usb.current
 tree
Date: Wed, 22 Apr 2009 13:38:21 +1000
Message-ID: <20090422133821.804bf9d6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Apr_2009_13_38_21_+1000_NYwbvQBsqAcGTDWl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47885 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752300AbZDVDia (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 23:38:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>

--Signature=_Wed__22_Apr_2009_13_38_21_+1000_NYwbvQBsqAcGTDWl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/usb-serial.c between commit
098aa19445c918bb8430f9b5cb840b546de570f2 ("USB: serial: fix lifetime and
locking problems") from the usb.current tree and commit
1156df675ae541b21dc343912413f201f87a3909 ("tty-usb-use-port") from the
ttydev tree.

OK, I can't figure this out easily, so I have used the ttydev version of
the file - effectively reverting the usb.current change.

Alan (Cox), when the usb.current change goes into Linus' tree (it is
destined for 2.6.30), you will have to fix the conflict.  You could do
this now by adding that patch to your series and fixing the mess ... Alan
(Stern) you may want to help with this.  I can cope with having the same
patch on both sides of the merge (I won't even complain :-)).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Apr_2009_13_38_21_+1000_NYwbvQBsqAcGTDWl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknukS0ACgkQjjKRsyhoI8wFdQCgtvpxXmGZ3bjMxbBAQ89nhgcD
HZgAoK4eq8clEGNtdY5WdNGuU3aMhD8Y
=zRRn
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Apr_2009_13_38_21_+1000_NYwbvQBsqAcGTDWl--
