From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Date: Mon, 16 Mar 2015 13:30:49 +1100
Message-ID: <20150316133049.39f516f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cN6Mw=rC+sv8FQwuU1nsUMj"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50646 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752060AbbCPCa6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Mar 2015 22:30:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xi Ruoyao <xry111@outlook.com>, Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Damien Lespiau <damien.lespiau@intel.com>

--Sig_/cN6Mw=rC+sv8FQwuU1nsUMj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/i915/intel_display.c between commit 2dccc9898d45
("drm/i915: Ensure plane->state->fb stays in sync with plane->fb") from
the drm-intel-fixes tree and commit afd65eb4cc05 ("drm/i915: Ensure
plane->state->fb stays in sync with plane->fb"), f55548b5af87
("drm/i915: Don't try to reference the fb in
get_initial_plane_config()") and presumably others from the drm tree.

Same patch summary, different authors, committers and added function.

I fixed it up (I effectively used the drm tree version) and can carry
the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/cN6Mw=rC+sv8FQwuU1nsUMj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVBkBfAAoJEMDTa8Ir7ZwVcB4P/1wjQFyAWuJN3S2btvuY0dsm
MHDRPzuZC9kpCYjOLmAK9ZwnKb64QEGqzk2Xhlc48+NqO4CjBQPqmrHdyfO8FxMx
rSY7HSnpSutlpglDNNO8i3ket2pdcJ9sykQjYehzH8xudisCZ4EwwRd/EWFvh57h
n5Dw2QNbSMPUc0gFtm/SXVfZ2aQIEJCzOBfWg9EvMaMUln3b/llXPOMTB1JoiNKt
2CWjoy8LKouuHEs0yTtGQeIqrrzNXq5gDDsAtOwlSV9QbVu7yqpNJ4QSnhfYrrez
XYwKiSwv6HIT4ZK7mvyo7zq0Hw04a/ItiM6SwgaZeoTD7AGWYi7RvvletUhruIkM
K/N4JGU7U5yFld3JAqT3Os+dBo3+x7OT3DSS3vTNM4AWX8ZIufnYPIDYDkMj9Xdo
+Sm9+Hj/UAI6ATrYbB/9LjrMFujcRPI4u+Jey9ee/G6vMiYMJbJSZE922K8jfebY
fOFuR6EVBNP9jvmNLCzsDeop2cbQ5kSrYAWW5CatNrSj8uj7hMB4MqwJ+s5H5u0A
Q6666e+ZZY0wElzApklsJpdwLNvQvrIhfAn6V9VJO76IRIPQ3i0pmQ2n7mmLw6iJ
lwoQOhX9jz+ZmilcoUUpT8tqVKD60/E1jEZzBAyhe12VwPb/rMKKK269opVC7B88
x6RMyWuOFfIonyo3LZmp
=3vzF
-----END PGP SIGNATURE-----

--Sig_/cN6Mw=rC+sv8FQwuU1nsUMj--
