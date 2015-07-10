From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Fri, 10 Jul 2015 12:15:19 +1000
Message-ID: <20150710121519.498ffbec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oTpFkglFe4ngw5JTEo9D/B/"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60996 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751237AbbGJCP2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jul 2015 22:15:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Elf <tomas.elf@intel.com>, John Harrison <John.C.Harrison@Intel.com>

--Sig_/oTpFkglFe4ngw5JTEo9D/B/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_ringbuffer.h

between commit:

  ee412ecc74c4 ("drm/i915: Snapshot seqno of most recently submitted reques=
t.")

from the drm-intel-fixes tree and commit:

  bccca494f75c ("drm/i915: Remove the now obsolete 'outstanding_lazy_reques=
t'")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_ringbuffer.h
index 4be66f60504d,0ea89ea30182..000000000000
--- a/drivers/gpu/drm/i915/intel_ringbuffer.h
+++ b/drivers/gpu/drm/i915/intel_ringbuffer.h
@@@ -271,17 -292,6 +292,13 @@@ struct  intel_engine_cs=20
  	 */
  	struct list_head request_list;
 =20
 +	/**
- 	 * Do we have some not yet emitted requests outstanding?
- 	 */
- 	struct drm_i915_gem_request *outstanding_lazy_request;
- 	/**
 +	 * Seqno of request most recently submitted to request_list.
 +	 * Used exclusively by hang checker to avoid grabbing lock while
 +	 * inspecting request list.
 +	 */
 +	u32 last_submitted_seqno;
 +
  	bool gpu_caches_dirty;
 =20
  	wait_queue_head_t irq_queue;

--Sig_/oTpFkglFe4ngw5JTEo9D/B/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVnyq/AAoJEMDTa8Ir7ZwVsykP/RxQYDdQ/0E6GU/WoB98JWdL
YgT6qj7XkWTSoa2Aw3gzmpq5nrAoUl9jGIG0PtxJ1cur9RULppH5kUDpLdW25VzI
pILLlO7o3C6Ksv3hQh/l3kxF1EW6Fwub7A2S8SPFx81igtUcyuUfYW7jbqJ/IODk
Ouc0lWLXnja6Coxn/vc4lTV9d+YdEwPDOYGWlyeGP7TmOKo/0upTXf+nSmSJXEco
1oEdpc4wJZLDsat1xjS/bBifjOoaalzRgTFrKOirGh9oehRypXOCR9youAOl0lbz
R4PlAhpvwZXp+shrgrDxOfQ4IIVGIHsqbfFDq13JAqPw+PH8F3OZdiYR95SePTqB
2F0Kx+aRqKMKyV90xjsl6uSjUHttl7U2AQqd863h0A7z2KxB7FD1q10f1gidbYRw
OnYlUiHtUeUsog8YP7ylAEVZWAtPwDUI5j9ewHkj7FSD2aiXLrf55gsa/XvM+Hi+
BHDNHwnktCRFP1QOQ6Z3VERN7qjlyzahcTRyiwKxN+0w8Rz0lLt+wa9tPqxskHcT
L7mKtzCHtJojK5qZ8f8gJXLYEL1VZlPkHf+ms83sgkq0LTmAPhQqiXQrRy4yN7Bv
O2yUDNyMaWv63vkE/BU43Q/PlhEo2mfhPwrSNQuDNfbdBIUjqPhRcdXFerJhrWr1
r7Ayr/n06i/RVLOghZMQ
=LOAM
-----END PGP SIGNATURE-----

--Sig_/oTpFkglFe4ngw5JTEo9D/B/--
