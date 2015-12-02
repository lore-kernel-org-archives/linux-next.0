From: Mark Brown <broonie@kernel.org>
Subject: linux-next: build failure after merge of the block tree
Date: Wed, 2 Dec 2015 16:19:36 +0000
Message-ID: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__2_Dec_2015_16_19_36_+0000_sQMh_mghtVdA_23T"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57846 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945AbbLBQTw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 11:19:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Keith Busch <keith.busch@intel.com>, Christoph Hellwig <hch@lst.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org

--Signature=_Wed__2_Dec_2015_16_19_36_+0000_sQMh_mghtVdA_23T
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (x86 allmodconfig)
failed like this:

/home/broonie/next/next/drivers/nvme/host/lightnvm.c: In function 'nvme_nvm=
_identity':
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:279:27: error: 'struct=
 nvme_ns' has no member named 'dev'
  struct nvme_dev *dev =3D ns->dev;
                           ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:292:32: error: derefer=
encing pointer to incomplete type 'struct nvme_dev'
  ret =3D nvme_submit_sync_cmd(dev->admin_q, (struct nvme_command *)&c,
                                ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c: In function 'nvme_nvm=
_get_l2p_tbl':
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:317:27: error: 'struct=
 nvme_ns' has no member named 'dev'
  struct nvme_dev *dev =3D ns->dev;
                           ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:319:36: error: derefer=
encing pointer to incomplete type 'struct nvme_dev'
  u32 len =3D queue_max_hw_sectors(dev->admin_q) << 9;
                                    ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c: In function 'nvme_nvm=
_get_bb_tbl':
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:365:27: error: 'struct=
 nvme_ns' has no member named 'dev'
  struct nvme_dev *dev =3D ns->dev;
                           ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:379:32: error: derefer=
encing pointer to incomplete type 'struct nvme_dev'
  ret =3D nvme_submit_sync_cmd(dev->admin_q, (struct nvme_command *)&c,
                                ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c: In function 'nvme_nvm=
_set_bb_tbl':
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:422:27: error: 'struct=
 nvme_ns' has no member named 'dev'
  struct nvme_dev *dev =3D ns->dev;
                           ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:432:32: error: derefer=
encing pointer to incomplete type 'struct nvme_dev'
  ret =3D nvme_submit_sync_cmd(dev->admin_q, (struct nvme_command *)&c,
                                ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c: In function 'nvme_nvm=
_create_dma_pool':
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:521:27: error: 'struct=
 nvme_ns' has no member named 'dev'
  struct nvme_dev *dev =3D ns->dev;
                           ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:523:34: error: derefer=
encing pointer to incomplete type 'struct nvme_dev'
  return dma_pool_create(name, dev->dev, PAGE_SIZE, PAGE_SIZE, 0);
                                  ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c: In function 'nvme_nvm=
_ns_supported':
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:576:27: error: 'struct=
 nvme_ns' has no member named 'dev'
  struct nvme_dev *dev =3D ns->dev;
                           ^
In file included from /home/broonie/next/next/include/linux/list.h:8:0,
                 from /home/broonie/next/next/include/linux/pci.h:25,
                 from /home/broonie/next/next/drivers/nvme/host/nvme.h:18,
                 from /home/broonie/next/next/drivers/nvme/host/lightnvm.c:=
23:
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:577:39: error: derefer=
encing pointer to incomplete type 'struct nvme_dev'
  struct pci_dev *pdev =3D to_pci_dev(dev->dev);
                                       ^
/home/broonie/next/next/include/linux/kernel.h:813:49: note: in definition =
of macro 'container_of'
  const typeof( ((type *)0)->member ) *__mptr =3D (ptr); \
                                                 ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:577:25: note: in expan=
sion of macro 'to_pci_dev'
  struct pci_dev *pdev =3D to_pci_dev(dev->dev);
                         ^
/home/broonie/next/next/drivers/nvme/host/lightnvm.c: In function 'nvme_nvm=
_create_dma_pool':
/home/broonie/next/next/drivers/nvme/host/lightnvm.c:524:1: warning: contro=
l reaches end of non-void function [-Wreturn-type]
 }
 ^
/home/broonie/next/next/scripts/Makefile.build:258: recipe for target 'driv=
ers/nvme/host/lightnvm.o' failed
make[4]: *** [drivers/nvme/host/lightnvm.o] Error 1

Caused by commit 1c63dc66580d4b (nvme: split a new struct nvme_ctrl out of
struct nvme_dev) which replaced dev in struct nvme_ns with ctrl without
updating this user. I used the block tree from the last -next build
(3f3a8a218c2f) instead.

--Signature=_Wed__2_Dec_2015_16_19_36_+0000_sQMh_mghtVdA_23T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXxoYAAoJECTWi3JdVIfQlWAH/jUBqqtWhNJAHXYEK4GfvNOY
NRIpqJqCykR9g2lLPJ8u+O86MjLRZYxZQifm8z6wGzEu8F4zVClwkGJItLpnTe1/
9Ehocl0O45UMVpIBOa8Q08H3vg69B01wBfcDFLu5tOAMnkwBeGYreo+eEYYwqlpL
49kgk/VdSr7JrpObD8HaMNBwyl0oFhIfN64GnMfG4t2UpPmsMkiaSSOB6/OTQU1u
owZobY1n6k61leuMTYaIBHdhAjeY63tTxvnuVrJFNRvIvYhddX7rzoBORDq92SM/
syjRbfeJekq3sxdhvIRY1a42AqnVpTImJTquN1MkAn2f7PTN8NT/bshJa45e2f8=
=7c8o
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Dec_2015_16_19_36_+0000_sQMh_mghtVdA_23T--
