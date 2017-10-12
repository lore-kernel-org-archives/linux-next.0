From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Thu, 12 Oct 2017 19:36:32 +0100
Message-ID: <20171012183632.nwnqbvtnlq4iehia@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0014179091=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--===============0014179091==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="njax3q2cnnsqm7xw"
Content-Disposition: inline


--njax3q2cnnsqm7xw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commit:

   7b50f7b24cd6c ("rm/i915: Read timings from the correct transcoder in int=
el_crtc_mode_get()")

=66rom the drm-intel-fixes tree and commit:

   de330815677d8 ("drm/i915: Reuse normal state readout for LVDS/DVO fixed =
mode")

=66rom the drm-intel tree.

I fixed it up by taking the version from the drm-intel tree and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--njax3q2cnnsqm7xw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnfti8ACgkQJNaLcl1U
h9BxGgf/dHhVVWCJkmxnDqQD64O5phlKkym6of0k/1ILhsGCzULj/QixlLKn/H/C
P8q0MWFaMbU1CpzOm6j3+gS+khKr1Lh3LIQe1EqY6xVZ+JVEFiKoIu+sZDSwvSB4
nASocSMO7CjOX+5JYJv+LAL16AjXCO50BFcJm2boglXsVt+ykFT+b+VVBV1QUQ8l
HObQf6Z73OuWN4haUsN6LRnWkYp7PJbB51frP/Y/iY6MWoPZm+Ye06J9N0Bsd6DL
7ux01aP7LXHlRmkhfEGtQYUflZqD+M76V9fIQ2Bbppz+0ozVfJ5z6mZ7fG0e88O6
fP0Go5bkSIDFDAFyAUXX/XjNeHWdgA==
=XWYz
-----END PGP SIGNATURE-----

--njax3q2cnnsqm7xw--

--===============0014179091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0014179091==--
