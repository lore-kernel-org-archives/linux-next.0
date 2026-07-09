Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2F42EA481;
	Thu,  9 Jul 2026 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606880; cv=none; b=esxoM92EqSSCNEY4+T+0X/GESIU6bsBlw8n9nc/7E+DpMa8VkGUrWFmviafY73jF6Tr+iItPDAmQ482DiXnQ29czAoS+Ibq7h/YNN3yOvAN9H0ZrPqdjeq+KO9oLBMTvucxGmZ22+pR7XhVV/ESZLgE6tV8DPQFf15avmq4p28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606880; c=relaxed/simple;
	bh=DX8/0WR4rTWoYbuE0xmWDxBjMv/M+yAzCzM74vysjTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyfAQoK2pCt9s41Jcu7hD+gQIZkBWAzs1awXS50QZU0R0XR06DKM+9sG2UVlkoUnLEOxxvQ6DpD875sGiPRAuLnZxprB964N7boydguPW+H2QML1ehEQZQRzr8B8qTJzSwGb3fBU4OCefvcGnnyd1bm58AzPdVTJQXsmj1tklJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0Wv5DeL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0Wv5DeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719761F000E9;
	Thu,  9 Jul 2026 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606878;
	bh=WMQBQy8zb+Txjz5IO9xg9GMrG0myahIJFguGehIizaE=;
	h=Date:From:To:Cc:Subject;
	b=o0Wv5DeLm6ON3YCMcsPo/idkWWXcCHGpx6n2RYPV1eb3Yog5Mf5IGUaxqh6b+TqUC
	 evPblzd194a754JyFyTnAFQNBxoFv3R56V+JUfDjwq41WFw7tKFPTQMuWvpDMx61m5
	 WcVHkmMhV8t3bjfbSXvv8ghuVWrKmNgkn3oPcexu2H+RIu+OPkNZBiXeJM4nEpLV8+
	 k2UTGEpGoAdOdqNl7xB7HtNIH4+pDmR/cv7mynHrMkfnfhm59njXWIZEDvH3umDG7n
	 s7Be+BDBtZRjqDI96M+sL+yvJ18f/RCOKKLYoIu0imG67eCPWzb9c35jQn2a5u5Prc
	 zxz/O5Qqgu4lA==
Date: Thu, 9 Jul 2026 15:21:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Kiran K <kiran.k@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the net tree
Message-ID: <ak-uWx0Y9QGQ2nEv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mjhnL6+0n5uO/SuB"
Content-Disposition: inline


--mjhnL6+0n5uO/SuB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  drivers/bluetooth/btintel_pcie.c

between commit:

  9c36951474d8e ("Bluetooth: btintel_pcie: Refactor FLR to use device_repro=
be()")

=66rom the net tree and commit:

  603b91aeb20a2 ("Bluetooth: btintel_pcie: Refactor FLR to use device_repro=
be()")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/bluetooth/btintel_pcie.c
index 2b7231be5973d,013568197a397..0000000000000
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@@ -1446,72 -1446,134 +1446,134 @@@ exit_on_error
  	return err;
  }
 =20
+ /* Queue a coredump dump_traces() pass.
+  *
+  * Returns true if a new coredump was queued, false if one was already
+  * in-flight (the BTINTEL_PCIE_COREDUMP_INPROGRESS bit serves as the
+  * single-writer guard for the @coredump_work item) or the workqueue is
+  * disabled (reset / remove in progress).
+  *
+  * Always queue this AFTER any companion event-reader work (hwexp /
+  * fwtrigger) so that, on the ordered @dump_workqueue, the event reader
+  * runs first and populates dmp_hdr.event_type / event_id before
+  * dump_traces consumes them.
+  */
+ static bool btintel_pcie_queue_coredump(struct btintel_pcie_data *data,
+ 					u16 trigger_reason)
+ {
+ 	if (test_and_set_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags))
+ 		return false;
+=20
+ 	data->dmp_hdr.trigger_reason =3D trigger_reason;
+=20
+ 	if (queue_work(data->dump_workqueue, &data->coredump_work))
+ 		return true;
+=20
+ 	/* Workqueue is disabled (reset/remove drained it). Release the
+ 	 * guard so a later trigger, after re-probe, can succeed.
+ 	 */
+ 	clear_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags);
+ 	return false;
+ }
+=20
  static void btintel_pcie_msix_fw_trigger_handler(struct btintel_pcie_data=
 *data)
  {
  	bt_dev_dbg(data->hdev, "Received firmware smart trigger cause");
 =20
- 	if (test_and_set_bit(BTINTEL_PCIE_FWTRIGGER_DUMP_INPROGRESS, &data->flag=
s))
+ 	/* Per-work guard: deduplicate concurrent FW-trigger interrupts.
+ 	 * Cleared at the tail of btintel_pcie_fwtrigger_worker().
+ 	 */
+ 	if (test_and_set_bit(BTINTEL_PCIE_FWTRIGGER_DUMP_INPROGRESS,
+ 			     &data->flags))
  		return;
 =20
- 	/* Trigger device core dump when there is FW assert */
- 	if (!test_and_set_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags))
- 		data->dmp_hdr.trigger_reason =3D BTINTEL_PCIE_TRIGGER_REASON_FW_ASSERT;
+ 	if (!queue_work(data->dump_workqueue, &data->fwtrigger_work)) {
+ 		clear_bit(BTINTEL_PCIE_FWTRIGGER_DUMP_INPROGRESS, &data->flags);
+ 		return;
+ 	}
 =20
