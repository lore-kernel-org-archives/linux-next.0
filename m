Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C73D523F;
	Wed, 25 Feb 2026 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031848; cv=none; b=GO62r812gsOJwQHviJMXAj3uvobshoAsuhfxcQaEQnE1+F3p+y+egzXjKRjWp1DYBDib0J2heWMxb7DJMfscS2TBWMENmhqZgZkyZPvzCc9b30R8/0qwDO2Obg5NLTgAN1D38Uoetb6Q/2h1yZg1vfnr7TkkfAAbaTTP6rJt450=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031848; c=relaxed/simple;
	bh=Ai5NdgApN4tV+xQUHe4GDxzCYbraeO+hCI9J+eylAFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eb414k+hEFC7NnEGRXAHIP7C9Zyf9BdGDAmNAJlHkuPFrc9y4IRNIaNL4LYWfZjazLyX4gZxKK5gdxXw5wkzAaTQHX5eNbMK0iH0sTaKSJtvTU2+YWbclVi29WyAr9DKW6csAcZwmW14u0Og5oZypWBpf9S7MPbfmKFcuvlLkVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2hFCRIu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2hFCRIu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33B9C116D0;
	Wed, 25 Feb 2026 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772031848;
	bh=Ai5NdgApN4tV+xQUHe4GDxzCYbraeO+hCI9J+eylAFo=;
	h=Date:From:To:Cc:Subject:From;
	b=H2hFCRIuRVmRjDyg7dw8yM1QplmUgQTyx3GipmIsa2f4bbL6CXqTDDCb+gpfziNbs
	 W6p7BGN0VZ9ZqQBXDa0pdNp2k70wKXeG18syHx57oqCT3yfQjvAOV3ZfgvHVjsnN+8
	 eqmpFfxdiMvj9O0vJ/qp0dk8LS0+qizFA1eLpEudaFm9n0w3TBaMOQ57x9llfECz1X
	 i1znci6l9HvHBZKLcoO2qsgEr0lal0BhGGnGxBF/b9q4EC26CIT9K/CD38WaXIqsEC
	 2AE9sY6dOrqjdefNxv+jowTh9eF4kz7n+JE487kRMTz5P5ky1JH5DaGUKAI7TR5Bzw
	 6i4d2w9L8RcVg==
Date: Wed, 25 Feb 2026 15:04:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jinwang Li <jinwang.li@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <aZ8PYys8LFH5WNbQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HAqkT2kRX5P5/cRb"
Content-Disposition: inline


--HAqkT2kRX5P5/cRb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  drivers/bluetooth/hci_qca.c

between commit:

  5c4e9a8b18457 ("Bluetooth: hci_qca: Cleanup on all setup failures")

