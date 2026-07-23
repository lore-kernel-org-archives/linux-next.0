Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9426548B38F;
	Thu, 23 Jul 2026 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815517; cv=none; b=DSvY6rB7RZhlvVvPMsQXHygq0nT79Fc+fN/ib5D4heqdBNOGjEMqw6dzy3buxs7PvbM4ALSKpyXXYCzG9cgDS+Rp6Nrn0e195ncfxGfij7oG5Sgp94R4fYKeNgGvwaq7zg4Zj6mr425C+43u8qhchO7xSqvtT2pOABNP1fHRwV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815517; c=relaxed/simple;
	bh=tf7Q/M1rPTQQogYiOxtFdpRVTqdqBrmScJT87UBxNFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=epu83XbFQP05pwbO6Dvq8vKBih3Mfpkp1L09wDyAHXKgoSnft5gtX6uaQjdSybuzlcxxDp9mmbiesV1i/URdfGGFB4ig+GyWuZsoBmJoXm2rvZkcEO8fOHKXpQakuAA2qGwIBIDTWtHIbRKdASDBWRqxAxS0LfQRosy0qd96cCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5VmmW+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5VmmW+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24911F00A3A;
	Thu, 23 Jul 2026 14:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784815514;
	bh=QV0+eOvtayiuaDZfhmr6DKFAtHT9mq8aj+2IEzRRAP0=;
	h=Date:From:To:Cc:Subject;
	b=K5VmmW+PIH7O31oJPnF2pFKLqU26nV6Grp5yMyn2joe0MsMTzFsQQ4zUc/OYBsoBf
	 ZDgbWOOPJLyCgJhac9dc7ggmaC7Jgou1hUI+10fkcALWGW6wvjqvc12HecvSEE6odH
	 Oa3oNgueztKXCE4B14lQe1qb2WIMab2UjeJrEffT/mgwst2IppE0Ll5OPoiOCh6wZV
	 je3+uZD3LhP8kNWkdjdTuDUvSJVFcPwvwB3Q4+MapO5eoLykDQKmSDFFo0xNaNPw8l
	 ujHTXKxF81RDQfLynuXVxKuLMwmYRmx49FtHov1icQqNF2QUhUl/kI96PTk5tUBXiB
	 dcxitRudp0Yxw==
Date: Thu, 23 Jul 2026 15:05:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <amIfkQiBoVDmDKBN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p1FpzjbbT/n1ZYAF"
Content-Disposition: inline


--p1FpzjbbT/n1ZYAF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  drivers/bluetooth/btusb.c

between commit:

  df541cd485ff8 ("Bluetooth: btusb: validate Realtek vendor event length")