- 	queue_work(data->coredump_workqueue, &data->coredump_work);
+ 	/* Queue coredump after the fwtrigger event reader so dmp_hdr.event_*
+ 	 * is populated before dump_traces consumes it.
+ 	 */
+ 	btintel_pcie_queue_coredump(data, BTINTEL_PCIE_TRIGGER_REASON_FW_ASSERT);
  }
 =20
  static void btintel_pcie_msix_hw_exp_handler(struct btintel_pcie_data *da=
ta)
  {
  	bt_dev_err(data->hdev, "Received hw exception interrupt");
 =20
+ 	/* CORE_HALTED is the single-writer guard for this handler. It is
+ 	 * set once on first HW exception and cleared only by re-probe
+ 	 * (data is reallocated), so it also serializes hwexp_work
+ 	 * scheduling without needing a separate bit.
+ 	 */
  	if (test_and_set_bit(BTINTEL_PCIE_CORE_HALTED, &data->flags))
  		return;
 =20
- 	if (test_and_set_bit(BTINTEL_PCIE_HWEXP_INPROGRESS, &data->flags))
- 		return;
+ 	/* Queue companion coredump first so it is appended after hwexp_work
+ 	 * on the ordered @dump_workqueue (preserves the original
+ 	 * coredump-then-hwexp ordering).
+ 	 */
+ 	btintel_pcie_queue_coredump(data, BTINTEL_PCIE_TRIGGER_REASON_FW_ASSERT);
 =20
- 	/* Trigger device core dump when there is HW  exception */
- 	if (!test_and_set_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags))
- 		data->dmp_hdr.trigger_reason =3D BTINTEL_PCIE_TRIGGER_REASON_FW_ASSERT;
-=20
- 	queue_work(data->coredump_workqueue, &data->coredump_work);
+ 	queue_work(data->dump_workqueue, &data->hwexp_work);
  }
 =20
  static void btintel_pcie_coredump_worker(struct work_struct *work)
  {
  	struct btintel_pcie_data *data =3D container_of(work,
  					struct btintel_pcie_data, coredump_work);
- 	int err;
 =20
  	/* hdev is NULL until setup_hdev() succeeds, and is cleared on
  	 * teardown after disable_work_sync() drains us; bail in that case.
  	 */
+ 	if (!data->hdev)
+ 		goto out;
+=20
+ 	btintel_pcie_dump_traces(data->hdev);
+ out:
+ 	/* Release guard last so a new trigger can run only after this
+ 	 * pass has fully completed (including dev_coredumpv()).
+ 	 */
+ 	clear_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags);
+ }
+=20
+ static void btintel_pcie_hwexp_worker(struct work_struct *work)
+ {
+ 	struct btintel_pcie_data *data =3D container_of(work,
+ 					struct btintel_pcie_data, hwexp_work);
+=20
  	if (!data->hdev)
  		return;
 =20
- 	if (test_bit(BTINTEL_PCIE_FWTRIGGER_DUMP_INPROGRESS, &data->flags)) {
- 		err =3D btintel_pcie_dump_fwtrigger_event(data);
- 		if (err)
- 			bt_dev_warn(data->hdev, "failed to log fwtrigger event");
- 		clear_bit(BTINTEL_PCIE_FWTRIGGER_DUMP_INPROGRESS, &data->flags);
- 	}
+ 	/* Unlike usb products, controller will not send hardware exception
+ 	 * event on exception. Instead controller writes the hardware event
+ 	 * to device memory along with optional debug events, raises MSIX
+ 	 * and halts. Driver shall read the exception event from device
+ 	 * memory and passes it to the stack for further processing.
+ 	 *
+ 	 * Re-entry is gated by BTINTEL_PCIE_CORE_HALTED in the IRQ
+ 	 * handler, which is only cleared by re-probe; no per-work bit
+ 	 * is needed here.
+ 	 */
+ 	btintel_pcie_read_hwexp(data);
+ }
 =20
