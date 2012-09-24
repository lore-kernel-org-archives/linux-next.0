From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 24 Sep 2012 11:45:57 +1000
Message-ID: <20120924114557.4cf18ec72290574a741c12be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__24_Sep_2012_11_45_57_+1000_LMydg6HJKgtHEPck"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__24_Sep_2012_11_45_57_+1000_LMydg6HJKgtHEPck
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in fs/stat.c
between commit 55815f70147d ("vfs: make O_PATH file descriptors usable
for 'fstat()'") from Linus' tree and commit 19ba95358327 ("switch simple
cases of fget_light to fdget") from the vfs tree.

I just used the vfs tree version and can carry the fix as necessary (no
action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__24_Sep_2012_11_45_57_+1000_LMydg6HJKgtHEPck
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQX7tVAAoJEECxmPOUX5FEvYoP/jfDAqhUzJB6EUrVIyIirG3U
aH/P7NpeEXW5gLeKxaoD++1pD2g0YfTP0fGWdYuUUKfLXxPF20pfaNYdB6cfYo4a
MhiPkb3jg4Kq6YNOUwJ5pkWSytH8+RQNEasZBHD1wW75efrQzGhQjQbH58pn2/xG
77PosBW2of63F/8c7zuvzk6lFlXcgJfnqPoQwncbDXyhSi3JakXeZnDAQqBniEfK
laKO7Dro3QbOjEGYxT2U4Ri/TO464eAiEbi9s02dNQ8Iqbf4+rkMxiBjT/t2tMRW
ct8yUHhhyiKRHHCfT48chTTwveV0MYYegD6WY28WV7dMsagVzizqlSf/ZOk2rwCl
GjyKj0UhYnNnVBhQNQcd0e+Ub9UHcebQRy7V4iBfTX4MTQsSQ5U4yl8C0c9uZxLC
x3v4+rDIUbBFvamilR+oc25XV9wzjtbE1qh1vszkmL3t/Af7ITlPShYvTERxmxvN
XWq13fWeHOACxfYmADEKRVkbWyTXgt/w/nZ/vy3PY2XztKvOJfVRPP+sRLmPibIs
5glPAimbMhwJCUqpl2s0AXRkFrjECSVp+fIWuMxUfndAbOlIKnLFx08H8Jmz3mk/
nC37LO6qJrpzmCkcSn4ZBDX9F9iHvVRcDGmGQYzHxTv5yjWwTP1j3ycJSP714xqG
GymD7P4thKXMgHIC0Ojv
=T9Vk
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Sep_2012_11_45_57_+1000_LMydg6HJKgtHEPck--
