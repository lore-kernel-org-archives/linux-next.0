From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Mon, 30 Apr 2012 13:22:41 +1000
Message-ID: <20120430132241.0877fdec735a4e42701a4612@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__30_Apr_2012_13_22_41_+1000_/VX_wN6ZUDNCcKqM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>, Alex Deucher <alexdeucher@gmail.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__30_Apr_2012_13_22_41_+1000_/VX_wN6ZUDNCcKqM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/drm_edid_load.c: In function 'edid_load':
drivers/gpu/drm/drm_edid_load.c:176:2: error: too few arguments to function=
 'drm_edid_block_valid'
include/drm/drm_crtc.h:1015:13: note: declared here
drivers/gpu/drm/drm_edid_load.c:188:3: error: too few arguments to function=
 'drm_edid_block_valid'

Caused by commit f89ec8a456dd ("drm/edid: Try harder to fix up base EDID
blocks"). drivers/gpu/drm/drm_edid_load.c was added before v3.4-rc1 ...
grep is your friend.

I have used the drm tree from next-20120427 for today.

--=20
Stephen Rothwell <sfr@canb.auug.org.au>

--Signature=_Mon__30_Apr_2012_13_22_41_+1000_/VX_wN6ZUDNCcKqM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPngWBAAoJEECxmPOUX5FENCgQAIQoj4wR5RdHguSDXj+t9XXG
ErWKAZ1kPn4++9kVkON/iF7E0mjK9jRkEAiozG+QCw2tJe1GbRvkRGKL4z3ZsBm6
Gwll31h5YlZAutNWP1IwTwnW91QuHuBmkGzmArUqJKh7Gu/+kme1RLbGcX0IDSHf
01rEb82YflND8nx2jCYzPyqpWKG5V+zZHfmU4jA+tQjni3azAo2EjpPA9thgksGu
NeT/n0VA9ki09QDjUQ55YqLEdlyRa4tBc0pOXNnOV6IDLX3lR3tY2LUXvxfTlLhP
kSk1m8Bvm6lIxDdL/B+fDtxZ5yhgin92dtRu0ZF8g+jW5A5ePe0wzdiqIGE2ZDi9
DANoqGJXVq4AMsKHYnMtKg6r0UPkOeu7hCMElA17U5dYbtOjaqA2SJgz3vKdoiLJ
lHZLoD8wgyoM+RmHeoXsDrAqJMrWZvP4yU+lTqaOiIeUczu0pxolpmSfmPTIMbcn
Mmm2j8pjIZtQm1UmhmxWs70wnZpQSQcJNiVqXCEo/q+3VctjAIiiytcDK7akC8/n
Fx7jUQGmRW39Gp6uG3vWpcpFWylp5z4ajbXiDtCMAVFsFvUyicEgtAB2z3Chj0Bi
U+kbxNRpw6aYxAcXtHzxzfkW9xjASkdfAd4i/A++4fVCHlehpkYbzLyJf1nA6+UG
6NKktEHfQS2DpOqqiSi/
=nqRD
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Apr_2012_13_22_41_+1000_/VX_wN6ZUDNCcKqM--
