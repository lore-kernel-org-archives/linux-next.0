From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rpmsg tree
Date: Fri, 22 Feb 2019 16:18:17 +1100
Message-ID: <20190222161817.32e35462@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JoWa1Oe7L4C9vpen.7AKQrX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Loic Pallardy <loic.pallardy@st.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JoWa1Oe7L4C9vpen.7AKQrX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

After merging the rpmsg tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/remoteproc/remoteproc_virtio.c: In function 'rproc_add_virtio_dev':
drivers/remoteproc/remoteproc_virtio.c:374:11: error: 'DMA_MEMORY_EXCLUSIVE=
' undeclared (first use in this function); did you mean 'WQ_FLAG_EXCLUSIVE'?
           DMA_MEMORY_EXCLUSIVE);
           ^~~~~~~~~~~~~~~~~~~~
           WQ_FLAG_EXCLUSIVE
drivers/remoteproc/remoteproc_virtio.c:374:11: note: each undeclared identi=
fier is reported only once for each function it appears in
drivers/remoteproc/remoteproc_virtio.c:371:10: error: too many arguments to=
 function 'dma_declare_coherent_memory'
    ret =3D dma_declare_coherent_memory(dev, pa,
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/remoteproc/remoteproc_virtio.c:20:
include/linux/dma-mapping.h:748:5: note: declared here
 int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory=
 pool")

interacting with commit

  82c5de0ab8db ("dma-mapping: remove the DMA_MEMORY_EXCLUSIVE flag")

from the dma-mapping tree.

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 22 Feb 2019 16:14:45 +1100
Subject: [PATCH] remoteproc: fix for "dma-mapping: remove the DMA_MEMORY_EX=
CLUSIVE flag"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/remoteproc/remoteproc_virtio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/re=
moteproc_virtio.c
index 337327d21c1c..44774de6f17b 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -370,8 +370,7 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int =
id)
 			/* Associate vdev buffer memory pool to vdev subdev */
 			ret =3D dma_declare_coherent_memory(dev, pa,
 							   mem->da,
-							   mem->len,
-							   DMA_MEMORY_EXCLUSIVE);
+							   mem->len);
 			if (ret < 0) {
 				dev_err(dev, "Failed to associate buffer\n");
 				goto out;
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/JoWa1Oe7L4C9vpen.7AKQrX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvhhkACgkQAVBC80lX
0Gzkwwf8DtD4mgKzuojN7KZyCx3TWRyJv/uXSmqMCKmF4IYqlcwmZpplRY1+ApWf
ARnY6gTaT2oGgV1iM3tWgAK79IEFbIvajU/4rUu6uUyE7kTpoVHd0BGaHs2XbN3B
JiRVVyFkLXadi9VnFDjMmlFlx7+8kMKrOMp8yDWg8p/3uEGw+s/H4hmKt3zMc56X
x8g2VaCIxTRz2VCEp4bmlOwdZWCTU2BlwxFRPAoPSDhzN0nimkVhMwOBUh4QUdm8
xPPObcmMvgHph130AYKKOL6vXq7rlkd9gj3JcNj2pG0pQzejOwWXHgzkf9F7Nk6S
XOHau6VcxDyKIjtA8KV4m9IzSoeiAg==
=8C/E
-----END PGP SIGNATURE-----

--Sig_/JoWa1Oe7L4C9vpen.7AKQrX--
