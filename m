From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the v4l-dvb tree
Date: Sun, 21 Jun 2015 00:05:36 +1000
Message-ID: <20150621000536.7ae5402f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HPV4yCQVXn5LM22oNllqB5f"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60361 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752232AbbFTOFo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 10:05:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Jan Kara <jack@suse.cz>

--Sig_/HPV4yCQVXn5LM22oNllqB5f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/media/v4l2-core/videobuf2-dma-contig.c

between commit:

  511a1b8a4c81 ("[media] Revert "[media] vb2: Push mmap_sem down to memops"=
")

from the v4l-dvb tree and patch:

  "media: vb2: convert vb2_dc_get_userptr() to use frame vector"

from the akpm tree.

I fixed it up (I just used the akpm tree version) and can carry the fix
as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/HPV4yCQVXn5LM22oNllqB5f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhXM1AAoJEMDTa8Ir7ZwV85gP+wVlngrviKSiZbEyAuTjZEWr
wXE34dyVzsuGg1k7uyr827TMI6MiwLFV3e+j5AaSRRGaP28VRZ+roq/3CP3j+xXM
G6HaKtZR6p3TANe0/gvbtKkzEG0PJns2IbZi/72Gjj924efbk9HciUeDYYsEYvXI
v5vE2QJ+yBGJGlwm/5pHK/FwZv9KfN4PKqXqS3KremdDr8oqLoCDkA+QCNwjV3w+
p7rL1st3xeqbhVVxe4hjLec+G3xo7rnxaidXp+D2ruqouxvOkvzfoDyBCTmuJuRj
WnwV28soWMotiyyYJ4VyNS7TNjJAbAjFb6j2m17ouBIldBB/+pDbUs7asFDgDrIi
du1PVvZQft4NcR/RAZ4Q/P0u+rs7h5NcTqSvPtjxt2Kxec/nEI0yvcXg3jlMaYzF
b3fXKkR7RM3n2KB8lYxSawcTZEwWKOI20CGjxEkz7i+nENbo02mnTUpy2KTYRMBh
34Yrtmz7sEoBT7vzdI1ZICpMkih+GLjxiErqgSLa5LjXgnheNFtf1+Dqn+0YxxW6
UQ5Lvshk+gP04sgYuQUIYUEuVW3dLTRnakxTYNBqtcZAQzfGYCXN0P/T9KsairjE
eJ67eolRFrAWFBAKapdUUcU4r5IerXsGXDtCcUdIUSaNH1GLwSXUOPtULRxEOmzt
s6HikBDF0q3tnnu1loiE
=II8j
-----END PGP SIGNATURE-----

--Sig_/HPV4yCQVXn5LM22oNllqB5f--
