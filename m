Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D67333441;
	Tue, 28 Jul 2026 16:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256022; cv=none; b=Ss2jpiSYOofkVhdZ1mPeWGUUeipK3BcUqkVHgDOYgZeIDOGrtEoPUGBPZ28DNMBVglgY03iuSEwlrg6CffaoOWpZiTbiXyPeaCfwuoxWplWF1zftnkrzvH46u/TBj+dnNsfWUlAI8qoO2o3QDSPvwuVI2kyv9ZXTf9gmgkWkOKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256022; c=relaxed/simple;
	bh=JTs6zCoDemhYT388OTSFMIK/oDxnjCFJACb8wMhBOgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNqxKTeblWvIBC2BDF4bf1+D8tjeThSPt2OxRmGeaO55vBI+/9s/ew2HXZI0o5aDZ5OSsh3vcE8cZInxpdCiPAsaEobVxvTk0y7x3w8qSCBWhfLCQpUiARG759dWnlUxrvkQsdz8XRoR69WcAC0OUT/Jv/d3hPCSsQiwebRy+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdr0T14x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdr0T14x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453C21F000E9;
	Tue, 28 Jul 2026 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785256020;
	bh=77bVyEuRT8TKdfNtoNbJH95rglmduxN6Lpukc4UpGRE=;
	h=Date:From:To:Cc:Subject;
	b=kdr0T14xrCXKgabV/TmFJLsOd+8E1DGELQTLIFuYf+17Kh6SJcN+lJmx5421f8BQJ
	 ND5oqd+gb4pgrrrHvAzEM77xNf+VPtjZ3+W2WP2Hg7vaWU+mTxx7tU1sW/7GY+UJGP
	 1NhzDJW3ne9j4BD5eB8D8oYjEPnK1A+u1BzOBRLZ9rZsiLTykzohlcglYvK6L0nl1X
	 wK9tpgBVIkNc/jC3/5t2MttZf5EotfxnYMH1/adGfWJjIZu7cTTKpNrljOneV9rZ64
	 pMgD3KWnr/8jTcdubesjZupnX5SyNKvWBJVpq6J8VFwr/Nk2pDo+co1hFteimDcxpW
	 YwpS5+YMc9Kww==
Date: Tue, 28 Jul 2026 17:26:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pauli Virtanen <pav@iki.fi>, Siwei Zhang <oss@fourdim.xyz>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <amjYUHEfctCXrlm0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EBJlk40Lh0Y6ui4C"
Content-Disposition: inline


--EBJlk40Lh0Y6ui4C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/hci_sync.c

