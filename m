From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the v4l-dvb tree
Date: Sat, 20 Jun 2015 23:56:56 +1000
Message-ID: <20150620235656.2d79c10e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wiq0Xy9YkEPeDQfW/2fz=8P"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53112 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753943AbbFTN5E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 09:57:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Jan Kara <jack@suse.cz>

--Sig_/wiq0Xy9YkEPeDQfW/2fz=8P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/media/v4l2-core/videobuf2-vmalloc.c

between commit:

  511a1b8a4c81 ("[media] Revert "[media] vb2: Push mmap_sem down to memops"=
")

from the v4l-dvb tree and patch:

  "media: vb2: Convert vb2_vmalloc_get_userptr() to use frame vector"

from the akpm tree.

I fixed it up (I just used the akpm tree version) and can carry the fix
as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/wiq0Xy9YkEPeDQfW/2fz=8P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhXEuAAoJEMDTa8Ir7ZwVQKIP/RrSbyDYgxlh3n1t8nPZc2ZS
9lWyK1pNHEJUoTmoEwM3WK1HRcXnb0dun/Bo3Gr7Hlg4np3/BIF3eqsSoI2TmboJ
ED4Fmhp9LgMajShCX29kUZwgLYSTguOudRkX/ICkNomg75OmkS/ebnhZKli1CmGl
fvg8tgICxjLjJmJSB2R+fVNWFZZW6GfZcoF9yvUD8PiuOjpWF1ehc6ahfIeGbl8P
vMKYmg67DVlxVk6gG87YT37lw+lJnRuahG/g2+4Vbcl901vBom7EytvmA471STyR
fZ7KPwSzsig0yeTB/D3fn7zcTWYQilfxqS62uk6c84p0/GxH9i0VL0k+7wF48kxd
gwlAQ+xg5vtEmKEW5bYG8uE8UvYDfuQQT0ldnJJY1ZR5nR4i+WZYUqzZthDS8J11
1tEXvyTth5oZADccB/5hFTsdJdh2rlTr5+AMLeg1MlCkLGHIRmt39/l+pX+shA4U
sIY3a7fLD90PBU9sXmOGzEoO35phlAOW4HtGsjzQNHBYuGVWT7IRrDs1I6DYiYsg
vvGy9wthXKBd/iMmmNjIbhiI1Uuokx/E/u72mk3COpGZ3ZQTj/2hEaYv06JIgv4c
Wbkg81Z8bcipZazwewyW7OcCk1BT+lv5Gl77raDMeMxk9anRcnYPFf+Bd32yGD0I
njfKUSOlxNmPBdT9JOMe
=3PA5
-----END PGP SIGNATURE-----

--Sig_/wiq0Xy9YkEPeDQfW/2fz=8P--
