From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Mon, 16 Oct 2017 12:35:29 +0100
Message-ID: <20171016113529.ey35y6zwfyhdbvhe@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0459575060=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Mika Kuoppala <mika.kuoppala@intel.com>, Daniel Vetter <daniel.vetter@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--===============0459575060==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="erjjdcth2jt275nj"
Content-Disposition: inline


--erjjdcth2jt275nj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem.c

between commit:

  b85577b72837e ("drm/i915: Order two completing nop_submit_request")

=66rom the drm-intel-fixes tree and commit:

  5d031f4e1618b ("drm/i915: Stop asserting on set-wedged vs nop_submit_requ=
est ordering")

=66rom the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_ge=
m.c
index bace56523e9f..4fdebca8ff40 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -3089,20 +3089,14 @@ static void nop_submit_request(struct drm_i915_gem_=
request *request)
 {
 	unsigned long flags;
=20
-	GEM_BUG_ON(!i915_terminally_wedged(&request->i915->gpu_error));
 	dma_fence_set_error(&request->fence, -EIO);
-
-	spin_lock_irqsave(&request->engine->timeline->lock, flags);
-	__i915_gem_request_submit(request);
-	intel_engine_init_global_seqno(request->engine, request->global_seqno);
-	spin_unlock_irqrestore(&request->engine->timeline->lock, flags);
+	i915_gem_request_submit(request);
 }
=20
 static void nop_complete_submit_request(struct drm_i915_gem_request *reque=
st)
 {
 	unsigned long flags;
=20
-	GEM_BUG_ON(!i915_terminally_wedged(&request->i915->gpu_error));
 	dma_fence_set_error(&request->fence, -EIO);
=20
 	spin_lock_irqsave(&request->engine->timeline->lock, flags);

--erjjdcth2jt275nj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnkmYAACgkQJNaLcl1U
h9Dhegf/btyLcctUkGgMXoHoTh9tiQEhRAhIz52hkQHG69b0TSvZcGBggkuhP69e
QikQzMj0InQIKtEPG/Yq4sog8h/C4lceTcWJGaex/WTk2uJ9Y5v0kFoLc+y9Bkng
rIS/7grKBqPJWhICZlniVYnMfFD52b+qtCoygaP5Xv0fUKFenVVoLwUDl+lu3MC6
Qfi9wsu+7hW98Rj1bGbYPpl/sO15vpq11LnwbjsppOebKv60DBQM3oNdxaaSiZIH
nlZPCFcLYVtiTpp9Mu4M178tip1WwZzbgR4R+e8knmi5Cfj5qezQ2okL0Ly0stcu
8UQSa5JTkv5BImZRTri5zC72CZgHaQ==
=zmI5
-----END PGP SIGNATURE-----

--erjjdcth2jt275nj--

--===============0459575060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0459575060==--