=66rom the net tree and commits:

  facc2350b0df6 ("Bluetooth: hci_qca: Cleanup on all setup failures")
  88b5c728a785c ("Bluetooth: hci_qca: Fix confusing shutdown() and power_of=
f() naming")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/bluetooth/hci_qca.c
index bb9f002aa85e9,6928820380b80..0000000000000
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@@ -236,8 -236,7 +236,7 @@@ struct qca_serdev=20
 =20
  static int qca_regulator_enable(struct qca_serdev *qcadev);
  static void qca_regulator_disable(struct qca_serdev *qcadev);
- static void qca_power_shutdown(struct hci_uart *hu);
- static int qca_power_off(struct hci_dev *hdev);
+ static void qca_power_off(struct hci_uart *hu);
  static void qca_controller_memdump(struct work_struct *work);
  static void qca_dmp_hdr(struct hci_dev *hdev, struct sk_buff *skb);
 =20
@@@ -585,7 -584,7 +584,7 @@@ static int qca_open(struct hci_uart *hu
  	if (!hci_uart_has_flow_control(hu))
  		return -EOPNOTSUPP;
 =20
 -	qca =3D kzalloc(sizeof(*qca), GFP_KERNEL);
 +	qca =3D kzalloc_obj(*qca);
  	if (!qca)
  		return -ENOMEM;
 =20
@@@ -723,6 -722,10 +722,10 @@@ static int qca_close(struct hci_uart *h
 =20
  	BT_DBG("hu %p qca close", hu);
 =20
+ 	/* BT core skips qca_hci_shutdown() which calls qca_power_off() on rmmod=
 */
+ 	if (!test_bit(QCA_BT_OFF, &qca->flags))
+ 		qca_power_off(hu);
+=20
  	serial_clock_vote(HCI_IBS_VOTE_STATS_UPDATE, hu);
 =20
  	skb_queue_purge(&qca->tx_wait_q);
@@@ -1057,7 -1060,7 +1060,7 @@@ static void qca_controller_memdump(stru
  		}
 =20
  		if (!qca_memdump) {
 -			qca_memdump =3D kzalloc(sizeof(*qca_memdump), GFP_ATOMIC);
 +			qca_memdump =3D kzalloc_obj(*qca_memdump, GFP_ATOMIC);
  			if (!qca_memdump) {
  				mutex_unlock(&qca->hci_memdump_lock);
  				return;
@@@ -1850,6 -1853,7 +1853,7 @@@ static int qca_power_on(struct hci_dev=20
  		return 0;
 =20
  	switch (soc_type) {
+ 	case QCA_QCA6390:
  	case QCA_WCN3950:
  	case QCA_WCN3988:
  	case QCA_WCN3990:
@@@ -1858,7 -1862,6 +1862,6 @@@
  	case QCA_WCN6750:
  	case QCA_WCN6855:
  	case QCA_WCN7850:
- 	case QCA_QCA6390:
  		ret =3D qca_regulator_init(hu);
  		break;
 =20
@@@ -2047,7 -2050,7 +2050,7 @@@ retry
 =20
  out:
  	if (ret) {
- 		qca_power_shutdown(hu);
+ 		qca_power_off(hu);
 =20
  		if (retries < MAX_INIT_RETRIES) {
  			bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
@@@ -2096,6 -2099,18 +2099,18 @@@ static const struct hci_uart_proto qca_
  	.dequeue	=3D qca_dequeue,
  };
 =20
+ static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused =
=3D {
+ 	.soc_type =3D QCA_QCA2066,
+ 	.num_vregs =3D 0,
+ 	.capabilities =3D QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES |
+ 			QCA_CAP_HFP_HW_OFFLOAD,
+ };
+=20
+ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused =
=3D {
+ 	.soc_type =3D QCA_QCA6390,
+ 	.num_vregs =3D 0,
+ };
+=20
  static const struct qca_device_data qca_soc_data_wcn3950 __maybe_unused =
=3D {
  	.soc_type =3D QCA_WCN3950,
  	.vregs =3D (struct qca_vreg []) {
@@@ -2152,18 -2167,6 +2167,6 @@@ static const struct qca_device_data qca
  	.num_vregs =3D 4,
  };
 =20
- static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused =
=3D {
- 	.soc_type =3D QCA_QCA2066,
- 	.num_vregs =3D 0,
- 	.capabilities =3D QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES |
- 			QCA_CAP_HFP_HW_OFFLOAD,
- };
-=20
- static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused =
=3D {
- 	.soc_type =3D QCA_QCA6390,
- 	.num_vregs =3D 0,
- };
-=20
  static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused =
=3D {
  	.soc_type =3D QCA_WCN6750,
  	.vregs =3D (struct qca_vreg []) {
@@@ -2211,7 -2214,7 +2214,7 @@@ static const struct qca_device_data qca
  			QCA_CAP_HFP_HW_OFFLOAD,
  };
 =20
- static void qca_power_shutdown(struct hci_uart *hu)
+ static void qca_power_off(struct hci_uart *hu)
  {
  	struct qca_serdev *qcadev;
  	struct qca_data *qca =3D hu->priv;
@@@ -2261,7 -2264,7 +2264,7 @@@
  		qca_regulator_disable(qcadev);
  		if (qcadev->sw_ctrl) {
  			sw_ctrl_state =3D gpiod_get_value_cansleep(qcadev->sw_ctrl);
- 			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
+ 			BT_DBG("SW_CTRL is %d", sw_ctrl_state);
  		}
  		break;
 =20
@@@ -2272,7 -2275,7 +2275,7 @@@
  	set_bit(QCA_BT_OFF, &qca->flags);
  }
 =20
- static int qca_power_off(struct hci_dev *hdev)
+ static int qca_hci_shutdown(struct hci_dev *hdev)
  {
  	struct hci_uart *hu =3D hci_get_drvdata(hdev);
  	struct qca_data *qca =3D hu->priv;
@@@ -2291,7 -2294,7 +2294,7 @@@
  		usleep_range(8000, 10000);
  	}
 =20
- 	qca_power_shutdown(hu);
+ 	qca_power_off(hu);
  	return 0;
  }
 =20
@@@ -2402,6 -2405,7 +2405,7 @@@ static int qca_serdev_probe(struct serd
  		qcadev->btsoc_type =3D QCA_ROME;
 =20
  	switch (qcadev->btsoc_type) {
+ 	case QCA_QCA6390:
  	case QCA_WCN3950:
  	case QCA_WCN3988:
  	case QCA_WCN3990:
@@@ -2410,7 -2414,6 +2414,6 @@@
  	case QCA_WCN6750:
  	case QCA_WCN6855:
  	case QCA_WCN7850:
- 	case QCA_QCA6390:
  		qcadev->bt_power =3D devm_kzalloc(&serdev->dev,
  						sizeof(struct qca_power),
  						GFP_KERNEL);
@@@ -2422,9 -2425,9 +2425,9 @@@
  	}
 =20
  	switch (qcadev->btsoc_type) {
+ 	case QCA_WCN6750:
  	case QCA_WCN6855:
  	case QCA_WCN7850:
- 	case QCA_WCN6750:
  		if (!device_property_present(&serdev->dev, "enable-gpios")) {
  			/*
  			 * Backward compatibility with old DT sources. If the
@@@ -2530,7 -2533,7 +2533,7 @@@
 =20
  	if (power_ctrl_enabled) {
  		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
- 		hdev->shutdown =3D qca_power_off;
+ 		hdev->shutdown =3D qca_hci_shutdown;
  	}
 =20
  	if (data) {
@@@ -2565,7 -2568,7 +2568,7 @@@ static void qca_serdev_remove(struct se
  	case QCA_WCN6855:
  	case QCA_WCN7850:
  		if (power->vregs_on)
- 			qca_power_shutdown(&qcadev->serdev_hu);
+ 			qca_power_off(&qcadev->serdev_hu);
  		break;
  	default:
  		break;
@@@ -2574,10 -2577,11 +2577,10 @@@
  	hci_uart_unregister_device(&qcadev->serdev_hu);
  }
 =20
 -static void qca_serdev_shutdown(struct device *dev)
 +static void qca_serdev_shutdown(struct serdev_device *serdev)
  {
  	int ret;
  	int timeout =3D msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
 -	struct serdev_device *serdev =3D to_serdev_device(dev);
  	struct qca_serdev *qcadev =3D serdev_device_get_drvdata(serdev);
  	struct hci_uart *hu =3D &qcadev->serdev_hu;
  	struct hci_dev *hdev =3D hu->hdev;
@@@ -2799,11 -2803,11 +2802,11 @@@ static void hciqca_coredump(struct devi
  static struct serdev_device_driver qca_serdev_driver =3D {
  	.probe =3D qca_serdev_probe,
  	.remove =3D qca_serdev_remove,
 +	.shutdown =3D qca_serdev_shutdown,
  	.driver =3D {
  		.name =3D "hci_uart_qca",
  		.of_match_table =3D of_match_ptr(qca_bluetooth_of_match),
  		.acpi_match_table =3D ACPI_PTR(qca_bluetooth_acpi_match),
 -		.shutdown =3D qca_serdev_shutdown,
  		.pm =3D &qca_pm_ops,
  #ifdef CONFIG_DEV_COREDUMP
  		.coredump =3D hciqca_coredump,

--HAqkT2kRX5P5/cRb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmfD2MACgkQJNaLcl1U
h9BQWwf+ObMlYdNllTcylDHoMbNIg2Uuk8p5uyYZdPtD9u8sFNTAt2lBfawZQcPx
WrdF+hn10GXuCsYCI8oPRR1DKNtFPwCC6ZhW2JEb+NxfbG7o0yMNI1yKWxM2Xrec
aPlfoOfyq7C8nZvVQ+PyyvlENdI0ACWbxbp2WdJe1S/agDnqGzSesNKjRY1Iui/B
TC6Hn53S63RbIYctDqF8+tZOpfLzIXCTIS61aK57TqdH+tbJrpTKSiiBqk3u54kO
YKvypWSnjoOtXX4oFvV06GuwNxLn3t7gjJtJnuEoD189klMRPEgYK2RUPl0xIMKR
zga6qfEY4sY+zE8nMrB+mtmR9UOnqA==
=8eQc
-----END PGP SIGNATURE-----

--HAqkT2kRX5P5/cRb--
