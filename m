Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17A242A15A;
	Fri, 17 Jul 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299055; cv=none; b=eCLBpsOTws+CU5LOL/FpudmlhirXmUYJjSBwGU0hZeS2DB+29fVjjDpzEkSkNHArToTfN/4Qx8suXfOTtIp5TMVgX7jx74vPFmHBKTUOfZcwa/MwfUnNlahZXxuV825jsbSrg2xbmrNiwFAFQFRyM9i7JJvosL8gVPCd2RUjFCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299055; c=relaxed/simple;
	bh=0mAgII1pBWs64bQMdJewPkI+gmuifxcGNNAfjwMEXUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzcyhQWqUF00H0WLWl5ufxb3011MTG1F5UxDn4/Jp0X1u24E4UP63RfoGdjRoAPOQqLIMJ0juq9XnlB6pzPntQODdx55HvnXwafEoWH+ozWVU+jMXusbLMbBL9qgKl5J8EI2Tzlgj4nfcHDUBom6i2aH4GbZj/bDMEp7SHH6TQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBEsNk2o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBEsNk2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0F31F000E9;
	Fri, 17 Jul 2026 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784299053;
	bh=Ji2ATxuj8q8jgZCb9I8JQClljgwqwAd9NslIIGKBE7I=;
	h=Date:From:To:Cc:Subject;
	b=BBEsNk2o+Jz5TQjUJauFNt8N4mJHsRtdbYOs++ixBqKbU5MvGJ9lguad29dUUGe6s
	 inQKZ2S4XSH4jC1hmGJIgAPyeaXMdFEqmqGGv51OQ//yNqcNcxoSUqqbzMET4P/A4R
	 FPoAPJYMgNozE2jQT7EKmjPdEGGpPt6zGPMA9C3nsUBDgBFmqrvNxbAKhziNJ4jRGf
	 /Zuz35mfdfR0XNuF0BWZ8pI7XvVZHoTWL7fGvbh7FeKB8heS8130ze/MROkJsM3lEi
	 NGO/wJV3Y7AGDt6EH54bwFmt+Zwg9ZTHUDY3ggM7Ihi8MfaHvdOAzA/9887ACusJAi
	 ousQYZatpENRg==
Date: Fri, 17 Jul 2026 15:37:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Kiran K <kiran.k@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <alo-KZ1Sk8BxsLkG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LcNeeMLPcRa06oZ0"
Content-Disposition: inline


--LcNeeMLPcRa06oZ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  drivers/bluetooth/btintel_pcie.c

