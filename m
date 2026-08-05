Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0E380FFD;
	Wed,  5 Aug 2026 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940548; cv=none; b=gFXjSAEy07GFye0g5G3GwhedEK7V9Oz2dnvfGnXuJlr+fTDTGV6XzBuPw4EvGj5+fSKVLVyS7FsPqv+6Wdkisu2zYNb8tj9DBMvUuvggwV/oJFryyl/CctLYqHIW0SON4KecrqUa/+MynEJYzu45VYZ2fEtnurqwHrXexsyC8Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940548; c=relaxed/simple;
	bh=6JvnB4wdxhhLWl3DTPVf1hNl+5GIHCQcDqD2cv6/2Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uuI0PHWCh3vIJxNCNc8YdXND7vVle2/DAgQLVgyosbQyAydEsPB+YloR5OYQoo6wgyf9Rvp6H+YEiLukRj9cyMKB940AOK5AFNQ5tabQygsnGrhiCUEsKZGcKC3XhbMoS/vgxHE/P7yFu0AeZvqdC3yZqQ37v4eboGyF7P4gIKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWvxXlHg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWvxXlHg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDFB1F000E9;
	Wed,  5 Aug 2026 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785940539;
	bh=1zVRmnbSrR4jPDAgsKnRh60Fn6Fc5cEDffvP+I4cN+M=;
	h=Date:From:To:Cc:Subject;
	b=cWvxXlHgxvuVGpFZlQVVjIcp6ar0zgmZtFz2WsngG8OpEFSJEPZPHQvEtI5kiL7ko
	 Fn5En7FFUYHoKsf+ABTEhe8mV6lYLYYpswuXY2YJwCKNucxWtNvczqv2LLQjhKXXte
	 PFlNkyAmavUXPpdNCE6hu1sivaMBazs9fu+emy/Su7i8RTwYyCvQyM2sYlKgEJ85Nr
	 kspXfIfke4+Nu1cpb71Z8G3WM+d0eHHzZWF/gSoqnjHTfRxPEud4fPmSBe+Jr6UCPk
	 +ok+Lzf3RwlPSJ9QeKpW7EaC18a6VEv23nZ6WY+b9HyHwCBbR6WiC2InWNEygLiSog
	 z5z/+z2YfAysg==
Date: Wed, 5 Aug 2026 15:35:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <anNKNwkjosR_PMYe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qaUuTvPNdzxsHoAX"
Content-Disposition: inline


--qaUuTvPNdzxsHoAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):


  018d1e023ea5c ("Bluetooth: SCO: give the socket its own sco_conn reference")
  0e2c0392b9dc2 ("Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_new_connection_cb()")
  103ac7b87e1fc ("Bluetooth: ISO: fix malformed ISO_END/CONT handling")
  126e8f096c10e ("Bluetooth: ISO: validate sockaddr_iso first in iso_sock_rebind_bis()")
  137501e0242f0 ("Bluetooth: mgmt: hold reference for hci_conn in mgmt_pending_cmds")
  17f5bfb02164e ("Bluetooth: hci_sync: extend conn_hash lookup critical sections")
  198bd312df38a ("Bluetooth: qca: fix NVM tag length underflow in TLV parser")
  25c286d758212 ("Bluetooth: btnxpuart: Fix out-of-bounds firmware read in nxp_recv_fw_req_v3()")
  278aeca60782d ("Bluetooth: ISO: fix CONNECTED -> CLOSED transition on shutdown/release")
  2a93966653a9e ("Bluetooth: ISO: fix leaking sk after socket release")
  2ac5f666025e9 ("Bluetooth: RFCOMM: Fix session UAF in set_termios")
  300a6fb2d8b79 ("Bluetooth: mgmt: fix UAF in pair command cancellation")
  3501d7754c854 ("Bluetooth: btmtk: Fix short read errors in btmtk_usb_uhw_reg_read()")
  3b7686310806b ("Bluetooth: hci_uart: clear HCI_UART_SENDING when write_work is canceled")
  3bf1394e88680 ("Bluetooth: hci_conn: hold conn reference in abort_conn_sync()")
  3c5f5c6be8783 ("Bluetooth: hci_sync: hold conn in hci_past_sync() callback")
  3d9ce6e4639c2 ("Bluetooth: btintel: Validate length before parsing diagnostics TLV")
  3fbd73d24dcc5 ("Bluetooth: MGMT: revalidate LOAD_CONN_PARAM queued update")
  423e5fc465eb1 ("Bluetooth: hci_sync: fix hci_conn_del() use in hci_le_create_conn_sync")
  4b56754e9da3e ("Bluetooth: ISO: fix race of kfree vs kref_get_unless_zero")
  4c7de7083a9ac ("Bluetooth: RFCOMM: validate skb length in rfcomm_recv_frame")
  5de0af8b2ace6 ("Bluetooth: L2CAP: fix UAF in l2cap_le_connect_rsp")
  603b91aeb20a2 ("Bluetooth: btintel_pcie: Refactor FLR to use device_reprobe()")
  6042a966e047e ("Bluetooth: bpa10x: avoid OOB read of revision string in bpa10x_setup()")
  64522263b6e36 ("Bluetooth: L2CAP: validate option length before reading conf opt value")
  678c435909f28 ("Bluetooth: HIDP: reject frames without a transaction header")
  69a694ebe97f6 ("Bluetooth: hci_sync: hold conn in hci_connect_acl/le_sync() callbacks")
  6d16b799d7f4a ("Bluetooth: ISO: lock sk in iso_sock_getname")
  7083dd3316675 ("Bluetooth: MGMT: Fix adv monitor add failure cleanup")
  73b6871b261f3 ("Bluetooth: hci_sync: remove unnecessary hci_conn_get in create_conn_sync")
  76c2d047410ba ("Bluetooth: hci_conn: Fix null ptr deref in hci_abort_conn()")
  7ea67149af719 ("Bluetooth: L2CAP: fix tx ident leak for commands without a response")
  883532b7d4eb3 ("Bluetooth: HIDP: validate numbered report payloads")
  891916abe16fc ("Bluetooth: btusb: validate Realtek vendor event length")
  9348bd469f563 ("Bluetooth: hci_sync: Protect UUID list traversal")
  9496dfbab73fe ("Bluetooth: ISO: exclude RFU bits from ISO_SDU_Length")
  a0ac2b200be13 ("Bluetooth: ISO: avoid NULL deref of conn in iso_conn_big_sync()")
  a3ad01d51d4be ("Bluetooth: hci_sync: Fix advertising data UAFs")
  a8c481ee38196 ("Bluetooth: fix UAF in bt_accept_dequeue()")
  a8fb0c8ec7d6e ("Bluetooth: 6lowpan: avoid untracked enable work")
  abcb881d99adf ("Bluetooth: btmtk: Fix short read errors in btmtk_usb_reg_read()")
  b1196afe58a92 ("Bluetooth: hci_sync: hold conn in hci_connect_big_sync() callback")
  b755b4141c64a ("Bluetooth: hci_sync: hold hdev->lock for hci_conn_params lookups")
  c08593655456f ("Bluetooth: ISO: fix timeout vs sync_timeout typo in check_bcast_qos")
  c22eb0db0c629 ("Bluetooth: mgmt: fix pending command UAF in EIR updates")
  cb20f6afc25b2 ("Bluetooth: MGMT: Fix UAF of hci_conn_params in add_device_complete")
  cddcc54a7afe5 ("Bluetooth: sco: Fix a race condition in sco_sock_timeout()")
  cddfec3618d00 ("Bluetooth: hci_sync: hold conn in hci_connect_pa_sync() callback")
  cfa697b22dad9 ("Bluetooth: L2CAP: cancel pending_rx_work before taking conn->lock")
  d09cff8f7ecfb ("Bluetooth: btrtl: validate firmware patch bounds")
  d138ff8690c8e ("Bluetooth: 6lowpan: hold L2CAP conn across debugfs control")
  d35e2950daaf8 ("Bluetooth: 6lowpan: Fix using chan->conn as indication to no remote netdev")
  d66f0661748ef ("Bluetooth: bnep: pin L2CAP connection during netdev registration")
  deb1d93a07f08 ("Bluetooth: ISO: hold sk properly in iso_conn_ready")
  df810355bbe7e ("Bluetooth: ISO: lock sk in iso_connect_ind")
  e4d507fb7f6e8 ("Bluetooth: ISO: fix refcounting of iso_conn")
  e824c0bbe0ec9 ("Bluetooth: ISO: clear iso_data always when detaching conn from hcon")
  eab19cb7618e5 ("Bluetooth: mgmt: Translate HCI reason in Device Disconnected event")
  f3f75fd597f25 ("Bluetooth: mgmt: fix locking in unpair_device/disconnect_sync")
  f80c3b2232a25 ("Bluetooth: ISO: ensure no dangling hcon references in iso_conn")
  f8cb802462f50 ("Bluetooth: ISO: avoid deadlocks in iso_sock_timeout")
  fd694aebe4148 ("Bluetooth: hci_qca: Clear memdump state on invalid dump size")

--qaUuTvPNdzxsHoAX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzSjYACgkQJNaLcl1U
h9BZuAf+MntELql93EnTcZVmHFPEcpGIwZTGiJqLfQX9N+N+6tfQV5dhoFNgstln
tPKqedmoEOEpYubiHwh+xJLK9Ykizd8X2ngPAuNO+25mKy2TaH6xBxCMVWiC9zv3
xTmQI3WxCduU3F4gm1YrzHZqRMtkjGK9mgm5W11rcmT4HrfZelT8pTch6s5owHNQ
4ORoeGmTk36xPse7EEXYhUp/yeiBttIAtVyXCW4rHIgG923mkJbtEdPp3FONhB7F
9GFQxNBJxEJMKInNXsdcIBEli47DpavDDcajGeQwoCJXLUN2gFsSdbjcKOTzOMmM
BFOhO7/bNM3ECUyBQRHzVvsj/GluJw==
=zUsm
-----END PGP SIGNATURE-----

--qaUuTvPNdzxsHoAX--
