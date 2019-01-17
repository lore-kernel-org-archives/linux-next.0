From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm tree
Date: Thu, 17 Jan 2019 12:59:41 +1100
Message-ID: <20190117125941.53019a72@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1735995676=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============1735995676==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QWdf.w6GxP5QwXP1pMV+fc9"; protocol="application/pgp-signature"

--Sig_/QWdf.w6GxP5QwXP1pMV+fc9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem.c

between commit:

  dd847a706974 ("drm/i915: Compile fix for 64b dma-fence seqno")

from the drm tree and commit:

  9f58892ea996 ("drm/i915: Pull all the reset functionality together into i=
915_reset.c")

from the drm-intel tree.

I fixed it up (the latter moved the code updated by the former, and the
fix has been already been applied to the moved code) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/QWdf.w6GxP5QwXP1pMV+fc9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw/4Y0ACgkQAVBC80lX
0Gy3KQf/cun/RYc5x5HTr9bxj3EsBlfFABGr3jeiUfwMHQ8+Pi1067vPfe6VpvZR
FXeQs/0marfS98+887p2i34kD0DgeVWtTiQ0uJYGZwlI78/RAStTKF3DHQrhSM9P
pCXEO448hejhxNMsZps4X9VfVZO92QrCNNlmxdk8+yWEoPRplvJg2AZWhqNV3QvI
kabWV1u5IhMdBMlmzwqsSoOpXqhOQI7HjAw0DCAkzq31tG2HcGHnP9ZGvCZ9CYJj
gb+CARQmVQAx4lRD/YwVJOhED6Kl65cahH1iyYVqdWXb9xMEIsdUCV+hH9hmuM0O
/RfgwOmHC8wgNdG67CZ/huYs4GkuNA==
=oo5X
-----END PGP SIGNATURE-----

--Sig_/QWdf.w6GxP5QwXP1pMV+fc9--

--===============1735995676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1735995676==--
