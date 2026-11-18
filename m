Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008549;
	b=1BguQVKCOj2pqQJVzVZv9vKEAoqxnKZguznrXVIiSRUBnPAvp+feRI0gbJUrhovmwyry
	 bDf4gr4LR5Tm9aPBXhZpeYkkxPPN30qePMBWuguE2n70kgCRh5KIlbhp8svH73rci1gNe
	 fTD11ArcoEidsnBKSnFUj/RagES0mCG2fumK95BHKemZO6RSOtZ8kk9B/CnfXn229rkGW
	 Vw/iHTACmycWXI7H9ITD/LX/cmTl+yUweU7AVdVnw8KyrPDBMwYmNl24uhUgHZO6wNFyG
	 XV4ruBe92AnQBQtbY+jnXSLtAHT58Pd4Kajo2D1hlhqRqp6xcELh2nVmZSGlxiDSrYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008549;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=PsCwN85zBqXoXFGF61lttqvpA2Q06YCNd9/FfpDXxc8=;
	b=STwHUbYJUoasMwIH8vtbgDda6R+U4qI6VE0UuBqHZ2/WsSbvjZVlmiBteh6HKxIx4FUA
	 4wwFK5pAhrGjFpykeRebmUH17N8BY/R0VClVnB2SsTkASrPE9T7Bk3gble1O0teW4kPnm
	 xo8vStpQA17Y1vadQaz6jzHTDNAI9OC9QCO613W//EPStOrISSu7Dn0idhGwaUZWqN+YB
	 +S+/LGDfY1QvABIDpHItQookNzhd/Ph3i06GlZ9w6fAK+unu5UxrCbKTSzH+5L67bF6Sf
	 7KFcBFlPy3sGkkIIT06Q7tiQPfJzGRv1OslEnrDRGLGmxytgGRSf+1/TPo6VKTDPidQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iW/nq7/H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73F60A2635;
	Wed, 18 Nov 2026 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iW/nq7/H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB891F000C5;
	Wed, 18 Nov 2026 13:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008549;
	bh=PsCwN85zBqXoXFGF61lttqvpA2Q06YCNd9/FfpDXxc8=;
	h=Date:From:To:Cc:Subject;
	b=iW/nq7/H16uZT0IYJgTgEuHQ5bqqnAXRUtcUlCt5misPVfInhNbKNgxtDuh7PTz1a
	 Vrn3/BqmNqMh607VMp4eupaedixcJXe78J1zU09EDBkfnOl0gainJqM8+e+Rkk9axG
	 HBe9YGDw61DROxK87IvIVOn4Pkg6b8VIXVPMYeqhgPWonB60mjwg9o6C8ESfTS2Hpj
	 3tafhjgbWWgIFq2jM41uefu7+e2y4CN3hLYtg3mNSe4ZB2yTQoKYpaBbFCHRO7644r
	 cSA3TXKkQ6iJ9RC5vB+DMUZ/GvsBPm/GR8fn0OX5acA0PTuPx2UNCS1TBJBqaB3/Ki
	 pdogIhqkUX55A==
Date: Wed, 18 Nov 2026 13:29:04 +0000
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Stanley Jhu <stanleyjhu@google.com>
Subject: linux-next: manual merge of the scsi-fixes tree with the origin tree
Message-ID: <av2oIDU7KF0EPfbw@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dNMw2dYTwr9bxi6Q"
Content-Disposition: inline


