From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the
 drm-intel-fixes tree
Date: Tue, 29 May 2018 19:26:05 +1000
Message-ID: <20180529192605.617c02ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1704326345=="
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
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============1704326345==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/C=bjP5uMK_k8xipbnaS4_.Y"; protocol="application/pgp-signature"

--Sig_/C=bjP5uMK_k8xipbnaS4_.Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build (i386
defconfig) failed like this:

In file included from include/asm-generic/barrier.h:20:0,
                 from arch/x86/include/asm/barrier.h:86,
                 from include/linux/nospec.h:8,
                 from drivers/gpu/drm/i915/i915_query.c:7:
drivers/gpu/drm/i915/i915_query.c: In function 'i915_query_ioctl':
include/linux/compiler.h:339:38: error: call to '__compiletime_assert_119' =
declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(lon=
g)
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:319:4: note: in definition of macro '__compiletime=
_assert'
    prefix ## suffix();    \
    ^~~~~~
include/linux/compiler.h:339:2: note: in expansion of macro '_compiletime_a=
ssert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_a=
ssert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:69:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
  ^~~~~~~~~~~~~~~~
include/linux/nospec.h:55:2: note: in expansion of macro 'BUILD_BUG_ON'
  BUILD_BUG_ON(sizeof(_i) > sizeof(long));   \
  ^~~~~~~~~~~~
drivers/gpu/drm/i915/i915_query.c:118:15: note: in expansion of macro 'arra=
y_index_nospec'
    func_idx =3D array_index_nospec(func_idx,
               ^~~~~~~~~~~~~~~~~~

Caused by commit

  540ead8c5a0e ("drm/i915/query: Protect tainted function pointer lookup")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/C=bjP5uMK_k8xipbnaS4_.Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsNHK0ACgkQAVBC80lX
0GxbfAf/aW0t+Cog+xXV2bF0jx/8lTxDNwON9evT5G5uUxOdX5vzY0sLb6SZruZ2
OqI8M0e8JXOhp24VOsR/Uw+duDpHEpGUvNPNNY1uI4r8BUiRl+RnRTHpVFLZ7Twg
ar6NC0R9EXXoLijVXEeilqPTDUQmvdJ37l+O28rck1bIAjBcOwGcHE9llmpqHETe
BrsjL0epyZDVlwVW3g9ab4osxmzdcpmSGvAhOSBA/bJiuS3LYoAS4bpFFTiwr7Fi
EnG6t6aKLhTiP7c7U9rLl6Bb3QFIPkJq6SsvAZvMjh51+1L/dv5x01YV+UwfiPZe
hqlMOLWGXJiDdLJCdnr3uQYBJmffgQ==
=XJ3A
-----END PGP SIGNATURE-----

--Sig_/C=bjP5uMK_k8xipbnaS4_.Y--

--===============1704326345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1704326345==--
