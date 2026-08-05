Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2AA38DC51;
	Wed,  5 Aug 2026 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940564; cv=none; b=TFI8UK611anmorO28UUuRACRO3FXkGrk52Y+ffPQ8WpbVISWi79yudAlNXC8m91BnnJ6neE6uYhEM0UloNQ42SBnWdl0A7+Dw7Exz9uyUODtta5HJHUOivmM4xxFZiSLEiPp5xyL0MmqJZp1Weo8NAHTqyzn0fxuMQds9eQ3IO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940564; c=relaxed/simple;
	bh=LDRFag0yA5QM1q+M6vQe1UzSjyNkr3HVCs/mri07xQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbAEZ6gWZeatnpoBVHg9hmESBWsJR0+DTrEAIn/RqsTufZuV4yUl4W/gm2yiBbNXUCSyUMfGxqpqPFl7kp9ICH+qTrO2/aFqL+ZDif5jgVlwEeLEtN0O9qyxZJtQOSyzAnfI0if4rV9fVKl4tF/rp/QuOnBkYOJDPBQ3uuGGuxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O43T+/2a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O43T+/2a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525EB1F000E9;
	Wed,  5 Aug 2026 14:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785940554;
	bh=YbhdZJZkkmqDvKmYNbSRa6Bq7c7E2kveTX5qUGNGzFk=;
	h=Date:From:To:Cc:Subject;
	b=O43T+/2a/wUkLNK/10WccQzC/r53GEJHOCne14OfnFq0Gxb+rTAaGrcMhzbM2oaW7
	 z5JeRZ1NBlT2Uw1sZ5JUxPVxfxov2EgHE29++TDmRmOrKNlO2AsNwHuSPwegecBgSR
	 f4H5poby1yQ8Q8wwPw/rEMbVg6bKQuOxjwPFSaH5pYW8eCh1mO4ID4FixhTM1z3kZn
	 r3cAkiMYRldBsu3o6bz/e+SuHM+aolGON3i/C2/PRV8uHF2URS3qUI9lGHIPKsowCK
	 uePJwoUmMnpxDP1Sh1AR7qwQjrigIBuE7DaVmGY3LzbNtyWqcuLCIlAQScC5K6nTEa
	 jUmydbuJ14tJQ==
Date: Wed, 5 Aug 2026 15:35:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pauli Virtanen <pav@iki.fi>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <anNKRv8inSvCMCRb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MmIzuahFlChF6KDN"
Content-Disposition: inline


--MmIzuahFlChF6KDN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  include/net/bluetooth/hci_core.h

