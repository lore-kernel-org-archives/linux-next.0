From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Tue, 7 Apr 2015 15:22:51 +1000
Message-ID: <20150407152251.08d7929b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QjyERculE4tw_Xz299DV+Ry"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45971 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750870AbbDGFW7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2015 01:22:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

--Sig_/QjyERculE4tw_Xz299DV+Ry
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/i915/intel_sprite.c between commit 840a1cf0cd53
("drm/i915: Reject the colorkey ioctls for primary and cursor planes")
from Linus' tree and commit a8265c59e22a ("drm/i915: Rip out
GET_SPRITE_COLORKEY ioctl") from the drm tree.

I fixed it up (The latter removed some of the code modified by the
former) and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/QjyERculE4tw_Xz299DV+Ry
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI2mwAAoJEMDTa8Ir7ZwVc10QAJCenQFIFVWYxsQZ6S4uIYzQ
ntv1bicPaLIUfkuLe6AWjxuJ4lRGZG5JL9fm8RIL1fP9aV2bawLF/qeFn1blymZW
OkqixHXlc9p8cQu2cqBtTmIxUo//xuwS2C59Uic8Y7dQnWBVGIg4AcKbtCn4eQ44
XOiek9dJ3Xc2nj5K67PmK41lZN2ofLbsv91eWXpy3qW7EAKhRyeduLgAuXJddxnV
3M5VNJWSqeaejaL74eqit1dP5LbLg+n3ZjZUFNlKDJTs3Tkp7p6WsQtXOYWbv5fs
iJWGZH/1hZ/q846G0TOaxO8/VlHqLmWdMTxcCKDB3Uf3igF6lwcgt5KCzuTc9V3X
fs7U3cBh3mDSKxrKOgSTwpVgTCc9Y+W9E/m6WI/IKFZ5uckR3TvzjihKhV/4mGUW
BzxPoyyB+2rG3fnThvczucjhxlCcoscARLTndZxTTGtPqevbF7THL1H1InEaIYeN
X6wH3HJgI0dg3JqIS1CZD1YdOyR2FrXGylayLkzppC54BhoG0oH3QC1SwK6TND6j
WkTRYOMD1wIK7p9y/7YF88BPlDp/hnlVwQDhy66oCHVX5Y6uJQWEVdPpKDCDeWnC
UqfCaS9iUVSpK/avYSnt4ZyZraQWnZWUMYfsxv7Z5rraWLioZjWnc3jZH2I/zyVV
L2c4eHwitMo9/z8PwqXF
=MOP5
-----END PGP SIGNATURE-----

--Sig_/QjyERculE4tw_Xz299DV+Ry--
