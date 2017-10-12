From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Thu, 12 Oct 2017 19:44:25 +0100
Message-ID: <20171012184425.hfzhcefiymldxvis@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0219263006=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--===============0219263006==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="72qbokzgnmt37brh"
Content-Disposition: inline


--72qbokzgnmt37brh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem.c

between commit:

  b85577b72837ee ("drm/i915: Order two completing nop_submit_request")

=66rom the drm-intel-fixes tree and commit:

  af7a8ffad9c58d ("drm/i915: Use rcu instead of stop_machine in set_wedged")

=66rom the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/i915_gem.c
index d5e58d4a5950,20fcac37c85a..000000000000
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@@ -3019,36 -3090,24 +3092,27 @@@ static void nop_submit_request(struct d
  	GEM_BUG_ON(!i915_terminally_wedged(&request->i915->gpu_error));
  	dma_fence_set_error(&request->fence, -EIO);
 =20
 -	i915_gem_request_submit(request);
 +	spin_lock_irqsave(&request->engine->timeline->lock, flags);
 +	__i915_gem_request_submit(request);
 +	intel_engine_init_global_seqno(request->engine, request->global_seqno);
 +	spin_unlock_irqrestore(&request->engine->timeline->lock, flags);
  }
 =20
- static void engine_set_wedged(struct intel_engine_cs *engine)
+ static void nop_complete_submit_request(struct drm_i915_gem_request *requ=
est)
  {
- 	/* We need to be sure that no thread is running the old callback as
- 	 * we install the nop handler (otherwise we would submit a request
- 	 * to hardware that will never complete). In order to prevent this
- 	 * race, we wait until the machine is idle before making the swap
- 	 * (using stop_machine()).
- 	 */
- 	engine->submit_request =3D nop_submit_request;
+ 	unsigned long flags;
 =20
- 	/* Mark all executing requests as skipped */
- 	engine->cancel_requests(engine);
+ 	GEM_BUG_ON(!i915_terminally_wedged(&request->i915->gpu_error));
+ 	dma_fence_set_error(&request->fence, -EIO);
 =20
- 	/* Mark all pending requests as complete so that any concurrent
- 	 * (lockless) lookup doesn't try and wait upon the request as we
- 	 * reset it.
- 	 */
- 	intel_engine_init_global_seqno(engine,
- 				       intel_engine_last_submit(engine));
+ 	spin_lock_irqsave(&request->engine->timeline->lock, flags);
+ 	__i915_gem_request_submit(request);
+ 	intel_engine_init_global_seqno(request->engine, request->global_seqno);
+ 	spin_unlock_irqrestore(&request->engine->timeline->lock, flags);
  }
 =20
- static int __i915_gem_set_wedged_BKL(void *data)
+ void i915_gem_set_wedged(struct drm_i915_private *i915)
  {
- 	struct drm_i915_private *i915 =3D data;
  	struct intel_engine_cs *engine;
  	enum intel_engine_id id;
 =20

--72qbokzgnmt37brh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnfuAkACgkQJNaLcl1U
h9CMswf/RA5gkjOwEoNLAb3BSKbxG8JaHoGpW+DDfTW2YkaKiDeLXtBHaUMohinp
UFV7KrmwVKlZFLmQdUdmNL8yhaFUrEbRmwALZ/gJyIos6QdK696s4CVCRknFkUfO
lfh1He1DCwA9zpbEAV/rvAMUcq9GutNV3h6AMka6Bro0X34ZzzVmb93Zxc0kvaYs
ZinxzqGgUO2odNrQtFM3KTDMfUPGdvra9IoLjRxYDVXcncd8uekE9SVLqE7wDYgg
u3YP7EzfFxnMUW/BluNmjqNRZ/jE1PSWjU+1HCePLdGrB3CZ7weJ3f7BIVpRgpDM
jQrDXkGXu1w0swoAzyk1rSNZ0zP5BA==
=sQW0
-----END PGP SIGNATURE-----

--72qbokzgnmt37brh--

--===============0219263006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0219263006==--
