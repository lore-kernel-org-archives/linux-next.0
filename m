From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc
 tree
Date: Fri, 8 Feb 2019 12:38:15 +1100
Message-ID: <20190208123815.64757bc5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0798674301=="
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============0798674301==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s41kT1wJ9KiC_S1fzk_H/T9"; protocol="application/pgp-signature"

--Sig_/s41kT1wJ9KiC_S1fzk_H/T9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/gpu/drm/arm/display/komeda/komeda_drv.c:13:
drivers/gpu/drm/arm/display/komeda/komeda_kms.h:87:20: error: field 'base' =
has incomplete type
  struct drm_device base;
                    ^~~~
drivers/gpu/drm/arm/display/komeda/komeda_dev.c: In function 'komeda_parse_=
pipe_dt':
drivers/gpu/drm/arm/display/komeda/komeda_dev.c:27:3: error: implicit decla=
ration of function 'DRM_ERROR'; did you mean 'DRM_IOR'? [-Werror=3Dimplicit=
-function-declaration]
   DRM_ERROR("get aclk for pipeline %d failed!\n", pipe_id);
   ^~~~~~~~~
   DRM_IOR
drivers/gpu/drm/arm/display/komeda/komeda_dev.c: In function 'komeda_dev_cr=
eate':
drivers/gpu/drm/arm/display/komeda/komeda_dev.c:127:2: error: implicit decl=
aration of function 'DRM_INFO'; did you mean 'DRM_IO'? [-Werror=3Dimplicit-=
function-declaration]
  DRM_INFO("Found ARM Mali-D%x version r%dp%d\n",
  ^~~~~~~~
  DRM_IO
drivers/gpu/drm/arm/display/komeda/komeda_dev.c: In function 'komeda_dev_de=
stroy':
drivers/gpu/drm/arm/display/komeda/komeda_dev.c:170:3: error: implicit decl=
aration of function 'devm_iounmap'; did you mean 'pci_iounmap'? [-Werror=3D=
implicit-function-declaration]
   devm_iounmap(dev, mdev->reg_base);
   ^~~~~~~~~~~~
   pci_iounmap

and lots more ...

Probably caused by commit

  e3b01f0d576a ("drm: remove drmP.h from drm_modeset_helper.h")

I have used the drm-misc tree from next-20190207 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/s41kT1wJ9KiC_S1fzk_H/T9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxc3YcACgkQAVBC80lX
0GwvPQf/e7ynhE4kY26XTf2XYCZR6ASXbbQb4Zmu5M+5/3q/wXB7sjheG0B7jCmf
LpLw3V+8bSAQ4Sx3+Qpdivt3LVfSupVLJH+36EB4twobks/Oj3K88HhbHHJoqFiK
fu10/NKZXJj46BO3/dHpEDFC8mPT0J0FnF60sAD2tgjZaO46h4l7jnekrEzWka37
rVTrAj+Fm6OTJQuTE9xpKU6wmzMmi4Y7RL9qgpYemphk6GpDSZPz6kttzSWLp++w
mczWlug1Yt+iaX7cODTtP/WNNDq9vGG1+ax/yihR1NoPQpvSLyKud6Nn1t0VmRix
C+71fRY8UudG1wETkmeihM3lDMsycQ==
=N8EN
-----END PGP SIGNATURE-----

--Sig_/s41kT1wJ9KiC_S1fzk_H/T9--

--===============0798674301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0798674301==--
