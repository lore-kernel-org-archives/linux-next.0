From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the drm-fixes tree
Date: Thu, 7 Feb 2019 22:45:39 +1100
Message-ID: <20190207224539.52b5e209@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XbE+LumaCv.tsn1t1Jv3L5C"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>, Deepak Rawat <drawat@vmware.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/XbE+LumaCv.tsn1t1Jv3L5C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4cbfa1e6c09e ("drm/vmwgfx: Fix setting of dma masks")

Fixes tag

  Fixes: 0d00c488f3de: ("drm/vmwgfx: Fix the driver for large dma addresses=
")

has these problem(s):

  - ':' unexpected after SHA1

In commit

  479d59026fe4 ("drm/vmwgfx: Also check for crtc status while checking for =
DU active")

Fixes tag

  Fixes: 9da6e26c0aae: ("drm/vmwgfx: Fix a layout race condition")

has these problem(s):

  - ':' unexpected after SHA1

In commit

  51fdbeb4ca1a ("drm/vmwgfx: Fix an uninitialized fence handle value")

Fixes tag

  Fixes: 2724b2d54cda: ("drm/vmwgfx: Use new validation interface for the m=
odesetting code v2")

has these problem(s):

  - ':' unexpected after SHA1

In commit

  728354c005c3 ("drm/vmwgfx: Return error code from vmw_execbuf_copy_fence_=
user")

Fixes tag

  Fixes: ae2a104058e2: ("vmwgfx: Implement fence objects")

has these problem(s):

  - ':' unexpected after SHA1

In commit

  2b3cd6249b14 ("drm/vmwgfx: fix the check when to use dma_alloc_coherent")

Fixes tags

  Fixes: 55897af630 ("dma-direct: merge swiotlb_dma_ops into the dma_direct=
 code")
  Fixes: 356da6d0cd ("dma-mapping: bypass indirect calls for dma-direct")

have these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/XbE+LumaCv.tsn1t1Jv3L5C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxcGmMACgkQAVBC80lX
0GzMbwf9Eqn6EMPk90DAYlTKjiETaUj5FekiVfWV6sb9N05gB3oAjzMYrlS7nRkB
yd+q75RAJ4HPNeV17jSy1PZ5hCVHT6NeQBuj32moKg/dVyypyzjkwzEoRsJU33g2
8ArCwwCFxszYrdHyB/UGXDbuyyM0IryDC6aKxYfqXejMtf730jLRFY3YPgmcaJH/
FjmY7kH7mEM4ENjf1KeFtcka7Gtr50i29zBUJrWsjUL2+n+D7QfVotTyrSSbAGH6
CyD6g0hh8cu8p1fMnxczJDdHCHBSM+aokbbQnwSfCAH34aERAyOEo/Jndpsa1QAP
W3Yb2Bke81rabUnvK4LhnxG86rG/jg==
=ligY
-----END PGP SIGNATURE-----

--Sig_/XbE+LumaCv.tsn1t1Jv3L5C--
