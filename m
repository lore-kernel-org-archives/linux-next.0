From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with
	Linus' tree
Date: Thu, 9 Jul 2015 11:02:42 +1000
Message-ID: <20150709110242.5515920c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1554641265=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--===============1554641265==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1+vtwlhx7FVY.HLN+6BnT_I"; protocol="application/pgp-signature"

--Sig_/1+vtwlhx7FVY.HLN+6BnT_I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem_gtt.c

between commit:

  00245266b4be ("drm/i915/ppgtt: Break loop in gen8_ppgtt_clear_range failu=
re path")

from Linus' tree and commit:

  567047be2a7e ("drm/i915/gtt: Use macros to access dma mapped pages")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/i915_gem_gtt.c
index dcc6a88c560e,ed65f24867b4..000000000000
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@@ -513,10 -583,9 +583,9 @@@ static void gen8_ppgtt_clear_range(stru
  	while (num_entries) {
  		struct i915_page_directory *pd;
  		struct i915_page_table *pt;
- 		struct page *page_table;
 =20
  		if (WARN_ON(!ppgtt->pdp.page_directory[pdpe]))
 -			continue;
 +			break;
 =20
  		pd =3D ppgtt->pdp.page_directory[pdpe];
 =20
@@@ -525,11 -594,9 +594,9 @@@
 =20
  		pt =3D pd->page_table[pde];
 =20
- 		if (WARN_ON(!pt->page))
+ 		if (WARN_ON(!px_page(pt)))
 -			continue;
 +			break;
 =20
- 		page_table =3D pt->page;
-=20
  		last_pte =3D pte + num_entries;
  		if (last_pte > GEN8_PTES)
  			last_pte =3D GEN8_PTES;

--Sig_/1+vtwlhx7FVY.HLN+6BnT_I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVncgyAAoJEMDTa8Ir7ZwVTfgP/R2YyZXcUWaXMeP70Qkoeln8
qsbJUt9AH88PWQdhtGCumAdj06p7HIbja3KcZucg4HAZgBwsmHdPAgcKJCWrELhS
SnuIHhqMErefBaHxbhI/xEnSTxyhnLSnSiYFIUitR+nVQmVjaIbkrHzhRqPQACsy
uiSACcZLF01aUPtbbVVlXP3K3f/mUEtJCXHZQymnStH1T4Gvtw6wASjOQy9wU4JI
FA2S0Yc0UjeUzI0OKmjK4SQh+wBgbb+k/21rlPxil3zadT8dzAGW6cLpwiHe//YE
yqn5UMK5tLvCD95lCKs6baL4ofNI7PlqOSoWcJ+bpUs3hKi+DHRF9TRsbSjXGknB
zkHM4knZuKW7cPRJmB91ezfpUZgV8J+vrRFnsEJYhCaKbVnHD7MDpJN5aBdX2ONN
eBkryrozdCGx0NIJeIFngxkIXxW3dtzk+HYSVR7LaRw+HyyjGa2edx/3Rr1Lteoy
tx3f4JkKyp8xVL8tmdPog9l0JO7hV/IMameeopjzjPHtmw2aG1q08uLVK/KF/AvF
ZP8MOFXbrSwidMcth6fEZt2aW5SU3JtJBU7WROOPCUXuMSXO3LzOfrzx0Qgtm9N2
+vi0Zp0BrX45SW8v/K/XX6fq5qhzFe6255yi3vNxThTb/S1SlxZK0wWDZz/EB2F/
Pk3BUvandXXrkc4LysU5
=TwQg
-----END PGP SIGNATURE-----

--Sig_/1+vtwlhx7FVY.HLN+6BnT_I--

--===============1554641265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK

--===============1554641265==--
