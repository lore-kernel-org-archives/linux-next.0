From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Thu, 6 Dec 2018 13:32:19 +1100
Message-ID: <20181206133219.38831da4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0484532001=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
List-Id: linux-next.vger.kernel.org

--===============0484532001==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N/bz7Y.YD8Jkk/pYlHSFz8u"; protocol="application/pgp-signature"

--Sig_/N/bz7Y.YD8Jkk/pYlHSFz8u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/v3d/v3d_gem.c: In function 'v3d_submit_tfu_ioctl':
drivers/gpu/drm/v3d/v3d_gem.c:719:3: error: too many arguments to function =
'drm_syncobj_replace_fence'
   drm_syncobj_replace_fence(sync_out, 0, sched_done_fence);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/v3d/v3d_gem.c:5:
include/drm/drm_syncobj.h:134:6: note: declared here
 void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
      ^~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  0b258ed1a219 ("drm: revert "expand replace_fence to support timeline poin=
t v2"")

interacting with commit

  1584f16ca96e ("drm/v3d: Add support for submitting jobs to the TFU")

I have used the drm-misc tree from next-20181205 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/N/bz7Y.YD8Jkk/pYlHSFz8u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwIijMACgkQAVBC80lX
0GwVDQgAmAs8Nz/iBd6O/d7XiFYV240NSdOX/IUrgvghucx6+TSzsB1gvsjGSqhY
bY1ZGF7QP+ZseMXfrUupTBXgTXjMoT5Eolp2YUUttnFj9Fpud1LdtDEvER+/Wldd
P4UgtRXCKm0l+5K5xfaawp5/SPs+VfP19hSMApkLLrqqrOu/c1V8haM71DaqpdcF
ERWuhzyqlm6AmNK6jJpGOrjkTDq7/pS4vxxfT1rZPWJQRBTw7P0vwowHbbaTkxSE
JpF5PEmrl+Bo/0W/V1PyZ5xysLEENEBkTjlEBtMs1+2R5ERPgWVB8L6zfqam9Frs
lp+Ohs9cx3+4ejHlz2ZfTuhc/yGzEg==
=+1Y2
-----END PGP SIGNATURE-----

--Sig_/N/bz7Y.YD8Jkk/pYlHSFz8u--

--===============0484532001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0484532001==--