between commit:

  9c36951474d8e ("Bluetooth: btintel_pcie: Refactor FLR to use device_repro=
be()")

=66rom the origin tree and commit:

  603b91aeb20a2 ("Bluetooth: btintel_pcie: Refactor FLR to use device_repro=
be()")
  ca75417ab1793 ("Bluetooth: btintel_pcie: split coredump worker into per-t=
rigger works")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/bluetooth/btintel_pcie.c
index 2b7231be5973d,2e28847263ab0..0000000000000
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
@@@ -2488,8 -2550,6 +2550,6 @@@ static void btintel_pcie_inc_recovery_c
  	}
  }
 =20
- static void btintel_pcie_reset(struct hci_dev *hdev);
-=20
  static int btintel_pcie_acpi_reset_method(struct btintel_pcie_data *data)
  {
  	union acpi_object *obj, argv4;
@@@ -2650,20 -2710,22 +2710,22 @@@ static void btintel_pcie_reset_work(str
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
@@@ -2674,64 -2736,97 +2736,97 @@@
  		goto out;
  	}
 =20
- 	if (btintel_pcie_perform_flr(data))
+ 	if (btintel_pcie_perform_flr(data)) {
  		enable_work(&data->coredump_work);
+ 		enable_work(&data->hwexp_work);
+ 		enable_work(&data->fwtrigger_work);
+ 	}
 =20
  out:
  	pci_dev_put(pdev);
  	pci_unlock_rescan_remove();
  }
 =20
- static void btintel_pcie_reset(struct hci_dev *hdev)
+ /* Schedule a device reset of the requested type.
+  *
+  * BTINTEL_PCIE_RECOVERY_IN_PROGRESS serializes all reset requesters
+  * (sysfs reset attribute, hci_cmd_timeout(), hw_error, resume error
+  * path, etc.) so that:
+  *
+  *   - dev_data->reset_type is written by exactly one caller (the
+  *     thread that wins test_and_set_bit), eliminating the race where
+  *     a second hw_error could clobber an already-scheduled reset's
+  *     type;
+  *   - the write happens AFTER the bit is set, so reset_work observes
+  *     it through schedule_work()'s memory ordering;
+  *   - losers return without touching reset_type or scheduling the
+  *     work, so concurrent triggers are silently coalesced into the
+  *     in-flight one (whose recovery will reinitialize the device
+  *     regardless of the dropped trigger's variant).
+  *
+  * The bit is cleared only by .remove() / re-probe via fresh devm
+  * allocation, which is the intended one-shot semantics: a reset
+  * tears down and re-probes 'data', so there is no "in-flight"
+  * reset to follow up after device_reprobe() succeeds.
+  */
+ static void btintel_pcie_request_reset(struct btintel_pcie_data *data,
+ 				       enum btintel_pcie_reset_type type)
  {
- 	struct btintel_pcie_data *data;
-=20
- 	data =3D hci_get_drvdata(hdev);
-=20
  	if (!test_bit(BTINTEL_PCIE_SETUP_DONE, &data->flags))
  		return;
 =20
  	if (test_and_set_bit(BTINTEL_PCIE_RECOVERY_IN_PROGRESS, &data->flags))
  		return;
 =20
+ 	data->reset_type =3D type;
+=20
  	pci_dev_get(data->pdev);
  	schedule_work(&data->reset_work);
  }
 =20
+ static void btintel_pcie_hci_reset(struct hci_dev *hdev)
+ {
+ 	struct btintel_pcie_data *data =3D hci_get_drvdata(hdev);
+=20
+ 	btintel_pcie_request_reset(data, BTINTEL_PCIE_IOSF_PRR_FLR);
+ }
+=20
  static void btintel_pcie_hw_error(struct hci_dev *hdev, u8 code)
  {
- 	struct btintel_pcie_dev_recovery *data;
+ 	struct btintel_pcie_dev_recovery *rec;
  	struct btintel_pcie_data *dev_data =3D hci_get_drvdata(hdev);
  	struct pci_dev *pdev =3D dev_data->pdev;
+ 	enum btintel_pcie_reset_type type;
  	time64_t retry_window;
 =20
+ 	if (test_bit(BTINTEL_PCIE_RECOVERY_IN_PROGRESS, &dev_data->flags))
+ 		return;
+=20
  	btintel_pcie_dump_debug_registers(hdev);
 =20
- 	data =3D btintel_pcie_get_recovery(pdev, &hdev->dev);
- 	if (!data)
+ 	rec =3D btintel_pcie_get_recovery(pdev, &hdev->dev);
+ 	if (!rec)
  		return;
 =20
- 	if (code =3D=3D 0x13)
- 		dev_data->reset_type =3D BTINTEL_PCIE_IOSF_PRR_PLDR;
- 	else
- 		dev_data->reset_type =3D BTINTEL_PCIE_IOSF_PRR_FLR;
+ 	type =3D (code =3D=3D 0x13) ? BTINTEL_PCIE_IOSF_PRR_PLDR
+ 			      : BTINTEL_PCIE_IOSF_PRR_FLR;
 =20
  	bt_dev_err(hdev, "Encountered exception err:0x%x triggering: %s", code,
- 		   dev_data->reset_type =3D=3D BTINTEL_PCIE_IOSF_PRR_PLDR ? "PLDR" : "F=
LR");
- 	retry_window =3D ktime_get_boottime_seconds() - data->last_error;
+ 		   type =3D=3D BTINTEL_PCIE_IOSF_PRR_PLDR ? "PLDR" : "FLR");
+ 	retry_window =3D ktime_get_boottime_seconds() - rec->last_error;
 =20
  	if (retry_window < BTINTEL_PCIE_RESET_WINDOW_SECS &&
- 	    data->count >=3D BTINTEL_PCIE_FLR_MAX_RETRY) {
+ 	    rec->count >=3D BTINTEL_PCIE_FLR_MAX_RETRY) {
  		bt_dev_err(hdev, "Exhausted maximum: %d recovery attempts: %d",
- 			   BTINTEL_PCIE_FLR_MAX_RETRY, data->count);
+ 			   BTINTEL_PCIE_FLR_MAX_RETRY, rec->count);
  		bt_dev_dbg(hdev, "Boot time: %lld seconds",
  			   ktime_get_boottime_seconds());
  		bt_dev_dbg(hdev, "last error at: %lld seconds",
- 			   data->last_error);
+ 			   rec->last_error);
  		return;
  	}
  	btintel_pcie_inc_recovery_count(pdev, &hdev->dev);