- 	if (test_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags)) {
- 		btintel_pcie_dump_traces(data->hdev);
- 		clear_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags);
- 	}
+ static void btintel_pcie_fwtrigger_worker(struct work_struct *work)
+ {
+ 	struct btintel_pcie_data *data =3D container_of(work,
+ 					struct btintel_pcie_data, fwtrigger_work);
+ 	int err;
 =20
- 	if (test_bit(BTINTEL_PCIE_HWEXP_INPROGRESS, &data->flags)) {
- 		/* Unlike usb products, controller will not send hardware
- 		 * exception event on exception. Instead controller writes the
- 		 * hardware event to device memory along with optional debug
- 		 * events, raises MSIX and halts. Driver shall read the
- 		 * exception event from device memory and passes it stack for
- 		 * further processing.
- 		 */
- 		btintel_pcie_read_hwexp(data);
- 		clear_bit(BTINTEL_PCIE_HWEXP_INPROGRESS, &data->flags);
- 	}
+ 	if (!data->hdev)
+ 		goto out;
+=20
+ 	err =3D btintel_pcie_dump_fwtrigger_event(data);
+ 	if (err)
+ 		bt_dev_warn(data->hdev, "failed to log fwtrigger event");
+ out:
+ 	/* Release guard last; matches set in fw_trigger handler. */
+ 	clear_bit(BTINTEL_PCIE_FWTRIGGER_DUMP_INPROGRESS, &data->flags);
  }
 =20
  static void btintel_pcie_rx_work(struct work_struct *work)
@@@ -2650,20 -2712,22 +2712,22 @@@ static void btintel_pcie_reset_work(str
  	btintel_pcie_synchronize_irqs(data);
 =20
  	flush_work(&data->rx_work);
- 	/* Drain any in-flight coredump and block new ones across reset.
- 	 * Safe from self-deadlock: coredump_work runs on a separate wq.
+ 	/* Drain any in-flight dump workers and block new ones across reset.
+ 	 * Safe from self-deadlock: they all run on a separate wq.
  	 */
  	disable_work_sync(&data->coredump_work);
+ 	disable_work_sync(&data->hwexp_work);
+ 	disable_work_sync(&data->fwtrigger_work);
 =20
  	bt_dev_dbg(data->hdev, "Release bluetooth interface");
 =20
  	/* Both reset paths follow the same contract: on success they
  	 * destroy 'data' via device_reprobe() (a fresh probe re-INIT_WORKs
- 	 * the coredump_work with disable count 0), so enable_work() must
+ 	 * the dump workers with disable count 0), so enable_work() must
  	 * NOT be called on the success path. Only the FLR path can fail
  	 * with 'data' still alive, in which case we balance the
- 	 * disable_work_sync() above so a later successful reset is not
- 	 * permanently blocked.
+ 	 * disable_work_sync() calls above so a later successful reset is
+ 	 * not permanently blocked.
  	 *
  	 * pci_lock_rescan_remove() (held above) serializes against PCI
  	 * device addition/removal (hotplug), so no device can be added to
@@@ -2674,8 -2738,11 +2738,8 @@@
  		goto out;
  	}
 =20
 -	if (btintel_pcie_perform_flr(data)) {
 +	if (btintel_pcie_perform_flr(data))
  		enable_work(&data->coredump_work);
 -		enable_work(&data->hwexp_work);
 -		enable_work(&data->fwtrigger_work);
 -	}
 =20
  out:
  	pci_dev_put(pdev);
@@@ -2869,8 -2936,8 +2933,8 @@@ static int btintel_pcie_probe(struct pc
  	if (!data->workqueue)
  		return -ENOMEM;
 =20
- 	data->coredump_workqueue =3D alloc_ordered_workqueue(KBUILD_MODNAME "_cd=
", 0);
- 	if (!data->coredump_workqueue) {
+ 	data->dump_workqueue =3D alloc_ordered_workqueue(KBUILD_MODNAME "_cd", 0=
);
+ 	if (!data->dump_workqueue) {
  		destroy_workqueue(data->workqueue);
  		return -ENOMEM;
  	}
@@@ -2879,6 -2946,8 +2943,8 @@@
  	INIT_WORK(&data->rx_work, btintel_pcie_rx_work);
  	INIT_WORK(&data->reset_work, btintel_pcie_reset_work);
  	INIT_WORK(&data->coredump_work, btintel_pcie_coredump_worker);
+ 	INIT_WORK(&data->hwexp_work, btintel_pcie_hwexp_worker);
+ 	INIT_WORK(&data->fwtrigger_work, btintel_pcie_fwtrigger_worker);
 =20
  	data->boot_stage_cache =3D 0x00;
  	data->img_resp_cache =3D 0x00;
@@@ -2921,7 -2990,7 +2987,7 @@@ exit_error
  	/* reset device before exit */
  	btintel_pcie_reset_bt(data);
 =20
- 	destroy_workqueue(data->coredump_workqueue);
+ 	destroy_workqueue(data->dump_workqueue);
 =20
  	pci_clear_master(pdev);
 =20
@@@ -2940,12 -3009,14 +3006,14 @@@ static void btintel_pcie_remove(struct=
=20
  		return;
  	}
 =20
- 	/* Permanently block coredump triggers and drain the worker before
- 	 * tearing down. Must run before cancel_work_sync(&reset_work) so
- 	 * the disable counter stays >=3D 1 even after reset_work()'s
+ 	/* Permanently block all dump triggers and drain the workers before
+ 	 * tearing down. Must run before disable_work_sync(&reset_work) so
+ 	 * the disable counters stay >=3D 1 even after reset_work()'s
  	 * balanced enable_work() (counter 2 -> 1, never reaching 0).
  	 */
  	disable_work_sync(&data->coredump_work);
+ 	disable_work_sync(&data->hwexp_work);
+ 	disable_work_sync(&data->fwtrigger_work);
 =20
  	/* Cancel pending reset work. Skip only when remove() is called from
  	 * within the reset work itself (PLDR device_reprobe path) to avoid
@@@ -2973,7 -3044,7 +3041,7 @@@
 =20
  	btintel_pcie_release_hdev(data);
 =20
- 	destroy_workqueue(data->coredump_workqueue);
+ 	destroy_workqueue(data->dump_workqueue);
  	destroy_workqueue(data->workqueue);
 =20
  	btintel_pcie_free(data);
@@@ -2992,16 -3063,8 +3060,8 @@@ static void btintel_pcie_coredump(struc
  	if (!data)
  		return;
 =20
- 	if (test_and_set_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags))
- 		return;
-=20
- 	data->dmp_hdr.trigger_reason  =3D BTINTEL_PCIE_TRIGGER_REASON_USER_TRIGG=
ER;
- 	/* queue_work() returns false if the work is disabled (reset or
- 	 * remove in progress); clear the in-progress bit so a later
- 	 * trigger can succeed once the work is re-enabled.
- 	 */
- 	if (!queue_work(data->coredump_workqueue, &data->coredump_work))
- 		clear_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS, &data->flags);
+ 	btintel_pcie_queue_coredump(data,
+ 				    BTINTEL_PCIE_TRIGGER_REASON_USER_TRIGGER);
  }
  #endif
 =20
