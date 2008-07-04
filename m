From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Fri, 4 Jul 2008 19:11:34 +1000
Message-ID: <20080704191134.cd8eb23d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Jul_2008_19_11_34_+1000_XNax3GmHXufIn=+W"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59371 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752859AbYGDJLk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Jul 2008 05:11:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__4_Jul_2008_19_11_34_+1000_XNax3GmHXufIn=+W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the hdlc tree got a conflict in
drivers/char/tty_io.c between commit
3e2a078ca6a0d3122bbf2b904cd7ccf21a5ca21d ("tty: Fix inverted logic in
send_break") from Linus' tree and "77-tty-break-errorhandler" from the
ttydev tree.

I made the obvious fixup.  Please redo the patch.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Jul_2008_19_11_34_+1000_XNax3GmHXufIn=+W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkht6UYACgkQjjKRsyhoI8yIDgCaApGF2bqzuRaCFeDlzWUiVncH
V3EAoJdR6ibSrpT6ByoQzvLYNneZ/5vy
=G8+E
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Jul_2008_19_11_34_+1000_XNax3GmHXufIn=+W--
