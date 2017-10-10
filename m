From: Mark Brown <broonie@kernel.org>
Subject: linux-next: build failure after merge of the drm-intel-fixes tree
Date: Tue, 10 Oct 2017 08:03:00 +0100
Message-ID: <20171010070300.6fsdy52752resxqn@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="smdyiiqfwdavppnr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:39996 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751872AbdJJHDN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2017 03:03:13 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--smdyiiqfwdavppnr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build
(x86_allmodconfig) failed like this:

  CC [M]  drivers/gpu/drm/i915/i915_gem_evict.o
drivers/gpu/drm/i915/i915_gem_evict.c: In function =E2=80=98i915_gem_evict_=
for_node=E2=80=99:
drivers/gpu/drm/i915/i915_gem_evict.c:318:31: error: implicit declaration o=
f function =E2=80=98i915_vma_has_userfault=E2=80=99; did you mean =E2=80=98=
i915_vma_pin_count=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   if (flags & PIN_NONFAULT && i915_vma_has_userfault(vma)) {
                               ^~~~~~~~~~~~~~~~~~~~~~
                               i915_vma_pin_count

Caused by commit

  72872c99b6dbc ("drm/i915: Check PIN_NONFAULT overlaps in evict_for_node")

in the drm-intel-fixes tree.  I've used the tree from yesterday.

--smdyiiqfwdavppnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnccKQACgkQJNaLcl1U
h9AJNAf/QyvH0rbhE+1KNm2Yf3Hr5nnLvajTZX73cWXsvL/v126M+SukgBaDwAus
YhJaqVO+Ti58G7pWKmWdH5C7b+q8jZ8b71/XHjWRGWe+53eWL8wuEKleW+RL7XgE
LbaScy/84IKhsBUH7+TPSagLf9v5zjcSSBETv+V/DtLnKMHFFXET+chyrul1i3qF
pMA32pjhzb1RDuGsH+cumCL9ehoym7yo9XI8YiNhq5bxnAWk0JVn1yH0hxdhaa0U
VbnzUaXpw9MnDkVtK02FDoEGk4jjHg/Y/OxaZwIcFl01qmHZqRtmBqWSAWmiy4Nl
KA1b+RNUh64JI2z5RYpnHTXfC2u0ig==
=HTDF
-----END PGP SIGNATURE-----

--smdyiiqfwdavppnr--