=66rom the net tree and commits:

  891916abe16fc ("Bluetooth: btusb: validate Realtek vendor event length")
  90ae39404c94e ("Bluetooth: btusb: QCA: Replace HCI_VENDOR_PKT usages with=
 HCI_EV_VENDOR")
  6f55ad8fb0acd ("Bluetooth: btusb: Realtek: Replace HCI_VENDOR_PKT usage w=
ith HCI_EV_VENDOR")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/bluetooth/btusb.c
index 8f7ed469cac68,4d59b28ab30f2..0000000000000
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@@ -297,6 -297,8 +297,8 @@@ static const struct usb_device_id quirk
  						     BTUSB_WIDEBAND_SPEECH },
  	{ USB_DEVICE(0x13d3, 0x3501), .driver_info =3D BTUSB_QCA_ROME |
  						     BTUSB_WIDEBAND_SPEECH },
+ 	{ USB_DEVICE(0x13d3, 0x3503), .driver_info =3D BTUSB_QCA_ROME |
+ 						     BTUSB_WIDEBAND_SPEECH },
 =20
  	/* QCA WCN6855 chipset */
  	{ USB_DEVICE(0x0489, 0xe0c7), .driver_info =3D BTUSB_QCA_WCN6855 |
@@@ -679,6 -681,8 +681,8 @@@
  	{ USB_DEVICE(0x13d3, 0x3606), .driver_info =3D BTUSB_MEDIATEK |
  						     BTUSB_WIDEBAND_SPEECH },
  	/* MediaTek MT7902 Bluetooth devices */
+ 	{ USB_DEVICE(0x0489, 0xe156), .driver_info =3D BTUSB_MEDIATEK |
+ 						     BTUSB_WIDEBAND_SPEECH },
  	{ USB_DEVICE(0x0e8d, 0x1ede), .driver_info =3D BTUSB_MEDIATEK |
  						     BTUSB_WIDEBAND_SPEECH },
  	{ USB_DEVICE(0x13d3, 0x3579), .driver_info =3D BTUSB_MEDIATEK |
@@@ -796,6 -800,8 +800,8 @@@
  						     BTUSB_WIDEBAND_SPEECH },
  	{ USB_DEVICE(0x13d3, 0x3613), .driver_info =3D BTUSB_MEDIATEK |
  						     BTUSB_WIDEBAND_SPEECH },
+ 	{ USB_DEVICE(0x13d3, 0x3625), .driver_info =3D BTUSB_MEDIATEK |
+ 						     BTUSB_WIDEBAND_SPEECH },
  	{ USB_DEVICE(0x13d3, 0x3627), .driver_info =3D BTUSB_MEDIATEK |
  						     BTUSB_WIDEBAND_SPEECH },
  	{ USB_DEVICE(0x13d3, 0x3628), .driver_info =3D BTUSB_MEDIATEK |
@@@ -850,6 -856,12 +856,12 @@@
  	{ USB_DEVICE(0x37ad, 0x0600), .driver_info =3D BTUSB_REALTEK |
  						     BTUSB_WIDEBAND_SPEECH },
 =20
+ 	/* Additional Realtek 8761CU Bluetooth devices */
+ 	{ USB_DEVICE(0x0b05, 0x1bef), .driver_info =3D BTUSB_REALTEK |
+ 						     BTUSB_WIDEBAND_SPEECH },
+ 	{ USB_DEVICE(0x0b05, 0x1d70), .driver_info =3D BTUSB_REALTEK |
+ 						     BTUSB_WIDEBAND_SPEECH },
+=20
  	/* Additional Realtek 8821AE Bluetooth devices */
  	{ USB_DEVICE(0x0b05, 0x17dc), .driver_info =3D BTUSB_REALTEK },
  	{ USB_DEVICE(0x13d3, 0x3414), .driver_info =3D BTUSB_REALTEK },
@@@ -882,6 -894,8 +894,8 @@@
  						     BTUSB_WIDEBAND_SPEECH },
  	{ USB_DEVICE(0x0bda, 0xc123), .driver_info =3D BTUSB_REALTEK |
  						     BTUSB_WIDEBAND_SPEECH },
+ 	{ USB_DEVICE(0x1357, 0xc123), .driver_info =3D BTUSB_REALTEK |
+ 						     BTUSB_WIDEBAND_SPEECH },
  	{ USB_DEVICE(0x0cb5, 0xc547), .driver_info =3D BTUSB_REALTEK |
  						     BTUSB_WIDEBAND_SPEECH },
 =20
@@@ -937,6 -951,10 +951,10 @@@ struct qca_dump_info=20
  	u16 ram_dump_seqno;
  };
 =20
+ struct btqca_data {
+ 	struct qca_dump_info qca_dump;
+ };
+=20
  #define BTUSB_MAX_ISOC_FRAMES	10
 =20
  #define BTUSB_INTR_RUNNING	0
@@@ -1010,6 -1028,7 +1028,7 @@@ struct btusb_data=20
  	bool usb_alt6_packet_flow;
  	int isoc_altsetting;
  	int suspend_count;
+ 	const struct usb_device_id *match_id;
 =20
  	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
  	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
@@@ -1022,8 -1041,6 +1041,6 @@@
  	int (*disconnect)(struct hci_dev *hdev);
 =20
  	int oob_wake_irq;   /* irq for out-of-band wake-on-bt */
-=20
- 	struct qca_dump_info qca_dump;
  };
 =20
  static void btusb_reset(struct hci_dev *hdev)
