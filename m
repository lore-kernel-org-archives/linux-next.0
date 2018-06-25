From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merging the drm tree
Date: Mon, 25 Jun 2018 11:18:50 +1000
Message-ID: <20180625111850.63faef0e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0754727502=="
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
List-Id: linux-next.vger.kernel.org

--===============0754727502==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WLb.geg72bz9i5VfY541+6s"; protocol="application/pgp-signature"

--Sig_/WLb.geg72bz9i5VfY541+6s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

samples/vfio-mdev/mbochs.c:827:3: error: 'struct dma_buf_ops' has no member=
 named 'map_atomic'
  .map_atomic   =3D mbochs_kmap_atomic_dmabuf,
   ^~~~~~~~~~
samples/vfio-mdev/mbochs.c:827:18: error: positional initialization of fiel=
d in 'struct' declared with 'designated_init' attribute [-Werror=3Ddesignat=
ed-init]
  .map_atomic   =3D mbochs_kmap_atomic_dmabuf,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
samples/vfio-mdev/mbochs.c:827:18: note: (near initialization for 'mbochs_d=
mabuf_ops')
samples/vfio-mdev/mbochs.c:827:18: error: initialization from incompatible =
pointer type [-Werror=3Dincompatible-pointer-types]
samples/vfio-mdev/mbochs.c:827:18: note: (near initialization for 'mbochs_d=
mabuf_ops.unmap')

Caused by commit

  f664a5269542 ("dma-buf: remove kmap_atomic interface")

interacting with commit

  a5e6e6505f38 ("sample: vfio bochs vbe display (host device for bochs-drm)=
")

from Linus' tree (v4.18-rc1).

I added the following just to disable the sample code until it can
be repaired.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Jun 2018 11:11:38 +1000
Subject: [PATCH] sample: disable the VFIO mdpy example mediated device samp=
le code

it was broken by the removal of the dmap-buf kmap_atomic interface.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 samples/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/samples/Kconfig b/samples/Kconfig
index bd133efc1a56..84bf618ad628 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -135,6 +135,7 @@ config SAMPLE_VFIO_MDEV_MDPY_FB
 config SAMPLE_VFIO_MDEV_MBOCHS
 	tristate "Build VFIO mdpy example mediated device sample code -- loadable=
 modules only"
 	depends on VFIO_MDEV_DEVICE && m
+	depends on BROKEN
 	select DMA_SHARED_BUFFER
 	help
 	  Build a virtual display sample driver for use as a VFIO
--=20
2.17.1

--=20
Cheers,
Stephen Rothwell

--Sig_/WLb.geg72bz9i5VfY541+6s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlswQvoACgkQAVBC80lX
0GzRkwf/cwZJX+DiR/pNP2SxV4eJJ0BkGE3n81a19SNLhDIQkgtQZtb1Qw9DRjwD
xpNmtzyA9QB0SSv4mBQhkiypVvDyC7rdDDT1jW4UZGc4lC0QGHGI3UJvVSiQRMM9
twlCJE8AlqrP+1OFYFExq/XaRpojn7D2sdR+yhsGDBFmG1J/LerO1U2opk9jSoP7
unjEiUKm9l7K9xaG2NRWgp8gZGzeoNLPQU794DtWK/BQwRpyQIVFh3jtTKSTqn2F
U2agrBriz58YFGiigGYVSxg+BUgBky/bg5Y5wDgy24dFeW7V2RzQ0srKagIwlmoC
X5ks+fbfBYDRsYcJVzBtCgKw9N3GQA==
=uPil
-----END PGP SIGNATURE-----

--Sig_/WLb.geg72bz9i5VfY541+6s--

--===============0754727502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0754727502==--
