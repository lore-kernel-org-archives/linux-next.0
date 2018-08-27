From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the
 drm-misc-fixes tree
Date: Tue, 28 Aug 2018 07:29:59 +1000
Message-ID: <20180828072959.631b9dbc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1532324455=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============1532324455==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PCFkTqzhSdopWUKOD51uFl/"; protocol="application/pgp-signature"

--Sig_/PCFkTqzhSdopWUKOD51uFl/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ccb748df0058 ("drm/vc4: Fix the "no scaling" case on multi-planar YUV for=
mats")

is missing a Signed-off-by from its committer.

It was rebased.

--=20
Cheers,
Stephen Rothwell

--Sig_/PCFkTqzhSdopWUKOD51uFl/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluEbVcACgkQAVBC80lX
0Gw1Pwf+Pg65ZhXa8nahH6ItMVHmPSfVCkMGowDKOAsht67r+xhXOEZC7cmvzcez
K0wxvKyVpSy3bYXpmSMnfbkbYosgn4LiKiJnyaLy8mi0Cz57G37ntn+LNgo+mGf7
DKeHxFMthDG5GSxcgqZql0aJHL/Nra1CGnovDlIhzWGA1tYyLKNwguiI7Uf/pA8a
i4LkBIdWdQFh6xr4OFreB4fAdhy57Ee8JH0S2KTJ5SP0B7Agg+jBiCoX023VXF7k
m1l8ljV/MpRzI/8QAXYXGXne96WZnuS4SKwqVwEUiVSVKXcEwnHyOQ9LJyp7o4MX
wpkW+d6uuz5m+AjQPVQVYBN94ROcMA==
=fgO+
-----END PGP SIGNATURE-----

--Sig_/PCFkTqzhSdopWUKOD51uFl/--

--===============1532324455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1532324455==--
