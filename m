From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Wed, 29 Apr 2015 11:15:11 +1000
Message-ID: <20150429111511.0aa40bf3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XJp9r1T.vM2I2MuXYi+XlfM"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41733 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1031140AbbD2BPS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2015 21:15:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Deepak S <deepak.s@linux.intel.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Jani Nikula <jani.nikula@intel.com>

--Sig_/XJp9r1T.vM2I2MuXYi+XlfM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in
drivers/gpu/drm/i915/i915_drv.c between commit 5df0582bf036
("drm/i915/vlv: remove wait for previous GFX clk disable request") from
Linus' tree and commit 85250ddff7a6 ("drm/i915/chv: Remove Wait for a
previous gfx force-off") from the drm-intel tree (which also appeared as
commit c9c52e24194a in Linus' tree before v4.0).

I fixed it up (I used the version from Linus' tree) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/XJp9r1T.vM2I2MuXYi+XlfM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVQDCkAAoJEMDTa8Ir7ZwVFbYP/1+PZ4zyMvMB8UUi7MSyzK32
bD6qjmcrlSoOEVMXK0lLhFrmrnNvFM/6Hu96Rp0W/fYbE24GBX5I6Hy/DLQh4nnz
j+Xw24aBzB6jqqWFvkKHWvUVtW+E+z1cfVhGqQXII5uLqAn7nz6lGLBA/JW4eBYw
Tdrd/qUj+7yYa6P1NHp1mA/OtGh4JUqCOVjknojbinLFyhvwlg8vJkoJUlAARreQ
j1VH8n/BA2MdGzwY8qdH+UMF5ZoE5nKURDDvfNQorxrD9G4ErdqMSklYGrNXLa2N
jDrESFzvillle+oUUt14pEbV58Spu8LQ+kJzGolopNG/KpFcIXE2rZHa75SMfJqI
8iek85S7u+SuibKU5TO35HauJO4IFdEYwjvKiSmbwHfOv1ZFpphfzEP5BiwObC0m
4rorwQKU0v2ERbkCmJNpf0aapzZX44C14E8cINg04q/g9KQDnSHDsPgfO7uPwUMu
uu3kzrQHAd2arD45nMPAZTeAyZQ0Nee6173B2Vm61VjIIwqQi6GycdBKItTxQJUI
b36W8gLthE//L/ZQ95PamFTaexSUdktaieuYrnYKFeFjsL0OhtLJbzTbshFIehY2
IT2dZjAKn1OrNx4KvDGOfI8X2wBkur3ZVpj9ixwsCC8R3dVXcLCrE4T2iqvAnXJp
wV6yd0LC2F+gfyJRl936
=BTdw
-----END PGP SIGNATURE-----

--Sig_/XJp9r1T.vM2I2MuXYi+XlfM--
