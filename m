From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Fri, 19 Apr 2013 15:50:34 +1000
Message-ID: <20130419155034.65910237bb4c0949786ad5cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__19_Apr_2013_15_50_34_+1000_TiuOERcNVeOOnx59"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:43467 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753064Ab3DSFut (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Apr 2013 01:50:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alon Levy <alevy@redhat.com>, Tejun Heo <tj@kernel.org>

--Signature=_Fri__19_Apr_2013_15_50_34_+1000_TiuOERcNVeOOnx59
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/gpu/drm/qxl/qxl_cmd.c: In function 'qxl_surface_id_alloc':
drivers/gpu/drm/qxl/qxl_cmd.c:442:2: warning: 'idr_pre_get' is deprecated (=
declared at include/linux/idr.h:149) [-Wdeprecated-declarations]
drivers/gpu/drm/qxl/qxl_cmd.c:449:2: warning: 'idr_get_new_above' is deprec=
ated (declared at include/linux/idr.h:164) [-Wdeprecated-declarations]
drivers/gpu/drm/qxl/qxl_release.c: In function 'qxl_release_alloc':
drivers/gpu/drm/qxl/qxl_release.c:60:2: warning: 'idr_pre_get' is deprecate=
d (declared at include/linux/idr.h:149) [-Wdeprecated-declarations]
drivers/gpu/drm/qxl/qxl_release.c:66:2: warning: 'idr_get_new_above' is dep=
recated (declared at include/linux/idr.h:164) [-Wdeprecated-declarations]

Introduced by commit f64122c1f6ad ("drm: add new QXL driver. (v1.4)").
The above idr_ reoutines were marked deprecated by commit c8615d3716fe
("idr: deprecate idr_pre_get() and idr_get_new[_above]()") between
v3.9-rc2 and -rc3.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__19_Apr_2013_15_50_34_+1000_TiuOERcNVeOOnx59
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRcNsqAAoJEECxmPOUX5FEpi0P/1hFOCWU8K2aKMRC3FsvQFTn
g6EPkGB4OZZ2bmQNEFLYRNp3qeCT8pT6Nmy7+aFNxLtdZgh0q3qZnVWxJVcSHq8/
09/6Au0IQT9Ev/zSDm3o9/r/zhJrIUaeKOAilA5kjDPE7tOEer97sCjbEgmCLCFO
liXl89HCbPEJtnTmwRfZHa5O3mGngHaTznlpn2XZ6IdZ/AGCQ0R95e34Avh4rhTv
woDhVaBvj/GLRKFj4ENvp11pOgRaCT0fQ5OEkTUn2PEWXHwJvPXZYSdUk1v/SlQV
lz2bC5Ns48Lo5oXGmQc/wf+cRr6D+d9CcfCEF+bjCwRi0S8Ka3T8DRn54OqwH+L+
2rPnxyDJwI1Ef7NBFmBUVQLtShKnJaY0Rm1r3mY5AdLQJiNU2ITJgSdWnk5p23D+
W2jKEqFwjDLABEOXe6Sra1Te/ZEAKanYAQveZUkP4abi2Uv5QE3ELliLQT4LAQWJ
1bK4UqiAcf84dprmaRp6PXzF2am6oP5S98Jb5vxaVQ4voVa1+8aGJu/8NV2BEN3W
TpasgANaOipYshloqqKiGFkLhoKzthbO7M+pjKR/xQqZAxYsaPeFpU5gSjkrljbl
xxEqZnUk+WzRZ9TjmcgjjLT+0KNvgJXUFKpmPp8JG3M4wHLPd0JG1RtifjfjA5MX
WIk7e8kZTFXc6+iuxkP/
=Q81f
-----END PGP SIGNATURE-----

--Signature=_Fri__19_Apr_2013_15_50_34_+1000_TiuOERcNVeOOnx59--