- 	btintel_pcie_reset(hdev);
+ 	btintel_pcie_request_reset(dev_data, type);
  }
 =20
  static bool btintel_pcie_wakeup(struct hci_dev *hdev)
@@@ -2821,7 -2916,7 +2916,7 @@@ static int btintel_pcie_setup_hdev(stru
  	hdev->hw_error =3D btintel_pcie_hw_error;
  	hdev->set_diag =3D btintel_set_diag;
  	hdev->set_bdaddr =3D btintel_set_bdaddr;
- 	hdev->reset =3D btintel_pcie_reset;
+ 	hdev->reset =3D btintel_pcie_hci_reset;
  	hdev->wakeup =3D btintel_pcie_wakeup;
  	hdev->hci_drv =3D &btintel_pcie_hci_drv;
 =20
@@@ -2869,8 -2964,8 +2964,8 @@@ static int btintel_pcie_probe(struct pc
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
@@@ -2879,6 -2974,8 +2974,8 @@@
  	INIT_WORK(&data->rx_work, btintel_pcie_rx_work);
  	INIT_WORK(&data->reset_work, btintel_pcie_reset_work);
  	INIT_WORK(&data->coredump_work, btintel_pcie_coredump_worker);
+ 	INIT_WORK(&data->hwexp_work, btintel_pcie_hwexp_worker);
+ 	INIT_WORK(&data->fwtrigger_work, btintel_pcie_fwtrigger_worker);
 =20
  	data->boot_stage_cache =3D 0x00;
  	data->img_resp_cache =3D 0x00;
@@@ -2921,7 -3018,7 +3018,7 @@@ exit_error
  	/* reset device before exit */
  	btintel_pcie_reset_bt(data);
 =20
- 	destroy_workqueue(data->coredump_workqueue);
+ 	destroy_workqueue(data->dump_workqueue);
 =20
  	pci_clear_master(pdev);
 =20
@@@ -2940,12 -3037,14 +3037,14 @@@ static void btintel_pcie_remove(struct=
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
@@@ -2973,7 -3072,7 +3072,7 @@@
 =20
  	btintel_pcie_release_hdev(data);
 =20
- 	destroy_workqueue(data->coredump_workqueue);
+ 	destroy_workqueue(data->dump_workqueue);
  	destroy_workqueue(data->workqueue);
 =20
  	btintel_pcie_free(data);
@@@ -2992,16 -3091,8 +3091,8 @@@ static void btintel_pcie_coredump(struc
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
@@@ -3113,8 -3204,7 +3204,7 @@@ static int btintel_pcie_resume(struct d
  	if (data->pm_sx_event =3D=3D PM_EVENT_FREEZE ||
  	    data->pm_sx_event =3D=3D PM_EVENT_HIBERNATE) {
  		set_bit(BTINTEL_PCIE_CORE_HALTED, &data->flags);
- 		data->reset_type =3D BTINTEL_PCIE_IOSF_PRR_FLR;
- 		btintel_pcie_reset(data->hdev);
+ 		btintel_pcie_request_reset(data, BTINTEL_PCIE_IOSF_PRR_FLR);
  		return 0;
  	}
 =20
@@@ -3138,14 -3228,10 +3228,10 @@@
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
- 		btintel_pcie_reset(data->hdev);
+ 		btintel_pcie_request_reset(data, BTINTEL_PCIE_IOSF_PRR_FLR);
  	}
  	return err;
  }

--LcNeeMLPcRa06oZ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaPigACgkQJNaLcl1U
h9AL7ggAgYX0MueH9MSISxgU47yFIdUwaeTaUAGSTyxRNBTywjh0ywcenLjv9Pac
ssLJak0q1cW95YKTs+FnCWl25WshlIHjQ1Pzgl+chF8SkThxulbUpz1iLMDsZYDs
ZGr3ZietBzoaheKc/RWByFhXa8fEppCP51NBRfbtxBxPFCccLdVULi01R8bc22h0
8hj2w33+E9ky3T96iqzvx798OaOZ/x1cG/HCGqKWoC7m8LFPWnVmilea37GxRoYk
WfbMIEn+W66mHf1cIxZ0w3/O4U8FaNOFnOjIv8/nObwcptgIutuTAuLtEmd6ep0k
W42iE5CBhI85a9aSvghZtThBA731+w==
=8ROa
-----END PGP SIGNATURE-----

--LcNeeMLPcRa06oZ0--