between commit:

  af24e338bf5da ("Bluetooth: ISO: fix race of kfree vs kref_get_unless_zero=
")

=66rom the origin tree and commit:

  d740cf77461a4 ("Bluetooth: add annotations for l2cap_data locking context=
")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined include/net/bluetooth/hci_core.h
index 3df59849dcbea,e07418a5adce7..0000000000000
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@@ -416,6 -416,7 +416,7 @@@ struct hci_dev=20
  	__u16		le_conn_max_interval;
  	__u16		le_conn_latency;
  	__u16		le_supv_timeout;
+ 	__u16		le_min_rate_interval;
  	__u16		le_def_tx_len;
  	__u16		le_def_tx_time;
  	__u16		le_max_tx_len;
@@@ -645,6 -646,8 +646,8 @@@
  	int (*setup)(struct hci_dev *hdev);
  	int (*shutdown)(struct hci_dev *hdev);
  	int (*send)(struct hci_dev *hdev, struct sk_buff *skb);
+ 	/* Handle HCI_EV_VENDOR; return true if handled, false otherwise */
+ 	bool (*handle_ev_vendor)(struct hci_dev *hdev, struct sk_buff *skb);
  	void (*notify)(struct hci_dev *hdev, unsigned int evt);
  	void (*hw_error)(struct hci_dev *hdev, u8 code);
  	int (*post_init)(struct hci_dev *hdev);
@@@ -720,6 -723,11 +723,11 @@@ struct hci_conn=20
  	__u16		le_conn_interval;
  	__u16		le_conn_latency;
  	__u16		le_supv_timeout;
+ 	__u16		le_rate_interval;
+ 	__u16		le_subrate;
+ 	__u16		le_rate_latency;
+ 	__u16		le_cont_num;
+ 	__u16		le_rate_supv_timeout;
  	__u8		le_adv_data[HCI_MAX_EXT_AD_LENGTH];
  	__u8		le_adv_data_len;
  	__u8		le_per_adv_data[HCI_MAX_PER_AD_TOT_LEN];
@@@ -769,7 -777,7 +777,7 @@@
  	struct hci_dev	*hdev;
 =20
  	spinlock_t	proto_lock; /* lock guarding protocol data */
- 	void		*l2cap_data;
+ 	void		*l2cap_data __guarded_by(&proto_lock, &hdev->lock);
  	void		*sco_data;
  	void		*iso_data __guarded_by(&proto_lock);
 =20
@@@ -812,6 -820,14 +820,14 @@@ struct hci_conn_params=20
  	u16 conn_latency;
  	u16 supervision_timeout;
 =20
+ 	u16 rate_min_interval;
+ 	u16 rate_max_interval;
+ 	u16 subrate_min;
+ 	u16 subrate_max;
+ 	u16 max_latency;
+ 	u16 cont_num;
+ 	u16 rate_supv_timeout;
+=20
  	enum {
  		HCI_AUTO_CONN_DISABLED,
  		HCI_AUTO_CONN_REPORT,
@@@ -1771,7 -1787,13 +1787,13 @@@ int hci_register_suspend_notifier(struc
  int hci_unregister_suspend_notifier(struct hci_dev *hdev);
  int hci_suspend_dev(struct hci_dev *hdev);
  int hci_resume_dev(struct hci_dev *hdev);
- int hci_reset_dev(struct hci_dev *hdev);
+ int __hci_reset_dev(struct hci_dev *hdev, u8 hw_err_code);
+=20
+ static inline int hci_reset_dev(struct hci_dev *hdev)
+ {
+ 	return __hci_reset_dev(hdev, 0);
+ }
+=20
  int hci_recv_frame(struct hci_dev *hdev, struct sk_buff *skb);
  int hci_recv_diag(struct hci_dev *hdev, struct sk_buff *skb);
  __printf(2, 3) void hci_set_hw_info(struct hci_dev *hdev, const char *fmt=
, ...);
@@@ -2079,6 -2101,11 +2101,11 @@@ void hci_conn_del_sysfs(struct hci_con
  #define le_cs_host_capable(dev) \
  	((dev)->le_features[5] & HCI_LE_CS_HOST)
 =20
+ #define le_sci_capable(dev) \
+ 	((dev)->le_features[9] & HCI_LE_SCI)
+ #define le_sci_enabled(dev) \
+ 	(le_enabled(dev) && le_sci_capable(dev))
+=20
  #define mws_transport_config_capable(dev) (((dev)->commands[30] & 0x08) &=
& \
  	(!hci_test_quirk((dev), HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG)))
 =20
@@@ -2494,6 -2521,8 +2521,8 @@@ void mgmt_advertising_removed(struct so
  int mgmt_phy_configuration_changed(struct hci_dev *hdev, struct sock *ski=
p);
  void mgmt_adv_monitor_device_lost(struct hci_dev *hdev, u16 handle,
  				  bdaddr_t *bdaddr, u8 addr_type);
+ void mgmt_conn_subrate_notify(struct hci_dev *hdev, struct hci_conn *conn,
+ 			      u8 status);
 =20
  int hci_abort_conn(struct hci_conn *conn, u8 reason);
  void hci_le_conn_update(struct hci_conn *conn, u16 min, u16 max, u16 late=
ncy,

--MmIzuahFlChF6KDN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzSkYACgkQJNaLcl1U
h9CT7gf/Vyz5t0/z+2U8FyUHf7CsqDDK+z7ZNYk2wtWG920I2wjW8vXJzpAGPUfq
gRQbQz7WZhnZC114sBq6HbsLkg3vNXUCVfWkv5agZb/aLnS1NcUb50nSfW6ulrPB
XeZ9/q97tsDxS3cpkXMF2Ymq2/SIL3YrDNB+l8BHbk7M2oQpepRFFdt0oUYYMjYU
Idp3JJl6ijgYvxA8RI4k9nxJKhSrLHCVC7rsIj3cR1IRoR8N9ZuyYHjjY+HKuHvT
7QRlKSMrHHXEKzrZoIwzNU35qw4rO4j1FZVdKCjGKp7vreDneWHf6zEtG/UHVFm6
WGlmN0k0wzkb0v3ZxUZ2lIQJ6aD3+g==
=Pgsm
-----END PGP SIGNATURE-----

--MmIzuahFlChF6KDN--
