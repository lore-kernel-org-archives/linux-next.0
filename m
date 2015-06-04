From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 4 Jun 2015 14:36:15 +1000
Message-ID: <20150604143615.5dd061ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aesLEdFWCg.a+Tfuav/e8+P"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58277 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750805AbbFDEg1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2015 00:36:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>

--Sig_/aesLEdFWCg.a+Tfuav/e8+P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
drivers/block/nvme-core.c between commit fec558b5f178 ("NVMe: fix type
warning on 32-bit") from Linus' tree and commit d29ec8241c10 ("nvme:
submit internal commands through the block layer") from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/block/nvme-core.c
index 683dff272562,513908ff46c4..000000000000
--- a/drivers/block/nvme-core.c
+++ b/drivers/block/nvme-core.c
@@@ -1745,12 -1714,10 +1714,11 @@@ static int nvme_submit_io(struct nvme_n
  	struct nvme_dev *dev =3D ns->dev;
  	struct nvme_user_io io;
  	struct nvme_command c;
- 	unsigned length, meta_len, prp_len;
+ 	unsigned length, meta_len;
  	int status, write;
- 	struct nvme_iod *iod;
  	dma_addr_t meta_dma =3D 0;
  	void *meta =3D NULL;
 +	void __user *metadata;
 =20
  	if (copy_from_user(&io, uio, sizeof(io)))
  		return -EFAULT;
@@@ -1778,18 -1731,21 +1732,23 @@@
  		return -EINVAL;
  	}
 =20
- 	if (IS_ERR(iod))
- 		return PTR_ERR(iod);
+ 	length =3D (io.nblocks + 1) << ns->lba_shift;
+ 	meta_len =3D (io.nblocks + 1) * ns->ms;
+ 	write =3D io.opcode & 1;
++	metadata =3D (void __user *)(unsigned long)io.metadata;
 =20
- 	prp_len =3D nvme_setup_prps(dev, iod, length, GFP_KERNEL);
- 	if (length !=3D prp_len) {
- 		status =3D -ENOMEM;
- 		goto unmap;
- 	}
  	if (meta_len) {
- 		meta =3D dma_alloc_coherent(&dev->pci_dev->dev, meta_len,
+ 		if (((io.metadata & 3) || !io.metadata) && !ns->ext)
+ 			return -EINVAL;
+=20
+ 		if (ns->ext) {
+ 			length +=3D meta_len;
+ 			meta_len =3D 0;
+ 		}
+=20
+ 		meta =3D dma_alloc_coherent(dev->dev, meta_len,
  						&meta_dma, GFP_KERNEL);
 +
  		if (!meta) {
  			status =3D -ENOMEM;
  			goto unmap;
@@@ -1813,19 -1770,18 +1772,17 @@@
  	c.rw.reftag =3D cpu_to_le32(io.reftag);
  	c.rw.apptag =3D cpu_to_le16(io.apptag);
  	c.rw.appmask =3D cpu_to_le16(io.appmask);
- 	c.rw.prp1 =3D cpu_to_le64(sg_dma_address(iod->sg));
- 	c.rw.prp2 =3D cpu_to_le64(iod->first_dma);
  	c.rw.metadata =3D cpu_to_le64(meta_dma);
- 	status =3D nvme_submit_io_cmd(dev, ns, &c, NULL);
+=20
+ 	status =3D __nvme_submit_sync_cmd(ns->queue, &c, NULL,
+ 			(void __user *)io.addr, length, NULL, 0);
   unmap:
- 	nvme_unmap_user_pages(dev, write, iod);
- 	nvme_free_iod(dev, iod);
  	if (meta) {
  		if (status =3D=3D NVME_SC_SUCCESS && !write) {
 -			if (copy_to_user((void __user *)io.metadata, meta,
 -								meta_len))
 +			if (copy_to_user(metadata, meta, meta_len))
  				status =3D -EFAULT;
  		}
- 		dma_free_coherent(&dev->pci_dev->dev, meta_len, meta, meta_dma);
+ 		dma_free_coherent(dev->dev, meta_len, meta, meta_dma);
  	}
  	return status;
  }

--Sig_/aesLEdFWCg.a+Tfuav/e8+P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVb9XJAAoJEMDTa8Ir7ZwVkfAP/2MLD3dRRc4BmNYcY//b4aA7
qd0I+dO4/LZ0PTVY5QAS5i91KlTTeuMNZXKCvVFrbveDChMKCO6dhK8Ast8kBmGe
HeQt637FiDV/zuTXP21kff5xjpUBqEUtUtzSTprFpsOrjh3b9Ek1cfuNNUu2/fVv
aasSrVjTatcG8yxrHQbffIShvCPueFdhAwomKVrJVqfX3bvWPO3zF8Aee22VL4ur
tYmI38Sf3yB8Ev/4lKtp79NpnS8psTGjkxZb3mp5yQZtrBPTDyQ0ehlW9YaejGSU
4cgra4/y5PDX93ie9SFBhB3U9HymEV+yQHR/4kwoBaMP52QshQSCqExYHprJI+1t
m96tHQL3TMGNQ2qzvognQtyng87ilF/Eas0uEIb4V89pKQiNAZ/lMTrnjRMYS4IY
VhRIqG/uDhZ6CgECSB95p3AHLovUdlNkPy/4seV12/mZKtKmlIN5rhh0Wql7kAiD
8vLhipKGVIMr/nRwUIaihhq93aOjc3kGiURhJ8NbwSkZqtBCpDEwO1yRPh4iIR2j
cPHkP6qs7Xh8KPwYXssUK2AVKBkyyqNZhaF1Mg7gkQTvfFUrsPBGeAVvMaTS9i45
JJ+ZXWoJYQ6Vwz3VVbG5WPcfoxgOdgFjczwqLaBblhHq6LJ5Y1u9wom8u+SX2NFm
vpY7jaCk1F6KdzSHWEEl
=eU76
-----END PGP SIGNATURE-----

--Sig_/aesLEdFWCg.a+Tfuav/e8+P--