@@@ -3138,12 -3201,8 +3198,8 @@@ static int btintel_pcie_resume(struct d
  	if (btintel_pcie_in_error(data) ||
  			btintel_pcie_in_device_halt(data)) {
  		bt_dev_err(data->hdev, "Controller in error state for D0 entry");
- 		if (!test_and_set_bit(BTINTEL_PCIE_COREDUMP_INPROGRESS,
- 				      &data->flags)) {
- 			data->dmp_hdr.trigger_reason =3D
- 				BTINTEL_PCIE_TRIGGER_REASON_FW_ASSERT;
- 			queue_work(data->coredump_workqueue, &data->coredump_work);
- 		}
+ 		btintel_pcie_queue_coredump(data,
+ 					    BTINTEL_PCIE_TRIGGER_REASON_FW_ASSERT);
  		set_bit(BTINTEL_PCIE_CORE_HALTED, &data->flags);
  		btintel_pcie_reset(data->hdev);
  	}

--mjhnL6+0n5uO/SuB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPrloACgkQJNaLcl1U
h9Bfhwf9EafYdSdXq3o8Nz0NRdCTd9hZWdc7eDZcQ8V8A0wuQi2tTZ3K2g0xVvyu
laBcQECm83dxDL0RWO9vkmnP4f3tGsmAPQpxvlCCJFGDMe5otJc30KQp1Ub2mrvJ
Uk4W6R4kYGkBkPNSlQBA7c6dCYOxJS+M+eRWivWieqpq98WpVUycjJKvHBU4oE3j
08Q72tL/0UBf6taSluPgzkA8dowW0eELcNi1vDv7EdtMv2Gj7liU0HckehFJ+HGu
PUuy8ygmOyuEBar85X5tFYbRp8Ag5IKrUZkG410XXgOxfknh8NTL626V561n2U6J
+A0T1by6qrKeLGTuBFE22Z8KSPK2Ig==
=tAM8
-----END PGP SIGNATURE-----

--mjhnL6+0n5uO/SuB--
