From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmap_atomic tree with Linus' tree
Date: Fri, 10 Feb 2012 16:17:14 +1100
Message-ID: <20120210161714.a769968c1569bcd30ec79956@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__10_Feb_2012_16_17_14_+1100_nd0me_y0agD1IMON"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:34480 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750745Ab2BJFRZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Feb 2012 00:17:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cong Wang <amwang@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>

--Signature=_Fri__10_Feb_2012_16_17_14_+1100_nd0me_y0agD1IMON
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Cong,

Today's linux-next merge of the kmap_atomic tree got a conflict in
drivers/staging/pohmelfs/inode.c between commit 67435319866f ("staging:
pohmelfs: remove drivers/staging/pohmelfs") from Linus' tree and commit
709bc0d6b5c6 ("pohmelfs: remove the second argument of k[un]map_atomic
()") from the kmap_atomic tree.

The former removes the file, so I did that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__10_Feb_2012_16_17_14_+1100_nd0me_y0agD1IMON
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPNKhaAAoJEECxmPOUX5FEQDwQAIjLqVhLi7dTXW0bpU4RftOo
Ao0F5+1OfR3lDb3T28HX6+GP9++QftQhp149yU0HF8hjgfWtMJuW/ldK8wWLgMyC
brOJZcXdTHkSzf3WrimAIfZooOexvksWLoPoZD6WnpUOFUVeHLS9jwCmHNOg2+zt
akUaXRQ10zs2+x9zRXf/iFysmv4UFKJD1zBpt6WNGrq+06foLFsgKWSjdkJF9hVY
K4Wom1+cLjxyhY97XbIAMuae0bAgjhm8BLoElOeKGA0GW4HwtRuoUED+bcCUU9Re
UcHvUTX3e5JawCxRyDE7EdiUIKw2we+5xY6tJSYl7LVB0CHn82ELfnbAgKH+8x2H
xsKH0HJkV+yVdwlQI2K9p5qECPfyl5LHslapUFelhrEsJV53alexPfUe+5LDZroY
DULZpPD1oFceZH0cfRY8uqDi1qJlNjwhoRINJrgFKbWTBteb0gxXQOpePoZ4f7eT
ROudwHAERdkZ6CsxV6hhtHjT+DXmapyw2V2fYo52RMeBAIZdYayBHhIsEg7bg7yl
nbLDuDJnTIz1UGibe4AbJN93S+/CnNn7bHMgyKFdeZ/UYFC6LGFUf2FnXWx0O37p
Ecv5vt4qFG0tqrxNEM8YGKJm70oo5em2aFjhZ1GBFsCZ0TQTJpmQOIQwP2BMUPfp
SbVDPoRhjuK9ynsxC+DO
=KQ4A
-----END PGP SIGNATURE-----

--Signature=_Fri__10_Feb_2012_16_17_14_+1100_nd0me_y0agD1IMON--
