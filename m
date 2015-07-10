From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Fri, 10 Jul 2015 12:08:55 +1000
Message-ID: <20150710120855.5ab5aae2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/U0FHu22iN+cDaBABnaCB191"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40358 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751688AbbGJCJD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jul 2015 22:09:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, David Weinehall <david.weinehall@linux.intel.com>

--Sig_/U0FHu22iN+cDaBABnaCB191
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.h

between commit:

  8146ba1637a7 ("drm/i915: Store device pointer in contexts for late tracep=
oint usafe")

from the drm-intel-fixes tree and commit:

  b1b38278e12b ("drm/i915: add a context parameter to {en, dis}able zero ad=
dress mapping")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/i915_drv.h
index 580762001f31,52d07fbd9cc8..000000000000
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@@ -826,7 -866,7 +866,8 @@@ struct intel_context=20
  	struct kref ref;
  	int user_handle;
  	uint8_t remap_slice;
 +	struct drm_i915_private *i915;
+ 	int flags;
  	struct drm_i915_file_private *file_priv;
  	struct i915_ctx_hang_stats hang_stats;
  	struct i915_hw_ppgtt *ppgtt;

--Sig_/U0FHu22iN+cDaBABnaCB191
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVnyk9AAoJEMDTa8Ir7ZwVHlcP/2iKe81cJZJ0DZ9UgtxeUd7j
aLFmpqbDjeuA5TqH/zGKmGK8wiETJb3igrimA1stTWNoojZpO9kexQt1dZ8p5O9D
eDUFjoAzwnmiewRnXe/IqWkUnUIW6CCZ6FTjZdpKWfBa+gR0AcIVWq4GtJFvMybN
k/iDTj6DPNLeWZCZa7muriaZG+kiZuPPDTh6Qn4srH3usbyU9QZvJIKyR0VzU/Vp
9lxTf5uEECgdRQXhkvxPrTOKtQ+C04hBn0LSdxLCceBj6y3UPeaemNXpltBDOyLV
l2k4G1bxmMihq4FBXGa0MaTKBJpxqAfcPG/k0/Ra8efRS9JtZN4XVlfc8ve8IeBH
YkY90rooXbHqNWibgUMvgwzgmZNlmWv5nJ3Lrq2jey/iRYay5o0/lCPr1XEKhyBQ
3RmVzx+G5DkLvLkK0XC5zPb8svY0sr17kK7oPkj0mdI3V/6+oVoO+43od7qjx2bh
kY6JOLrS+rgNBmgy3IF9d8S8alZgvkEPtEnY90yNeGOvVOYHXl3zd7CgvaBUvzpD
oj2cHBTk4LAN2MeXNdp80TAKtFg2/U3XXNy0MSTe9CYxHMLiPrlXjFqivSnimUMX
RjdGOv5V/Xh7O8RyiCcRFXpSrRADnXz+/F1ttOMReur6cShxpzh+M6RAInGeoraf
8We7sBRJyqhq6H0lpaDC
=z/gz
-----END PGP SIGNATURE-----

--Sig_/U0FHu22iN+cDaBABnaCB191--
