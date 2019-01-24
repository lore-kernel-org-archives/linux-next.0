From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the
 drm-intel-fixes tree
Date: Thu, 24 Jan 2019 22:19:49 +1100
Message-ID: <20190124221949.4c89542a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0977476896=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============0977476896==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7qoanAhA0ZHpgGlz=eH3LyR"; protocol="application/pgp-signature"

--Sig_/7qoanAhA0ZHpgGlz=eH3LyR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0f7555121609 ("drm/i915/gvt: release shadow batch buffer and wa_ctx befor=
e destroy one workload")

Fixes tag

  Fixes: 0cce2823ed37 ("drm/i915/gvt/kvmgt:Refine error handling for prepar=
e_execlist_workload")

has these problem(s):

  - Subject does not match target commit subject

Just some whitespace.

--=20
Cheers,
Stephen Rothwell

--Sig_/7qoanAhA0ZHpgGlz=eH3LyR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxJn1UACgkQAVBC80lX
0Gw1Ogf9Gh2sv35SuCnhKYg+w/8FnMOvWbfSFu3gmWsmah0PTbKLnpcfPfhoCW75
uTuD+ET7KEWT2SeXQIm+Xa6WCSGIAl3eyq8MucF+ZUAcmlGSVdEW+KI+4ND8OlaR
3/gyp0NWtSWY/FRVsDnSCBuLRIhD9fNDrs9vU54UeDbsKnMUrbfILlj3chskiEeo
kawthx0UC6DIaZuIajEUV2FM2Mm0Jwf1meFcMwhblkCsxy/flwNGOEse8FQjrYQb
mozEZfHlP6oVyNGTOXHqFlYTFxLRp1TxrTQdTfoorWuw6tKmMvkeE5ruqzkCxWoe
QAEeRK0GliNme3UIq9gmZxNi4quL8g==
=AIv0
-----END PGP SIGNATURE-----

--Sig_/7qoanAhA0ZHpgGlz=eH3LyR--

--===============0977476896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0977476896==--
