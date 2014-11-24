From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Mon, 24 Nov 2014 19:09:31 +1100
Message-ID: <20141124190931.6e93d3bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DQsBHy1Q8PS+bZaT4HNGY4e"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57574 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752115AbaKXIJj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2014 03:09:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kumari Radha <kumari.radha3@gmail.com>, Jiayi Ye <yejiayily@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>

--Sig_/DQsBHy1Q8PS+bZaT4HNGY4e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/media/omap24xx/omap24xxcam.c between commit
db85a0403be4 ("[media] omap24xx/tcm825x: remove deprecated omap2 camera
drivers") from the v4l-dvb tree and commits cfafe92c1e94 ("staging:
media: omap24xx: Remove unnecessary 'out of memory' message") and
1d06bb4e9df3 ("staging: remove unneeded parentheses around the right
hand side of an assignment") from the staging tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/DQsBHy1Q8PS+bZaT4HNGY4e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUcue/AAoJEMDTa8Ir7ZwVsqUQAJPCCQJFBXvHGAuo3Ac5EzB2
UlD6JvEQ6kc9l/epY0BBef9XkleuwUoIxoiJshimjDbkTwjZlsUoCFPXqVaKI/GN
JwTwACP6y3yy5shixvtIxxd6QWxp2LH+Dsy3xfXrQFTE9KQDx7JUNQU0c9cGcVXq
kUHPSMCep3B+0S1Sq7NdqkSzXvqyFNvOCCfYUUrnZ+7EPr31Kcpx2MprK5RYOnRz
SKMBgn/WdrNd0gxYrgy2HFAgFqTK9ansPAjZvIaOIok8SHxtvhiJ2A27w8qDICTp
Yd0IjzPej2TQhDePzDX4DsoQ8S0B76m0qZq7naH+/5JodoeBQyMAhtsfx1UASbD1
e30vgn6h8/HmFsnIQBMxx9c2+iP3HK/pNiyMPRwNgEjj/5pjnB6bMZqt/hx16KXq
1HOtaI/Z/ZLc9UQhKrLi2YcXoTrghT9MlCbU5acppM8JKXIRM8qlJz8JaLkv6vpO
v7eRRVjvKGIMLcXAEixPrAPkXIEnSFaqK5pCNHHM5E7Y4BI8oFkhuN0ndTPFyPcb
yxZf2r1JsbVfbwtpsZJrEYmeHgwJEjbYZ40Zb4NAfzb/gGN/asf7Vjqt+QqH7Rhx
M9GTKJY2lGvxfQq3ztj/pdYTPeutxPhpjabx6jUKuc/wvI0uQ5MpmtyIJZhi4TvE
/XiAnIOCAWrVzppsFVo3
=F4XM
-----END PGP SIGNATURE-----

--Sig_/DQsBHy1Q8PS+bZaT4HNGY4e--
