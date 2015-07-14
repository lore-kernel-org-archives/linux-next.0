From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the drm-misc tree
Date: Tue, 14 Jul 2015 13:05:03 +1000
Message-ID: <20150714130503.0d1ef33a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0974260863=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--===============0974260863==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QYOGD4LgaBoj2tzUDNT/F5F"; protocol="application/pgp-signature"

--Sig_/QYOGD4LgaBoj2tzUDNT/F5F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/gpu/drm/bochs/bochs_fbdev.c: In function 'bochsfb_create':
drivers/gpu/drm/bochs/bochs_fbdev.c:63:17: warning: unused variable 'device=
' [-Wunused-variable]
  struct device *device =3D &dev->pdev->dev;
                 ^

Caused by commit

  394111a2b303 ("drm/boschs: Use new drm_fb_helper functions")

drivers/gpu/drm/cirrus/cirrus_fbdev.c: In function 'cirrusfb_create':
drivers/gpu/drm/cirrus/cirrus_fbdev.c:247:1: warning: label 'out_iounmap' d=
efined but not used [-Wunused-label]
 out_iounmap:
 ^

Caused by commit
  fd6ab591ce15 ("drm/cirrus: Use new drm_fb_helper functions")

drivers/gpu/drm/ast/ast_fb.c: In function 'astfb_create':
drivers/gpu/drm/ast/ast_fb.c:196:17: warning: unused variable 'device' [-Wu=
nused-variable]
  struct device *device =3D &dev->pdev->dev;
                 ^

Caused by commit

  6f4900cd28c9 ("drm/ast: Use new drm_fb_helper functions")

drivers/gpu/drm/gma500/framebuffer.c: In function 'psbfb_create':
drivers/gpu/drm/gma500/framebuffer.c:346:17: warning: unused variable 'devi=
ce' [-Wunused-variable]
  struct device *device =3D &dev->pdev->dev;
                 ^

Caused by commit

  3b9a13e85365 ("drm/gma500: Use new drm_fb_helper functions")

drivers/gpu/drm/mgag200/mgag200_fb.c: In function 'mgag200fb_create':
drivers/gpu/drm/mgag200/mgag200_fb.c:232:1: warning: label 'out' defined bu=
t not used [-Wunused-label]
 out:
 ^
drivers/gpu/drm/mgag200/mgag200_fb.c:169:17: warning: unused variable 'devi=
ce' [-Wunused-variable]
  struct device *device =3D &dev->pdev->dev;
                 ^

Caused by commit

  53ebb642ccba ("drm/mgag200: Use new drm_fb_helper functions")

drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c: In function 'amdgpufb_create':
drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c:206:9: warning: passing argument 1 o=
f 'PTR_ERR' makes pointer from integer without a cast
   ret =3D PTR_ERR(ret);
         ^
In file included from arch/x86/include/asm/processor.h:31:0,
                 from arch/x86/include/asm/thread_info.h:49,
                 from include/linux/thread_info.h:54,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:64,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:35,
                 from include/linux/time.h:5,
                 from include/linux/stat.h:18,
                 from include/linux/module.h:10,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c:26:
include/linux/err.h:28:33: note: expected 'const void *' but argument is of=
 type 'int'
 static inline long __must_check PTR_ERR(__force const void *ptr)
                                 ^
drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c:182:17: warning: unused variable 'de=
vice' [-Wunused-variable]
  struct device *device =3D &adev->pdev->dev;
                 ^
drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c: In function 'amdgpu_fbdev_destroy':
drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c:283:18: warning: unused variable 'in=
fo' [-Wunused-variable]
  struct fb_info *info;
                  ^

Caused by commit

  9d70561ba3b1 ("drm/amdgpu: Use new drm_fb_helper functions")

drivers/gpu/drm/udl/udl_fb.c: In function 'udlfb_create':
drivers/gpu/drm/udl/udl_fb.c:479:17: warning: unused variable 'device' [-Wu=
nused-variable]
  struct device *device =3D dev->dev;
                 ^

Caused by commit

  457959f2ed5f ("drm/udl: Use new drm_fb_helper functions")

drivers/gpu/drm/radeon/radeon_fb.c: In function 'radeonfb_create':
drivers/gpu/drm/radeon/radeon_fb.c:230:17: warning: unused variable 'device=
' [-Wunused-variable]
  struct device *device =3D &rdev->pdev->dev;
                 ^

Caused by commit

  4bc29bb98bae ("drm/radeon: Use new drm_fb_helper functions")

drivers/gpu/drm/nouveau/nouveau_fbcon.c: In function 'nouveau_fbcon_create':
drivers/gpu/drm/nouveau/nouveau_fbcon.c:322:18: warning: unused variable 'p=
dev' [-Wunused-variable]
  struct pci_dev *pdev =3D dev->pdev;
                  ^

Caused by commit

  237fc6452ca5 ("drm/nouveau: Use new drm_fb_helper functions")

I think "COMPILE TESTED ONLY" should at least include eliminating such
warnings ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/QYOGD4LgaBoj2tzUDNT/F5F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVpHxkAAoJEMDTa8Ir7ZwVmpYP/36lT0AvPNHPSj/gi1swMmoB
CvgDqdzhpfajbSjHgtVfC2QROTIig4WEkwpGphTAt86vkRm9fmiEJ9l7Kqf+rf6r
ZFnz4eIndsRaG0KVB+mbfCsZEz42N0bwAR4cI8sEvvDq8bvUMXMj55xOiM+rMJsY
fGD738V3niovn3SF28ReFr3AUmxbY5/lcH/EYnIF4ri9fVdbDZNJ3t7iVOgATTdq
29LsNHiVErbU3pFJ3VQGVLeCpfC8M1j89H6cLUTpodCGT9eH60ozH94eGPrND0Jt
tkmxXuE2tlWUWSB959VMB2/bWFSpUwD7jGabA473yBXtfgUobKUsMmHinrE3Bgbf
QzqefJJPyM3EvNYdwEdeKmNYWMgSbEZ1q46HywAU6sPPJ/wT3mKeh/pTTji/jJYq
k9ugvraDsvtBrtP7giQ4Mk3uuq3LwCRlvHXuqTUFUBpwepGx5w3jIfQ8+wPXBYlN
hPy5OA9KxVUc4TFSzaRFro5HbU8MlYdZMlPUq/xcn5XCaRndGbMfSriuggsAXJDC
DMOe0LDZMb9QrRQPILKvj6+9aSzTHfHdNDCztXCTujaJ0qEimu7cbgtzSTqEBLTB
3WYebDZ3xB5zmPdQy3ZmSA9o5x45vasla2hoj+nM9YHO+Kf8XteXxk8yJoZeAFSP
D/rVq0IwFIGZ+CJJCqr5
=mhnb
-----END PGP SIGNATURE-----

--Sig_/QYOGD4LgaBoj2tzUDNT/F5F--

--===============0974260863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0974260863==--
