From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Fri, 26 Apr 2019 12:17:35 +1000
Message-ID: <20190426121735.54ff8785@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0323349662=="
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
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
List-Id: linux-next.vger.kernel.org

--===============0323349662==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CxWqRw_sHO9W/Gm/1zGUIvr"; protocol="application/pgp-signature"

--Sig_/CxWqRw_sHO9W/Gm/1zGUIvr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/virtio/virtgpu_prime.c:43:18: error: redefinition of 'virtg=
pu_gem_prime_get_sg_table'
 struct sg_table *virtgpu_gem_prime_get_sg_table(struct drm_gem_object *obj)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/virtio/virtgpu_prime.c:31:18: note: previous definition of =
'virtgpu_gem_prime_get_sg_table' was here
 struct sg_table *virtgpu_gem_prime_get_sg_table(struct drm_gem_object *obj)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by a bad automaic merge between commit

  a0cecc23cfcb ("Revert "drm/virtio: drop prime import/export callbacks"")

from Linus' tree and commit

  98f41dc3b3ee ("drm/virtio: implement prime export")

from the drm tree.

I dropped the version of this function from the drm-fixes tree:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 26 Apr 2019 12:13:26 +1000
Subject: [PATCH] drm/virtio: fix up bad merge of virtgpu_gem_prime_get_sg_t=
able

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virti=
o/virtgpu_prime.c
index 0f670fc6c954..8fbf71bd0c5e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -40,11 +40,6 @@ struct sg_table *virtgpu_gem_prime_get_sg_table(struct d=
rm_gem_object *obj)
 				     bo->tbo.ttm->num_pages);
 }
=20
-struct sg_table *virtgpu_gem_prime_get_sg_table(struct drm_gem_object *obj)
-{
-	return ERR_PTR(-ENODEV);
-}
-
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *table)
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/CxWqRw_sHO9W/Gm/1zGUIvr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzCaj8ACgkQAVBC80lX
0GxFpwf/TFuH0ZkexQDGAbpdNoL3tS0ByjHqfnk94wixNeEwLSb3GxiNzPUJJBmb
HAzl4RVWa4aS6S1QyJPUa8lFA3op/k83vPWtavYVB4CWk/USsKY1ZzFBcz6g8ulW
3E2bm3ZnAci+2VyreJnkAqlEKF1m5VjfiWcLmi4Co7dzye01JyQ0rnDd8ZYuGgRO
3iOnLmJba58Hk0fMRMt6xNC/cyuMXPs/h+1MD6YyJTWz6VxXBEEBwXoY6w1zQCBd
RH5y7lxfTdLyHY4/0+vy1wQIriCL2EzA3yXbDiN47ESUbCexsm+djVUGzSyEU1zG
95iFa/9WsoSo+fW8ffex+HI0FUAHnQ==
=0kOG
-----END PGP SIGNATURE-----

--Sig_/CxWqRw_sHO9W/Gm/1zGUIvr--

--===============0323349662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0323349662==--
