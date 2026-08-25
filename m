Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA173D8901;
	Tue, 25 Aug 2026 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663341; cv=none; b=GqErdQoJJxA0A/J6HL4HWIUTpBYgSb+BietazWExNooTdnM8Sk45TFaawgX173aH9/aHxeRb9Axb1kJ1o42Lqp8JhhXS9swXqVZoQjFhI+7VR/dZdCRI8c7HVyfmj4l9B7of4BAtLz/xSNNPWiHjxcj3F5mzg7+8YFAv/B4cqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663341; c=relaxed/simple;
	bh=h9bIC1azBym00rT0PXVDQKnSGZoOBXonKHhDXdHv/M0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PNIZswHLRG7GgXNnp6ZEWuzv8YlMCmtYxubiBEwN0nCYTMFi/ZOpCYZD/AHq/JLmsS3NZShPDUaNCQRljyPiFz70s44arj3yCob/CyobkyJaFqWiee0OnfBWOa8wCu4opzSpHnh5+HwLsgcqeW2JcVXQgT/r4Vr+kYvNGC9WClk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJzWvfD9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJzWvfD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D937D1F000E9;
	Tue, 25 Aug 2026 13:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787663338;
	bh=7S2OHiZRLrBzMKxXlGS0TeKgoxe+74QJ3jHppDjDjcg=;
	h=Date:From:To:Cc:Subject;
	b=FJzWvfD9s7JzQnjrqO28d5NTmz0vQ1sM4PFo5N3suw4lfKSZpjJ438upVztQqZWod
	 6xJeGVQ3ajGLXB1ceGkjduaKzh5qbw+PXxk9dycoyYP6PqwZur2tCjv6EozFYWg1np
	 28/mHW04h58nsVRiwXysYQa7w7QeRV9h5mEYaJ9U01shk+0J0hxe+vthunPPHxQgss
	 fOWtfl66SB3d4IiF3UvBHR/0tuQu9T2ZiikQ76Et5syUh3uHIYiHIvz1xx3iemVV6p
	 JIJu6pJ/gvdpv0eeD4qUofUXZdoGtwjujs60xXyZwoiMygRopyf3tzrZoGDHKVfhe3
	 p5rmct6JXcptw==
Date: Tue, 25 Aug 2026 14:08:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <ao2T50J2OT-wlZke@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gc4hddyfb8luuHbL"
Content-Disposition: inline


--gc4hddyfb8luuHbL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0c9d2588a514f ("Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a728")
  14a97a38ba8f2 ("Bluetooth: eir: Fix OOB read in eir_get_service_data()")
  1c08039e3887f ("Bluetooth: RFCOMM: Validate MTU in rfcomm_apply_pn() to prevent infinite loop")
  1fcf216462ec3 ("Bluetooth: btnxpuart: Validate the FW dump header length")
  262cb784c96cb ("Bluetooth: btmtksdio: Fix out-of-bounds DMA read in the TX path")
  26cf20d065b31 ("Bluetooth: hci_sync: add conditional locking annotations")
  32b42c0704fdd ("Bluetooth: hci_bcm: fix usage_count leak when autosuspend_delay is negative")
  40c621391de93 ("Bluetooth: RFCOMM: serialize security confirmation handling")
  486f8908aa587 ("Bluetooth: ISO: fix use-after-free of listener socket in iso_conn_ready")
  54c03e6bc7188 ("Bluetooth: btmtk: Do not discard the subsystem reset timeout")
  762385e862009 ("Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv reports on BCM4378")
  771e812f94b32 ("Bluetooth: btmtk: Do not report success when subsys reset fails")
  951d9f743029b ("Bluetooth: btmtksdio: Take exclusive ownership of the SKB before TX")
  99672791e9c9f ("Bluetooth: mgmt: fix 'hdev->discovery.uuids' NULL dereference")
  9db7e5fffbaec ("Bluetooth: L2CAP: reject accept queue add unless BT_LISTEN")
  9e257e3586428 ("Bluetooth: hci_h5: fix usage_count leak when autosuspend_delay is negative")
  aadb3cd4bbb47 ("Bluetooth: do not leak an hci_conn when a second LE connect is rejected")
  b8d936018ce2b ("Bluetooth: hci_uart: Fix false success return in hci_uart_setup()")
  bc2791e60e082 ("Bluetooth: hci_intel: fix usage_count leak when autosuspend_delay is negative")
  be766d775060e ("Bluetooth: hci_core: use skb_get() instead of skb_clone() for req_skb")
  d1b752f552896 ("Bluetooth: L2CAP: access chan->conn safely in get/setsockopt")
  d2d1c215ce117 ("Bluetooth: hci_conn: re-enable advertising only for peripheral role")
  d67f4a43e7ef8 ("Bluetooth: L2CAP: fix race l2cap_sock_cleanup_listen() vs. put_chan")
  e4d6d16f1be19 ("Bluetooth: hci_event: clear HCI_LE_ADV only on a created connection")
  ed516e3f1aa61 ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when dropping the last request")
  f716a05f49671 ("Bluetooth: btnxpuart: Check remote M.2 connector availability before pwrseq")
  fe3897b4ab57b ("Bluetooth: RFCOMM: serialize session teardown")

--gc4hddyfb8luuHbL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNk+YACgkQJNaLcl1U
h9DUgwf/cHYGmggCxKsoL4FifyrWvGVwzvxMwYZI5r2pmrj2FmYup8Joexapxxgv
Zfi8trw/nlekE/eS+G22HRsXUoDCyabvghuEcCYq4Dv6RrGqniMDqXUc06Q8+2Fu
ZBczTD/Q+wiMbErGekfHeYTdyzdpHAZO+zlw3krs8BiNhnxH7SNK/TmSmu0V9QrL
WyfvqgO4JfohFiGQmWCfNdz+IZuKsy+/tMszPye1EY3eeMgQF5QRLW3WvxVincPK
bJVWpe4/WBDLCeITDokBttd2pVjXr7EtzgPwnbUrgztbeKHeGBEI3IhYoJO7Z7yU
PGe4uEGiZDgbE9NZLWrqDgD/hyXvhQ==
=efOd
-----END PGP SIGNATURE-----

--gc4hddyfb8luuHbL--