@@@ -2783,7 -2800,7 +2800,7 @@@ static int btusb_setup_realtek(struct h
  static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff =
*skb)
  {
  	if (skb->len >=3D HCI_EVENT_HDR_SIZE + 1 &&
- 	    skb->data[0] =3D=3D HCI_VENDOR_PKT &&
+ 	    skb->data[0] =3D=3D HCI_EV_VENDOR &&
  	    skb->data[2] =3D=3D RTK_SUB_EVENT_CODE_COREDUMP) {
  		struct rtk_dev_coredump_hdr hdr =3D {
  			.code =3D RTK_DEVCOREDUMP_CODE_MEMDUMP,
@@@ -3072,14 -3089,15 +3089,15 @@@ static int btusb_set_bdaddr_ath3012(str
  static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
  				const bdaddr_t *bdaddr)
  {
+ 	bdaddr_t bdaddr_swapped;
  	struct sk_buff *skb;
- 	u8 buf[6];
  	long ret;
 =20
- 	memcpy(buf, bdaddr, sizeof(bdaddr_t));
+ 	baswap(&bdaddr_swapped, bdaddr);
 =20
- 	skb =3D __hci_cmd_sync_ev(hdev, 0xfc14, sizeof(buf), buf,
- 				HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
+ 	skb =3D __hci_cmd_sync_ev(hdev, 0xfc14, sizeof(bdaddr_swapped),
+ 				&bdaddr_swapped, HCI_EV_CMD_COMPLETE,
+ 				HCI_INIT_TIMEOUT);
  	if (IS_ERR(skb)) {
  		ret =3D PTR_ERR(skb);
  		bt_dev_err(hdev, "Change address command failed (%ld)", ret);
@@@ -3115,14 -3133,15 +3133,15 @@@ struct qca_dump_hdr=20
  static void btusb_dump_hdr_qca(struct hci_dev *hdev, struct sk_buff *skb)
  {
  	char buf[128];
- 	struct btusb_data *btdata =3D hci_get_drvdata(hdev);
+ 	struct btqca_data *btqca_data =3D hci_get_priv(hdev);
+ 	struct qca_dump_info *qca_dump_ptr =3D &btqca_data->qca_dump;
 =20
  	snprintf(buf, sizeof(buf), "Controller Name: 0x%x\n",
- 			btdata->qca_dump.controller_id);
+ 			qca_dump_ptr->controller_id);
  	skb_put_data(skb, buf, strlen(buf));
 =20
  	snprintf(buf, sizeof(buf), "Firmware Version: 0x%x\n",
- 			btdata->qca_dump.fw_version);
+ 			qca_dump_ptr->fw_version);
  	skb_put_data(skb, buf, strlen(buf));
 =20
  	snprintf(buf, sizeof(buf), "Driver: %s\nVendor: qca\n",
@@@ -3130,7 -3149,7 +3149,7 @@@
  	skb_put_data(skb, buf, strlen(buf));
 =20
  	snprintf(buf, sizeof(buf), "VID: 0x%x\nPID:0x%x\n",
- 			btdata->qca_dump.id_vendor, btdata->qca_dump.id_product);
+ 			qca_dump_ptr->id_vendor, qca_dump_ptr->id_product);
  	skb_put_data(skb, buf, strlen(buf));
 =20
  	snprintf(buf, sizeof(buf), "Lmp Subversion: 0x%x\n",
@@@ -3159,6 -3178,8 +3178,8 @@@ static int handle_dump_pkt_qca(struct h
 =20
  	struct qca_dump_hdr *dump_hdr;
  	struct btusb_data *btdata =3D hci_get_drvdata(hdev);
+ 	struct btqca_data *btqca_data =3D hci_get_priv(hdev);
+ 	struct qca_dump_info *qca_dump_ptr =3D &btqca_data->qca_dump;
  	struct usb_device *udev =3D btdata->udev;
 =20
  	pkt_type =3D hci_skb_pkt_type(skb);
@@@ -3186,8 -3207,8 +3207,8 @@@
  			goto out;
  		}
 =20
- 		btdata->qca_dump.ram_dump_size =3D dump_size;
- 		btdata->qca_dump.ram_dump_seqno =3D 0;
+ 		qca_dump_ptr->ram_dump_size =3D dump_size;
+ 		qca_dump_ptr->ram_dump_seqno =3D 0;
 =20
  		skb_pull(skb, offsetof(struct qca_dump_hdr, data0));
 =20
@@@ -3199,29 -3220,29 +3220,29 @@@
  		skb_pull(skb, offsetof(struct qca_dump_hdr, data));
  	}
 =20
- 	if (!btdata->qca_dump.ram_dump_size) {
+ 	if (!qca_dump_ptr->ram_dump_size) {
  		ret =3D -EINVAL;
  		bt_dev_err(hdev, "memdump is not active");
  		goto out;
  	}
 =20
- 	if ((seqno > btdata->qca_dump.ram_dump_seqno + 1) && (seqno !=3D QCA_LAS=
T_SEQUENCE_NUM)) {
- 		dump_size =3D QCA_MEMDUMP_PKT_SIZE * (seqno - btdata->qca_dump.ram_dump=
_seqno - 1);
+ 	if ((seqno > qca_dump_ptr->ram_dump_seqno + 1) && seqno !=3D QCA_LAST_SE=
QUENCE_NUM) {
+ 		dump_size =3D QCA_MEMDUMP_PKT_SIZE * (seqno - qca_dump_ptr->ram_dump_se=
qno - 1);
  		hci_devcd_append_pattern(hdev, 0x0, dump_size);
  		bt_dev_err(hdev,
  			   "expected memdump seqno(%u) is not received(%u)\n",
- 			   btdata->qca_dump.ram_dump_seqno, seqno);
- 		btdata->qca_dump.ram_dump_seqno =3D seqno;
+ 			   qca_dump_ptr->ram_dump_seqno, seqno);
+ 		qca_dump_ptr->ram_dump_seqno =3D seqno;
  		kfree_skb(skb);
  		return ret;
  	}
 =20
  	hci_devcd_append(hdev, skb);
- 	btdata->qca_dump.ram_dump_seqno++;
+ 	qca_dump_ptr->ram_dump_seqno++;
  	if (seqno =3D=3D QCA_LAST_SEQUENCE_NUM) {
  		bt_dev_info(hdev,
  				"memdump done: pkts(%u), total(%u)\n",
- 				btdata->qca_dump.ram_dump_seqno, btdata->qca_dump.ram_dump_size);
+ 				qca_dump_ptr->ram_dump_seqno, qca_dump_ptr->ram_dump_size);
 =20
  		hci_devcd_complete(hdev);
  		goto out;
@@@ -3229,10 -3250,10 +3250,10 @@@
  	return ret;
 =20
  out:
- 	if (btdata->qca_dump.ram_dump_size)
+ 	if (qca_dump_ptr->ram_dump_size)
  		usb_enable_autosuspend(udev);
- 	btdata->qca_dump.ram_dump_size =3D 0;
- 	btdata->qca_dump.ram_dump_seqno =3D 0;
+ 	qca_dump_ptr->ram_dump_size =3D 0;
+ 	qca_dump_ptr->ram_dump_seqno =3D 0;
  	clear_bit(BTUSB_HW_SSR_ACTIVE, &btdata->flags);
 =20
  	if (ret < 0)
@@@ -3257,7 -3278,7 +3278,7 @@@ static bool acl_pkt_is_dump_qca(struct=20
  		goto out;
 =20
  	event_hdr =3D skb_pull_data(clone, sizeof(*event_hdr));
- 	if (!event_hdr || (event_hdr->evt !=3D HCI_VENDOR_PKT))
+ 	if (!event_hdr || event_hdr->evt !=3D HCI_EV_VENDOR)
  		goto out;
 =20
  	dump_hdr =3D skb_pull_data(clone, sizeof(*dump_hdr));
@@@ -3283,7 -3304,7 +3304,7 @@@ static bool evt_pkt_is_dump_qca(struct=20
  		return false;
 =20
  	event_hdr =3D skb_pull_data(clone, sizeof(*event_hdr));
- 	if (!event_hdr || (event_hdr->evt !=3D HCI_VENDOR_PKT))
+ 	if (!event_hdr || event_hdr->evt !=3D HCI_EV_VENDOR)
  		goto out;
 =20
  	dump_hdr =3D skb_pull_data(clone, sizeof(*dump_hdr));
@@@ -3707,8 -3728,12 +3728,12 @@@ static int btusb_setup_qca(struct hci_d
  	if (err < 0)
  		return err;
 =20
- 	btdata->qca_dump.fw_version =3D le32_to_cpu(ver.patch_version);
- 	btdata->qca_dump.controller_id =3D le32_to_cpu(ver.rom_version);
+ 	if (btdata->match_id->driver_info & BTUSB_QCA_WCN6855) {
+ 		struct btqca_data *btqca_data =3D hci_get_priv(hdev);
+=20
+ 		btqca_data->qca_dump.fw_version =3D le32_to_cpu(ver.patch_version);
+ 		btqca_data->qca_dump.controller_id =3D le32_to_cpu(ver.rom_version);
+ 	}
 =20
  	if (!(status & QCA_SYSCFG_UPDATED)) {
  		err =3D btusb_setup_qca_load_nvm(hdev, &ver, info);
@@@ -3889,16 -3914,13 +3914,13 @@@ static bool btusb_wakeup(struct hci_de
 =20
  static int btusb_shutdown_qca(struct hci_dev *hdev)
  {
- 	struct sk_buff *skb;
+ 	int err;
 =20
- 	skb =3D __hci_cmd_sync(hdev, HCI_OP_RESET, 0, NULL, HCI_INIT_TIMEOUT);
- 	if (IS_ERR(skb)) {
+ 	err =3D __hci_reset_sync(hdev);
+ 	if (err)
  		bt_dev_err(hdev, "HCI reset during shutdown failed");
- 		return PTR_ERR(skb);
- 	}
- 	kfree_skb(skb);
 =20
- 	return 0;
+ 	return err;
  }
 =20
  static ssize_t force_poll_sync_read(struct file *file, char __user *user_=
buf,
@@@ -4082,7 -4104,7 +4104,7 @@@ static int btusb_probe(struct usb_inter
  	struct btusb_data *data;
  	struct hci_dev *hdev;
  	unsigned ifnum_base;
- 	int err, priv_size;
+ 	int err, priv_size =3D 0;
 =20
  	BT_DBG("intf %p id %p", intf, id);
 =20
@@@ -4101,7 -4123,7 +4123,7 @@@
  			id =3D match;
  	}
 =20
- 	if (id->driver_info =3D=3D BTUSB_IGNORE)
+ 	if (id->driver_info & BTUSB_IGNORE)
  		return -ENODEV;
 =20
  	if (id->driver_info & BTUSB_ATH3012) {
@@@ -4119,6 -4141,7 +4141,7 @@@
  	if (!data)
  		return -ENOMEM;
 =20
+ 	data->match_id =3D id;
  	err =3D usb_find_common_endpoints(intf->cur_altsetting, &data->bulk_rx_e=
p,
  					&data->bulk_tx_ep, &data->intr_ep, NULL);
  	if (err)
@@@ -4152,8 -4175,6 +4175,6 @@@
  	init_usb_anchor(&data->ctrl_anchor);
  	spin_lock_init(&data->rxlock);
 =20
- 	priv_size =3D 0;
-=20
  	data->recv_event =3D hci_recv_frame;
  	data->recv_bulk =3D btusb_recv_bulk;
 =20
@@@ -4172,6 -4193,9 +4193,9 @@@
  	} else if (id->driver_info & BTUSB_MEDIATEK) {
  		/* Allocate extra space for Mediatek device */
  		priv_size +=3D sizeof(struct btmtk_data);
+ 	} else if (id->driver_info & BTUSB_QCA_WCN6855) {
+ 		/* Allocate extra space for QCA WCN6855 device */
+ 		priv_size +=3D sizeof(struct btqca_data);
  	}
 =20
  	data->recv_acl =3D hci_recv_frame;
@@@ -4314,8 -4338,10 +4338,10 @@@
  	}
 =20
  	if (id->driver_info & BTUSB_QCA_WCN6855) {
- 		data->qca_dump.id_vendor =3D id->idVendor;
- 		data->qca_dump.id_product =3D id->idProduct;
+ 		struct btqca_data *btqca_data =3D hci_get_priv(hdev);
+=20
+ 		btqca_data->qca_dump.id_vendor =3D id->idVendor;
+ 		btqca_data->qca_dump.id_product =3D id->idProduct;
  		data->recv_event =3D btusb_recv_evt_qca;
  		data->recv_acl =3D btusb_recv_acl_qca;
  		hci_devcd_register(hdev, btusb_coredump_qca, btusb_dump_hdr_qca, NULL);

--p1FpzjbbT/n1ZYAF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiH5AACgkQJNaLcl1U
h9B/2gf9GJyccBKe9Da7tbDQc+U+bAiptoOdbtPZZg/9DeDBaEJR472HsSqDHvGO
EnyTKsbo3J4rC1DgW+Wpfz2B2yffVmZN+Y2UpMvyuVuhOnvNwCx8gzBC+Xo8RK8G
wt60qFzbXPsQoD8UUbQofruZ/l6a8LvaW9FNOX/BAg8SkrANTyeZRjumHfM1Z8l/
If+Ez3H3He3byLkxDi0gZXl+6DYlW24LiKu8/CBbXaNuaaaiGifMPhKLhUMjbZaJ
JBC8RXPddMmOUNpfDpZ73Z1yE5jVX2qSQJlytQhxE/QeicNdAn2suT0iEfXccrVb
+Ty9hV43N5looUYAOHCamZsmrrIVPQ==
=2p7I
-----END PGP SIGNATURE-----

--p1FpzjbbT/n1ZYAF--