between commit:

  12917f591cea1 ("Bluetooth: hci_conn: Fix null ptr deref in hci_abort_conn=
()")

=66rom the origin tree and commits:

  76c2d047410ba ("Bluetooth: hci_conn: Fix null ptr deref in hci_abort_conn=
()")
  73b6871b261f3 ("Bluetooth: hci_sync: remove unnecessary hci_conn_get in c=
reate_conn_sync")
  423e5fc465eb1 ("Bluetooth: hci_sync: fix hci_conn_del() use in hci_le_cre=
ate_conn_sync")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/bluetooth/hci_sync.c
index c0b1fc293b496,7779d9d1663a4..0000000000000
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@@ -860,32 -860,6 +860,6 @@@ void hci_cmd_sync_cancel_entry(struct h
  }
  EXPORT_SYMBOL(hci_cmd_sync_cancel_entry);
 =20
- /* Dequeue one HCI command entry:
-  *
-  * - Lookup and cancel first entry that matches.
-  */
- bool hci_cmd_sync_dequeue_once(struct hci_dev *hdev,
- 			       hci_cmd_sync_work_func_t func,
- 			       void *data, hci_cmd_sync_work_destroy_t destroy)
- {
- 	struct hci_cmd_sync_work_entry *entry;
-=20
- 	mutex_lock(&hdev->cmd_sync_work_lock);
-=20
- 	entry =3D _hci_cmd_sync_lookup_entry(hdev, func, data, destroy);
- 	if (!entry) {
- 		mutex_unlock(&hdev->cmd_sync_work_lock);
- 		return false;
- 	}
-=20
- 	_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
-=20
- 	mutex_unlock(&hdev->cmd_sync_work_lock);
-=20
- 	return true;
- }
- EXPORT_SYMBOL(hci_cmd_sync_dequeue_once);
-=20
  /* Dequeue HCI command entry:
   *
   * - Lookup and cancel any entry that matches by function callback or dat=
a or
@@@ -1233,10 -1207,11 +1207,11 @@@ static int hci_set_adv_set_random_addr_
  }
 =20
  static int
- hci_set_ext_adv_params_sync(struct hci_dev *hdev, struct adv_info *adv,
+ hci_set_ext_adv_params_sync(struct hci_dev *hdev, u8 instance,
  			    const struct hci_cp_le_set_ext_adv_params *cp,
  			    struct hci_rp_le_set_ext_adv_params *rp)
  {
+ 	struct adv_info *adv;
  	struct sk_buff *skb;
 =20
  	skb =3D __hci_cmd_sync(hdev, HCI_OP_LE_SET_EXT_ADV_PARAMS, sizeof(*cp),
@@@ -1264,11 -1239,15 +1239,15 @@@
 =20
  	if (!rp->status) {
  		hdev->adv_addr_type =3D cp->own_addr_type;
- 		if (!cp->handle) {
+ 		if (!instance) {
  			/* Store in hdev for instance 0 */
  			hdev->adv_tx_power =3D rp->tx_power;
- 		} else if (adv) {
- 			adv->tx_power =3D rp->tx_power;
+ 		} else {
+ 			hci_dev_lock(hdev);
+ 			adv =3D hci_find_adv_instance(hdev, instance);
+ 			if (adv)
+ 				adv->tx_power =3D rp->tx_power;
+ 			hci_dev_unlock(hdev);
  		}
  	}
 =20
@@@ -1284,9 -1263,13 +1263,13 @@@ static int hci_set_ext_adv_data_sync(st
  	int err;
 =20
  	if (instance) {
+ 		hci_dev_lock(hdev);
+=20
  		adv =3D hci_find_adv_instance(hdev, instance);
- 		if (!adv || !adv->adv_data_changed)
+ 		if (!adv || !adv->adv_data_changed) {
+ 			hci_dev_unlock(hdev);
  			return 0;
+ 		}
  	}
 =20
  	len =3D eir_create_adv_data(hdev, instance, pdu->data,
@@@ -1297,16 -1280,27 +1280,27 @@@
  	pdu->operation =3D LE_SET_ADV_DATA_OP_COMPLETE;
  	pdu->frag_pref =3D LE_SET_ADV_DATA_NO_FRAG;
 =20
+ 	if (adv) {
+ 		adv->adv_data_changed =3D false;
+ 		hci_dev_unlock(hdev);
+ 	}
+=20
  	err =3D __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_EXT_ADV_DATA,
  				    struct_size(pdu, data, len), pdu,
  				    HCI_CMD_TIMEOUT);
- 	if (err)
- 		return err;
+ 	if (err) {
+ 		if (instance) {
+ 			hci_dev_lock(hdev);
+ 			adv =3D hci_find_adv_instance(hdev, instance);
+ 			if (adv)
+ 				adv->adv_data_changed =3D true;
+ 			hci_dev_unlock(hdev);
+ 		}
 =20
- 	/* Update data if the command succeed */
- 	if (adv) {
- 		adv->adv_data_changed =3D false;
- 	} else {
+ 		return err;
+ 	}
+=20
+ 	if (!instance) {
  		memcpy(hdev->adv_data, pdu->data, len);
  		hdev->adv_data_len =3D len;
  	}
@@@ -1360,22 -1354,22 +1354,22 @@@ int hci_setup_ext_adv_instance_sync(str
  	struct adv_info *adv;
  	bool secondary_adv;
 =20
- 	if (instance > 0) {
- 		adv =3D hci_find_adv_instance(hdev, instance);
- 		if (!adv)
- 			return -EINVAL;
- 	} else {
- 		adv =3D NULL;
- 	}
-=20
  	/* Updating parameters of an active instance will return a
- 	 * Command Disallowed error, so we must first disable the
- 	 * instance if it is active.
+ 	 * Command Disallowed error, so disable it before taking a snapshot.
  	 */
- 	if (adv) {
+ 	if (instance > 0) {
  		err =3D hci_disable_ext_adv_instance_sync(hdev, instance);
  		if (err)
  			return err;
+=20
+ 		hci_dev_lock(hdev);
+ 		adv =3D hci_find_adv_instance(hdev, instance);
+ 		if (!adv) {
+ 			hci_dev_unlock(hdev);
+ 			return -EINVAL;
+ 		}
+ 	} else {
+ 		adv =3D NULL;
  	}
 =20
  	flags =3D hci_adv_instance_flags(hdev, instance);
@@@ -1386,8 -1380,11 +1380,11 @@@
  	connectable =3D (flags & MGMT_ADV_FLAG_CONNECTABLE) ||
  		      mgmt_get_connectable(hdev);
 =20
- 	if (!is_advertising_allowed(hdev, connectable))
+ 	if (!is_advertising_allowed(hdev, connectable)) {
+ 		if (instance)
+ 			hci_dev_unlock(hdev);
  		return -EPERM;
+ 	}
 =20
  	/* Set require_privacy to true only when non-connectable
  	 * advertising is used and it is not periodic.
@@@ -1398,8 -1395,11 +1395,11 @@@
  	err =3D hci_get_random_address(hdev, require_privacy,
  				     adv_use_rpa(hdev, flags), adv,
  				     &own_addr_type, &random_addr);
- 	if (err < 0)
+ 	if (err < 0) {
+ 		if (instance)
+ 			hci_dev_unlock(hdev);
  		return err;
+ 	}
 =20
  	memset(&cp, 0, sizeof(cp));
 =20
@@@ -1450,6 -1450,9 +1450,9 @@@
  	cp.channel_map =3D hdev->le_adv_channel_map;
  	cp.handle =3D adv ? adv->handle : instance;
 =20
+ 	if (instance)
+ 		hci_dev_unlock(hdev);
+=20
  	if (flags & MGMT_ADV_FLAG_SEC_2M) {
  		cp.primary_phy =3D HCI_ADV_PHY_1M;
  		cp.secondary_phy =3D HCI_ADV_PHY_2M;
@@@ -1462,12 -1465,12 +1465,12 @@@
  		cp.secondary_phy =3D HCI_ADV_PHY_1M;
  	}
 =20
- 	err =3D hci_set_ext_adv_params_sync(hdev, adv, &cp, &rp);
+ 	err =3D hci_set_ext_adv_params_sync(hdev, instance, &cp, &rp);
  	if (err)
  		return err;
 =20
  	/* Update adv data as tx power is known now */
- 	err =3D hci_set_ext_adv_data_sync(hdev, cp.handle);
+ 	err =3D hci_set_ext_adv_data_sync(hdev, instance);
  	if (err)
  		return err;
 =20
@@@ -1475,9 -1478,14 +1478,14 @@@
  	     own_addr_type =3D=3D ADDR_LE_DEV_RANDOM_RESOLVED) &&
  	    bacmp(&random_addr, BDADDR_ANY)) {
  		/* Check if random address need to be updated */
- 		if (adv) {
- 			if (!bacmp(&random_addr, &adv->random_addr))
+ 		if (instance) {
+ 			hci_dev_lock(hdev);
+ 			adv =3D hci_find_adv_instance(hdev, instance);
+ 			if (!adv || !bacmp(&random_addr, &adv->random_addr)) {
+ 				hci_dev_unlock(hdev);
  				return 0;
+ 			}
+ 			hci_dev_unlock(hdev);
  		} else {
  			if (!bacmp(&random_addr, &hdev->random_addr))
  				return 0;
@@@ -1499,9 -1507,13 +1507,13 @@@ static int hci_set_ext_scan_rsp_data_sy
  	int err;
 =20
  	if (instance) {
+ 		hci_dev_lock(hdev);
+=20
  		adv =3D hci_find_adv_instance(hdev, instance);
- 		if (!adv || !adv->scan_rsp_changed)
+ 		if (!adv || !adv->scan_rsp_changed) {
+ 			hci_dev_unlock(hdev);
  			return 0;
+ 		}
  	}
 =20
  	len =3D eir_create_scan_rsp(hdev, instance, pdu->data);
@@@ -1511,15 -1523,27 +1523,27 @@@
  	pdu->operation =3D LE_SET_ADV_DATA_OP_COMPLETE;
  	pdu->frag_pref =3D LE_SET_ADV_DATA_NO_FRAG;
 =20
+ 	if (adv) {
+ 		adv->scan_rsp_changed =3D false;
+ 		hci_dev_unlock(hdev);
+ 	}
+=20
  	err =3D __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_EXT_SCAN_RSP_DATA,
  				    struct_size(pdu, data, len), pdu,
  				    HCI_CMD_TIMEOUT);
- 	if (err)
- 		return err;
+ 	if (err) {
+ 		if (instance) {
+ 			hci_dev_lock(hdev);
+ 			adv =3D hci_find_adv_instance(hdev, instance);
+ 			if (adv)
+ 				adv->scan_rsp_changed =3D true;
+ 			hci_dev_unlock(hdev);
+ 		}
 =20
- 	if (adv) {
- 		adv->scan_rsp_changed =3D false;
- 	} else {
+ 		return err;
+ 	}
+=20
+ 	if (!instance) {
  		memcpy(hdev->scan_rsp_data, pdu->data, len);
  		hdev->scan_rsp_data_len =3D len;
  	}
@@@ -1534,8 -1558,14 +1558,14 @@@ static int __hci_set_scan_rsp_data_sync
 =20
  	memset(&cp, 0, sizeof(cp));
 =20
+ 	if (instance)
+ 		hci_dev_lock(hdev);
+=20
  	len =3D eir_create_scan_rsp(hdev, instance, cp.data);
 =20
+ 	if (instance)
+ 		hci_dev_unlock(hdev);
+=20
  	if (hdev->scan_rsp_data_len =3D=3D len &&
  	    !memcmp(cp.data, hdev->scan_rsp_data, len))
  		return 0;
@@@ -1670,9 -1700,13 +1700,13 @@@ static int hci_set_per_adv_data_sync(st
  	struct adv_info *adv =3D NULL;
 =20
  	if (instance) {
+ 		hci_dev_lock(hdev);
+=20
  		adv =3D hci_find_adv_instance(hdev, instance);
- 		if (!adv || !adv->periodic)
+ 		if (!adv || !adv->periodic) {
+ 			hci_dev_unlock(hdev);
  			return 0;
+ 		}
  	}
 =20
  	len =3D eir_create_per_adv_data(hdev, instance, pdu->data);
@@@ -1681,6 -1715,9 +1715,9 @@@
  	pdu->handle =3D adv ? adv->handle : instance;
  	pdu->operation =3D LE_SET_ADV_DATA_OP_COMPLETE;
 =20
+ 	if (adv)
+ 		hci_dev_unlock(hdev);
+=20
  	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_PER_ADV_DATA,
  				     struct_size(pdu, data, len), pdu,
  				     HCI_CMD_TIMEOUT);
@@@ -3717,18 -3754,20 +3754,20 @@@ static const struct hci_init_stage hci_
 =20
  int hci_reset_sync(struct hci_dev *hdev)
  {
- 	int err;
-=20
  	set_bit(HCI_RESET, &hdev->flags);
 =20
- 	err =3D __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
- 				    HCI_CMD_TIMEOUT);
- 	if (err)
- 		return err;
-=20
- 	return 0;
+ 	return __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
+ 				     HCI_CMD_TIMEOUT);
  }
 =20
+ /* Send a raw HCI reset for use by vendor drivers */
+ int __hci_reset_sync(struct hci_dev *hdev)
+ {
+ 	return __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
+ 				     HCI_INIT_TIMEOUT);
+ }
+ EXPORT_SYMBOL(__hci_reset_sync);
+=20
  static int hci_init0_sync(struct hci_dev *hdev)
  {
  	int err;
@@@ -6523,7 -6562,7 +6562,7 @@@ static int hci_le_ext_directed_advertis
  	if (err)
  		return err;
 =20
- 	err =3D hci_set_ext_adv_params_sync(hdev, NULL, &cp, &rp);
+ 	err =3D hci_set_ext_adv_params_sync(hdev, 0, &cp, &rp);
  	if (err)
  		return err;
 =20
@@@ -6678,11 -6717,6 +6717,11 @@@ static int hci_le_create_conn_sync(stru
 =20
  	bt_dev_dbg(hdev, "conn %p", conn);
 =20
 +	/* Hold a reference so conn stays valid for the HCI_CONN_CREATE
 +	 * clear_bit() at done.
 +	 */
 +	hci_conn_get(conn);
 +
  	clear_bit(HCI_CONN_SCANNING, &conn->flags);
  	conn->state =3D BT_CONNECT;
 =20
@@@ -6694,8 -6728,9 +6733,9 @@@
  		if (hci_dev_test_flag(hdev, HCI_LE_SCAN) &&
  		    hdev->le_scan_type =3D=3D LE_SCAN_ACTIVE &&
  		    !hci_dev_test_flag(hdev, HCI_LE_SIMULTANEOUS_ROLES)) {
- 			hci_conn_del(conn);
- 			hci_conn_put(conn);
+ 			conn->state =3D BT_OPEN;
+ 			hci_abort_conn_sync(hdev, conn,
+ 					    HCI_ERROR_REJ_LIMITED_RESOURCES);
  			return -EBUSY;
  		}
 =20
@@@ -6793,7 -6828,6 +6833,7 @@@ done
 =20
  	/* Re-enable advertising after the connection attempt is finished. */
  	hci_resume_advertising_sync(hdev);
 +	hci_conn_put(conn);
  	return err;
  }
 =20
@@@ -7068,11 -7102,6 +7108,6 @@@ static int hci_acl_create_conn_sync(str
  	else
  		cp.role_switch =3D 0x00;
 =20
- 	/* Hold a reference so conn stays valid for the HCI_CONN_CREATE
- 	 * clear_bit() below.
- 	 */
- 	hci_conn_get(conn);
-=20
  	/* Mark create connection in flight so hci_cancel_connect_sync() can
  	 * cancel it while blocking on the connection complete event.
  	 */
@@@ -7084,17 -7113,27 +7119,27 @@@
  				       conn->conn_timeout, NULL);
 =20
  	clear_bit(HCI_CONN_CREATE, &conn->flags);
- 	hci_conn_put(conn);
 =20
  	return err;
  }
 =20
+ static void hci_acl_create_conn_sync_complete(struct hci_dev *hdev, void =
*data,
+ 					      int err)
+ {
+ 	struct hci_conn *conn =3D data;
+=20
+ 	hci_conn_put(conn);
+ }
+=20
  int hci_connect_acl_sync(struct hci_dev *hdev, struct hci_conn *conn)
  {
  	int err;
 =20
- 	err =3D hci_cmd_sync_queue_once(hdev, hci_acl_create_conn_sync, conn,
- 				      NULL);
+ 	err =3D hci_cmd_sync_queue_once(hdev, hci_acl_create_conn_sync,
+ 				      hci_conn_get(conn),
+ 				      hci_acl_create_conn_sync_complete);
+ 	if (err)
+ 		hci_conn_put(conn);
  	return (err =3D=3D -EEXIST) ? 0 : err;
  }
 =20
@@@ -7105,36 -7144,41 +7150,41 @@@ static void create_le_conn_complete(str
  	bt_dev_dbg(hdev, "err %d", err);
 =20
  	if (err =3D=3D -ECANCELED)
- 		return;
+ 		goto done;
 =20
  	hci_dev_lock(hdev);
 =20
  	if (!hci_conn_valid(hdev, conn))
- 		goto done;
+ 		goto unlock;
 =20
  	if (!err) {
  		hci_connect_le_scan_cleanup(conn, 0x00);
- 		goto done;
+ 		goto unlock;
  	}
 =20
  	/* Check if connection is still pending */
  	if (conn !=3D hci_lookup_le_connect(hdev))
- 		goto done;
+ 		goto unlock;
 =20
  	/* Flush to make sure we send create conn cancel command if needed */
  	flush_delayed_work(&conn->le_conn_timeout);
  	hci_conn_failed(conn, bt_status(err));
 =20
- done:
+ unlock:
  	hci_dev_unlock(hdev);
+ done:
+ 	hci_conn_put(conn);
  }
 =20
  int hci_connect_le_sync(struct hci_dev *hdev, struct hci_conn *conn)
  {
  	int err;
 =20
- 	err =3D hci_cmd_sync_queue_once(hdev, hci_le_create_conn_sync, conn,
+ 	err =3D hci_cmd_sync_queue_once(hdev, hci_le_create_conn_sync,
+ 				      hci_conn_get(conn),
  				      create_le_conn_complete);
+ 	if (err)
+ 		hci_conn_put(conn);
  	return (err =3D=3D -EEXIST) ? 0 : err;
  }
 =20
@@@ -7257,7 -7301,7 +7307,7 @@@ static void create_pa_complete(struct h
  	bt_dev_dbg(hdev, "err %d", err);
 =20
  	if (err =3D=3D -ECANCELED)
- 		return;
+ 		goto done;
 =20
  	hci_dev_lock(hdev);
 =20
@@@ -7281,6 -7325,8 +7331,8 @@@
 =20
  unlock:
  	hci_dev_unlock(hdev);
+ done:
+ 	hci_conn_put(conn);
  }
 =20
  static int hci_le_past_params_sync(struct hci_dev *hdev, struct hci_conn =
*conn,
@@@ -7431,8 -7477,11 +7483,11 @@@ int hci_connect_pa_sync(struct hci_dev=20
  {
  	int err;
 =20
- 	err =3D hci_cmd_sync_queue_once(hdev, hci_le_pa_create_sync, conn,
+ 	err =3D hci_cmd_sync_queue_once(hdev, hci_le_pa_create_sync,
+ 				      hci_conn_get(conn),
  				      create_pa_complete);
+ 	if (err)
+ 		hci_conn_put(conn);
  	return (err =3D=3D -EEXIST) ? 0 : err;
  }
 =20
@@@ -7443,10 -7492,12 +7498,12 @@@ static void create_big_complete(struct=
=20
  	bt_dev_dbg(hdev, "err %d", err);
 =20
  	if (err =3D=3D -ECANCELED)
- 		return;
+ 		goto done;
 =20
- 	if (hci_conn_valid(hdev, conn))
- 		clear_bit(HCI_CONN_CREATE_BIG_SYNC, &conn->flags);
+ 	clear_bit(HCI_CONN_CREATE_BIG_SYNC, &conn->flags);
+=20
+ done:
+ 	hci_conn_put(conn);
  }
 =20
  static int hci_le_big_create_sync(struct hci_dev *hdev, void *data)
@@@ -7498,8 -7549,14 +7555,14 @@@ int hci_connect_big_sync(struct hci_de
  {
  	int err;
 =20
- 	err =3D hci_cmd_sync_queue_once(hdev, hci_le_big_create_sync, conn,
+ 	if (!conn)
+ 		return 0;
+=20
+ 	err =3D hci_cmd_sync_queue_once(hdev, hci_le_big_create_sync,
+ 				      hci_conn_get(conn),
  				      create_big_complete);
+ 	if (err)
+ 		hci_conn_put(conn);
  	return (err =3D=3D -EEXIST) ? 0 : err;
  }
 =20
@@@ -7514,6 -7571,8 +7577,8 @@@ static void past_complete(struct hci_de
 =20
  	bt_dev_dbg(hdev, "err %d", err);
 =20
+ 	hci_conn_put(past->conn);
+ 	hci_conn_put(past->le);
  	kfree(past);
  }
 =20
@@@ -7578,8 -7637,8 +7643,8 @@@ int hci_past_sync(struct hci_conn *conn
  	if (!data)
  		return -ENOMEM;
 =20
- 	data->conn =3D conn;
- 	data->le =3D le;
+ 	data->conn =3D hci_conn_get(conn);
+ 	data->le =3D hci_conn_get(le);
 =20
  	if (conn->role =3D=3D HCI_ROLE_MASTER)
  		err =3D hci_cmd_sync_queue_once(conn->hdev,
@@@ -7589,8 -7648,11 +7654,11 @@@
  		err =3D hci_cmd_sync_queue_once(conn->hdev, hci_le_past_sync,
  					      data, past_complete);
 =20
- 	if (err)
+ 	if (err) {
+ 		hci_conn_put(data->conn);
+ 		hci_conn_put(data->le);
  		kfree(data);
+ 	}
 =20
  	return (err =3D=3D -EEXIST) ? 0 : err;
  }

--EBJlk40Lh0Y6ui4C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpo2E8ACgkQJNaLcl1U
h9BTMAf/VEch7C8H3557PiRH//qcaDSRBfUq0PNxzn0sQVH66z+z+gbhWSSM/dPL
mMIHa4Typ42ITfElEFmDm5wYLWpjFFmPKH+gp4EtOyazHgegwYXMSlvJV1xh05AV
iN0yk8W+XIhUm2HMhb8yvW8sSQ25fN7WXCQIbrDdrVDg6pgitVLjjUNMCTmTtEeG
S7VXIA4faLyxSg5lHSS9/H9ufRTfVjmkHN/G1Kkn0dTBIIory2P71Bp9Rd5yz/Sx
WJQ1LTvovMfaLBc2qqtRqnvRo3Wt/CWjkPduF9wxPWOq4CCQYCFCWqh6i7ojXczY
Q8RzSvjoLJIMZWRHZyA4Jrv/awH7Lg==
=XTUx
-----END PGP SIGNATURE-----

--EBJlk40Lh0Y6ui4C--
