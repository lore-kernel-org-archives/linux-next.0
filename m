From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm-intel tree
Date: Thu, 7 May 2015 15:29:39 +1000
Message-ID: <20150507152939.5e7b4333@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2K/Ip+c8QDkycWVnRsmAeDg"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44315 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751613AbbEGF3q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 May 2015 01:29:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/2K/Ip+c8QDkycWVnRsmAeDg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (i386 defconfig)
produced this warning:

drivers/gpu/drm/i915/i915_gem_gtt.c: In function 'gen8_ppgtt_init':
drivers/gpu/drm/i915/i915_gem_gtt.c:954:22: warning: large integer implicit=
ly truncated to unsigned type [-Woverflow]
  ppgtt->base.total =3D 1ULL << 32;
                      ^

Introduced by commit 5c5f645773b6 ("drm/i915: Unify aliasing ppgtt
handling").  "total" is a size_t, so unsigned 32 bit on i386.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/2K/Ip+c8QDkycWVnRsmAeDg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSvhHAAoJEMDTa8Ir7ZwV9ykP/2+9/hB3Gyun3Xn2HLpYY9Pj
fvfRNf2ekx8QdIHQvV39iAoq+GOB762FmZelBvw3Q+qHOJj0YgkmeuryGxifC2qU
ZLbHH4EhSarPlFWAF3ws4NmAQQY0II8erPcOHxpxIueYcYHJGE8X4rqtldG79Dj7
CO09a0eR0tyoJZWxr2GCrvAKz4fQ8HfT/LrE5NDe235G67cZzAuZ0ap75i0XIrrd
GDv6yfegcMrwTNCoqaP3+hlhvyFVPMygfZW9QcAz7zP5l9K7JPgGgJA6NvLm1loD
5gfzXq408/GU2Duk8bcfJ5jLLHVBnH6Bn1c2yzh8ILSgIVfwzsqWRn4e2daejmd+
+jj5JeiRdy+FGWlQhO/XkTP/5GkO11/RqDdtQFzj0savgM6ax7p8XUV/dQygVOwJ
LE0hn33ajLEKMfJQm7rZRX6frUIONW2lHasxomeGdYJrMoV7f5uzJmhtNt3ifKZB
4mJZ9TVp/T6lNqfZH6bEIYaly4RVKS6HvhE0M0pA5uyE5Ec6PXoGVc0bJY/gGrAZ
KkcPUZrOuzn/ORozBJcN5zGJhF6FtSmDyOFVSfvf6upsBDAJeeQyz4xI32qDaUyl
yF0dEsW3XXcvZZafTr5nIk4Py+npsjlsO7hUn+uGtxK4LhpfeazgbZ8SYlenv+d3
KqWK3J7Yn4bYtqgU72pg
=3lpK
-----END PGP SIGNATURE-----

--Sig_/2K/Ip+c8QDkycWVnRsmAeDg--