--dNMw2dYTwr9bxi6Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-fixes tree got a conflict in:

  drivers/ufs/core/ufs-rpmb.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  7bc9b854cd68e ("scsi: ufs: rpmb: Decouple device lifecycle from devres to=
 avoid UAF")

=66rom the scsi-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/ufs/core/ufs-rpmb.c
index 7566733376480,6803f3e62d786..0000000000000
--- a/drivers/ufs/core/ufs-rpmb.c
+++ b/drivers/ufs/core/ufs-rpmb.c
@@@ -14,6 -14,7 +14,7 @@@
  #include <linux/module.h>
  #include <linux/device.h>
  #include <linux/kernel.h>
+ #include <linux/slab.h>
  #include <linux/types.h>
  #include <linux/rpmb.h>
  #include <linux/string.h>
@@@ -27,22 -28,19 +28,19 @@@
  #define UFS_RPMB_SEC_PROTOCOL		0xEC	/* JEDEC UFS application */
  #define UFS_RPMB_SEC_PROTOCOL_ID	0x01	/* JEDEC UFS RPMB protocol ID, CDB =
byte3 */
 =20
- static const struct bus_type ufs_rpmb_bus_type =3D {
- 	.name =3D "ufs_rpmb",
- };
-=20
  /* UFS RPMB device structure */
  struct ufs_rpmb_dev {
  	u8 region_id;
  	struct device dev;
  	struct rpmb_dev *rdev;
- 	struct ufs_hba *hba;
+ 	struct scsi_device *sdev;
  	struct list_head node;
  };
 =20
- static int ufs_sec_submit(struct ufs_hba *hba, u16 spsp, void *buffer, si=
ze_t len, bool send)
+ static int ufs_sec_submit(struct ufs_rpmb_dev *ufs_rpmb, u16 spsp,
+ 			  void *buffer, size_t len, bool send)
  {
- 	struct scsi_device *sdev =3D hba->ufs_rpmb_wlun;
+ 	struct scsi_device *sdev =3D ufs_rpmb->sdev;
  	struct scsi_failure failure_defs[] =3D {
  		{
  			.sense_key =3D UNIT_ATTENTION,
@@@ -62,6 -60,9 +60,9 @@@
  	};
  	u8 cdb[12] =3D { };
 =20
+ 	if (!sdev || !scsi_device_online(sdev))
+ 		return -ENODEV;
+=20
  	cdb[0] =3D send ? SECURITY_PROTOCOL_OUT : SECURITY_PROTOCOL_IN;
  	cdb[1] =3D UFS_RPMB_SEC_PROTOCOL;
  	put_unaligned_be16(spsp, &cdb[2]);
@@@ -74,13 -75,12 +75,12 @@@
 =20
  /* UFS RPMB route frames implementation */
  static int ufs_rpmb_route_frames(struct device *dev, u8 *req, unsigned in=
t req_len, u8 *resp,
- 					unsigned int resp_len)
+ 				 unsigned int resp_len)
  {
  	struct ufs_rpmb_dev *ufs_rpmb =3D dev_get_drvdata(dev);
  	struct rpmb_frame *frm_out =3D (struct rpmb_frame *)req;
  	bool need_result_read =3D true;
  	u16 req_type, protocol_id;
- 	struct ufs_hba *hba;
  	int ret;
 =20
  	if (!ufs_rpmb) {
@@@ -88,8 -88,6 +88,6 @@@
  		return -ENODEV;
  	}
 =20
- 	hba =3D ufs_rpmb->hba;
-=20
  	/* req_resp is at the end of an RPMB frame. */
  	if (req_len < sizeof(*frm_out))
  		return -EINVAL;
@@@ -122,7 -120,7 +120,7 @@@
 =20
  	protocol_id =3D ufs_rpmb->region_id << 8 | UFS_RPMB_SEC_PROTOCOL_ID;
 =20
- 	ret =3D ufs_sec_submit(hba, protocol_id, req, req_len, true);
+ 	ret =3D ufs_sec_submit(ufs_rpmb, protocol_id, req, req_len, true);
  	if (ret) {
  		dev_err(dev, "Command failed with ret=3D%d\n", ret);
  		return ret;
@@@ -133,7 -131,8 +131,8 @@@
 =20
  		memset(frm_resp, 0, sizeof(*frm_resp));
  		put_unaligned_be16(RPMB_RESULT_READ, &frm_resp->req_resp);
- 		ret =3D ufs_sec_submit(hba, protocol_id, resp, resp_len, true);
+ 		ret =3D ufs_sec_submit(ufs_rpmb, protocol_id, resp, resp_len,
+ 				     true);
  		if (ret) {
  			dev_err(dev, "Result read request failed with ret=3D%d\n", ret);
  			return ret;
@@@ -141,7 -140,8 +140,8 @@@
  	}
 =20
  	if (!ret) {
- 		ret =3D ufs_sec_submit(hba, protocol_id, resp, resp_len, false);
+ 		ret =3D ufs_sec_submit(ufs_rpmb, protocol_id, resp, resp_len,
+ 				     false);
  		if (ret)
  			dev_err(dev, "Response read failed with ret=3D%d\n", ret);
  	}
@@@ -151,23 -151,31 +151,31 @@@
 =20
  static void ufs_rpmb_device_release(struct device *dev)
  {
- 	struct ufs_rpmb_dev *ufs_rpmb =3D dev_get_drvdata(dev);
+ 	struct ufs_rpmb_dev *ufs_rpmb =3D
+ 		container_of(dev, struct ufs_rpmb_dev, dev);
 =20
- 	rpmb_dev_unregister(ufs_rpmb->rdev);
+ 	put_device(&ufs_rpmb->sdev->sdev_gendev);
+ 	kfree(ufs_rpmb);
  }
 =20
  /* UFS RPMB device registration */
  int ufs_rpmb_probe(struct ufs_hba *hba)
  {
+ 	struct rpmb_descr descr =3D {
+ 		.type =3D RPMB_TYPE_UFS,
+ 		.route_frames =3D ufs_rpmb_route_frames,
+ 		.reliable_wr_count =3D hba->dev_info.rpmb_io_size,
+ 	};
+ 	struct scsi_device *sdev =3D hba->ufs_rpmb_wlun;
  	struct ufs_rpmb_dev *ufs_rpmb, *it, *tmp;
  	u8 dev_id[UFS_RPMB_ID_LEN];
  	struct rpmb_dev *rdev;
- 	char *cid =3D NULL;
+ 	char *cid;
  	int region;
  	u32 cap;
  	int ret;
 =20
- 	if (!hba->ufs_rpmb_wlun || hba->dev_info.b_advanced_rpmb_en) {
+ 	if (!sdev || hba->dev_info.b_advanced_rpmb_en) {
  		dev_info(hba->dev, "Skip OP-TEE RPMB registration\n");
  		return -ENODEV;
  	}
@@@ -178,26 -186,22 +186,22 @@@
  		return -EINVAL;
  	}
 =20
- 	struct rpmb_descr descr =3D {
- 		.type =3D RPMB_TYPE_UFS,
- 		.route_frames =3D ufs_rpmb_route_frames,
- 		.reliable_wr_count =3D hba->dev_info.rpmb_io_size,
- 	};
-=20
  	for (region =3D 0; region < ARRAY_SIZE(hba->dev_info.rpmb_region_size); =
region++) {
  		cap =3D hba->dev_info.rpmb_region_size[region];
  		if (!cap)
  			continue;
 =20
- 		ufs_rpmb =3D devm_kzalloc_obj(hba->dev, *ufs_rpmb);
+ 		ufs_rpmb =3D kzalloc_obj(*ufs_rpmb);
  		if (!ufs_rpmb) {
  			ret =3D -ENOMEM;
  			goto err_out;
  		}
 =20
- 		ufs_rpmb->hba =3D hba;
- 		ufs_rpmb->dev.parent =3D &hba->ufs_rpmb_wlun->sdev_gendev;
- 		ufs_rpmb->dev.bus =3D &ufs_rpmb_bus_type;
+ 		get_device(&sdev->sdev_gendev);
+=20
+ 		ufs_rpmb->sdev =3D sdev;
+ 		ufs_rpmb->region_id =3D region;
+ 		ufs_rpmb->dev.parent =3D &sdev->sdev_gendev;
  		ufs_rpmb->dev.release =3D ufs_rpmb_device_release;
  		dev_set_name(&ufs_rpmb->dev, "ufs_rpmb%d", region);
 =20
@@@ -207,16 -211,14 +211,14 @@@
  		ret =3D device_register(&ufs_rpmb->dev);
  		if (ret) {
  			dev_err(hba->dev, "Failed to register UFS RPMB device %d\n", region);
- 			put_device(&ufs_rpmb->dev);
- 			goto err_out;
+ 			goto err_put;
  		}
 =20
  		/* Create unique ID by appending region number to device_id */
  		cid =3D kasprintf(GFP_KERNEL, "%s-R%d", hba->dev_info.device_id, region=
);
  		if (!cid) {
- 			device_unregister(&ufs_rpmb->dev);
  			ret =3D -ENOMEM;
- 			goto err_out;
+ 			goto err_unreg;
  		}
 =20
  		blake2b(NULL, 0, cid, strlen(cid), dev_id, UFS_RPMB_ID_LEN);
@@@ -227,29 -229,30 +229,30 @@@
 =20
  		/* Register RPMB device */
  		rdev =3D rpmb_dev_register(&ufs_rpmb->dev, &descr);
+ 		kfree(cid);
  		if (IS_ERR(rdev)) {
  			dev_err(hba->dev, "Failed to register UFS RPMB device.\n");
- 			device_unregister(&ufs_rpmb->dev);
  			ret =3D PTR_ERR(rdev);
- 			goto err_out;
+ 			goto err_unreg;
  		}
 =20
- 		kfree(cid);
- 		cid =3D NULL;
-=20
  		ufs_rpmb->rdev =3D rdev;
- 		ufs_rpmb->region_id =3D region;
-=20
  		list_add_tail(&ufs_rpmb->node, &hba->rpmbs);
 =20
  		dev_info(hba->dev, "UFS RPMB region %d registered (capacity=3D%u)\n", r=
egion, cap);
  	}
 =20
  	return 0;
+=20
+ err_unreg:
+ 	device_unregister(&ufs_rpmb->dev);
+ 	goto err_out;
+ err_put:
+ 	put_device(&ufs_rpmb->dev);
  err_out:
- 	kfree(cid);
  	list_for_each_entry_safe(it, tmp, &hba->rpmbs, node) {
  		list_del(&it->node);
+ 		rpmb_dev_unregister(it->rdev);
  		device_unregister(&it->dev);
  	}
 =20
@@@ -269,6 -272,7 +272,7 @@@ void ufs_rpmb_remove(struct ufs_hba *hb
  		dev_info(hba->dev, "Removing UFS RPMB region %d\n", ufs_rpmb->region_id=
);
  		/* Remove from list first */
  		list_del(&ufs_rpmb->node);
+ 		rpmb_dev_unregister(ufs_rpmb->rdev);
  		/* Unregister device */
  		device_unregister(&ufs_rpmb->dev);
  	}

--dNMw2dYTwr9bxi6Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr9qCAACgkQJNaLcl1U
h9CSJwf+K5lXaKSZ3EkDFhQods1NvHdRPpx47eH5zad4CiRLG1RuImSJPBs/3Ehq
mLnKQSYAsA+TqtuMVmgyX0eAk4RZsfWvJQ18XtPV8U5nWqgKdZuDB+3LlZqywNYf
SEScfRnMnNsoLfnpqpnz9vHswvBGjqMWbuRQTHcLiej4NHqg/lsel3OEAsi4RmOc
Vf4oHjZRxVoKrQmuWDEYh4ig6o9QPZOJ+2NzDaWsuuHSHtt/FO4VzLHvCvJyHiWM
jpGC14ZaXj7tLfSeflishAuFIRoIE2hfq81m3KL+7fNe21xXZP2SiyMGqiZAiwWL
6u13z0V2T7zQ12Kt6GEALnIP4e2cFg==
=JMCZ
-----END PGP SIGNATURE-----

--dNMw2dYTwr9bxi6Q--
