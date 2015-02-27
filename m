From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Fri, 27 Feb 2015 11:36:45 +1100
Message-ID: <20150227113645.4fe105c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BiELhZ_gc8jbZ8hFOPDPq8H"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Hoath <nicholas.hoath@intel.com>, Jani Nikula <jani.nikula@intel.com>, John Harrison <John.C.Harrison@Intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/BiELhZ_gc8jbZ8hFOPDPq8H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in
drivers/gpu/drm/i915/i915_drv.h between commit b3a38998f042 ("drm/i915:
Fix a use after free, and unbalanced refcounting") from the
drm-intel-fixes tree and commit 98e1bd4ae68e ("drm/i915: Cache ringbuf
pointer in request structure") from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/i915_drv.h
index 8727086cf48c,239a382c8b55..000000000000
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@@ -2140,17 -2156,9 +2159,18 @@@ struct drm_i915_gem_request=20
  	/** Position in the ringbuffer of the end of the whole request */
  	u32 tail;
 =20
 -	/** Context and ring buffer related to this request */
 +	/**
- 	 * Context related to this request
++	 * Context and ring buffer related to this request
 +	 * Contexts are refcounted, so when this request is associated with a
 +	 * context, we must increment the context's refcount, to guarantee that
 +	 * it persists while any request is linked to it. Requests themselves
 +	 * are also refcounted, so the request will only be freed when the last
 +	 * reference to it is dismissed, and the code in
 +	 * i915_gem_request_free() will then decrement the refcount on the
 +	 * context.
 +	 */
  	struct intel_context *ctx;
+ 	struct intel_ringbuffer *ringbuf;
 =20
  	/** Batch buffer related to this request if any */
  	struct drm_i915_gem_object *batch_obj;

--Sig_/BiELhZ_gc8jbZ8hFOPDPq8H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU77wkAAoJEMDTa8Ir7ZwVZh8P/Ro4ZqWVyW8Ky3hHcDV320me
4oSuCnH+13T6EimP0nA2+CXSBU/fs4UW0Z5LwA/Z6WIKAzhAS2Q/e/oHvb+6oqxZ
6gVDAB2OJHrG6WyLHcj80N56UVdWRVpCPUrkB07b5v4DSm5qmoJiFI5TYQyvlzU2
AN+AB4AYQgnr1Eyg5TyK59qWx7J0ORoPy/GoKxP9jCJSq0oFkzL73JtlVlPtiVft
eGTegVMeSuZpI6kl5T/SjsV0nE329KgZE5uw8rzCkRxNQDi2yKogRKSjDlTZ7Cab
vZS1XmZng1vxPuAEEqgihF02KcH6k9DFjSuKBZrK2SXCAwDpHsy+klirCiXDWQhW
xRJv31XBnKIaR3Jt76JUfDaO3UWBsh7k1RACFKj5EiqtJUxgx7/W+70qE89VeoG+
YSdYDbC+jlWPji1LFoFLJAYu79U7mdaopCEmQQ92h5B3lLMIJZWvPRKFuxWQqAkc
bJoYkjkXfP4fW1I8kGw9WQuG2zv+zp3Fme/woypW/0kxyCyuw4jYry1ih/uRErcl
F1ef/7G9K3qk6OxUOd6aPbmrcU6rUcKbD4W+uzGehpjOucXQ8SsvXWwSXiJRSF3r
li8Epa9FsGItH5Rn2KkfzYdtCNSFJCGJq19iAMQkndoD8IMBYcCN3gE2S90g7AIp
yHhDf5xSPwuifbFOJYni
=ssWe
-----END PGP SIGNATURE-----

--Sig_/BiELhZ_gc8jbZ8hFOPDPq8H--
