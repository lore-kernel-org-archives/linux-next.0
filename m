Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB713D4104;
	Mon, 20 Jul 2026 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558679; cv=none; b=hlmhtBe7kT7sS2b3+TuvK7hoPDYHfByPuA7K+bElpKkAMPatOcjJ4MZrz0niZ1cxcs8ND4qm2rxOy3439KNgTnIVwzHNDc803GiRpfuLdL7Ma6J7csQyuc4WISo/3GZnkzG5PyY81zoSqL6zPFLlct0ppDqR6biQpCnPZr+hv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558679; c=relaxed/simple;
	bh=79uOP182hG9IT3tWq/rfE7DKgZemM8XWjZRE4rXUc3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jK1wT/U2fEGfgSoTpFOjcgh5jX8vgaNzmsYluLG87ZnZ+F328vxq3iZFojQXZTd5nkV6n5oW1RIUU7R2BptcsHabykGD33oRWawtrMJStBq4FOW50dgZDKmshj4y9n+F4g1xx97b5uKPEfpyNtMyIiaFtutYTZgnuObgQRZYuS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0jRBY2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0jRBY2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C929A1F000E9;
	Mon, 20 Jul 2026 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558677;
	bh=bAMZIbk8NXMTspV6rsW+vBsTCk4YtPf/HNG/N7qN9aQ=;
	h=Date:From:To:Cc:Subject;
	b=X0jRBY2W1bHumTdeooPStsX6Hu1NsUGC8AiH1UcS5R3iaL7Rwull/pOpV1+KUXcdJ
	 FgCCnaqz5JP6WAQm7HKiZtpN6kyCfu/bpmXZ6XnKlao34jSExCN8MxNzKjtt2aWj25
	 aWZEt+kt1MVB5GjuL4mIt4oKCJOZf1DB7dQvLxdol3HVZ+f7pT1Eva+dXFP8DOy2mF
	 7hyk0NrDXzgmhBCKl8b7n4G+TJgfaiiKb1QjlDYiByd/wcXHV50cCDJZlTSH5EVRhM
	 /VsytETfkIQ1Mkn+44lk5gEhsP5kSruHwvsU8FAtsyGE/VrXvKEmhZBL7A8LZJnwfa
	 1FKDe2Sfp/WMQ==
Date: Mon, 20 Jul 2026 15:44:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Arvind Yadav <arvind.yadav@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <al40UQ7765u9mhHU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xRlcgmWHH8fJP0SD"
Content-Disposition: inline


--xRlcgmWHH8fJP0SD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_submit.c

between commit:

  9b7e60184f4b2 ("drm/xe/guc: Hold device ref until queue teardown complete=
s")

=66rom the origin tree and commits:

  da1124abac689 ("drm/xe/guc: Hold device ref until queue teardown complete=
s")
  5d5a729cc9780 ("drm/xe/multi_queue: preempt primary on queue group suspen=
d")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_guc_submit.c
index 3188cd1658fe4,8aaed4fd13ea3..0000000000000
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@@ -961,6 -961,27 +961,27 @@@ static void __register_exec_queue(struc
  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
  }
 =20
+ static u32 xe_hwe_guc_logical_to_submit_mask(struct xe_hw_engine *hwe, u3=
2 logical_mask)
+ {
+ 	struct xe_gt *gt =3D hwe->gt;
+=20
+ 	if (xe_gt_is_usm_hwe(gt, hwe)) {
+ 		int shift =3D gt->usm.paging_hwe0->logical_instance;
+ 		u32 paging_logical_mask =3D gt->usm.paging_logical_mask;
+=20
+ 		xe_gt_assert(gt, (logical_mask & paging_logical_mask) =3D=3D logical_ma=
sk);
+=20
+ 		/*
+ 		 * Remap to GUC_PAGING_CLASS logical instance mask, if
+ 		 * applicable.
+ 		 */
+ 		if (xe_guc_has_paging_engine(&hwe->gt->uc.guc))
+ 			return logical_mask >> shift;
+ 	}
+=20
+ 	return logical_mask;
+ }
+=20
  static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
  {
  	struct xe_guc *guc =3D exec_queue_to_guc(q);
@@@ -973,8 -994,9 +994,9 @@@
 =20
  	memset(&info, 0, sizeof(info));
  	info.context_idx =3D q->guc->id;
- 	info.engine_class =3D xe_engine_class_to_guc_class(q->class);
- 	info.engine_submit_mask =3D q->logical_mask;
+ 	info.engine_class =3D xe_hwe_to_guc_class(q->hwe);
+ 	info.engine_submit_mask =3D
+ 		xe_hwe_guc_logical_to_submit_mask(q->hwe, q->logical_mask);
  	info.hwlrca_lo =3D lower_32_bits(xe_lrc_descriptor(lrc));
  	info.hwlrca_hi =3D upper_32_bits(xe_lrc_descriptor(lrc));
  	info.flags =3D CONTEXT_REGISTRATION_FLAG_KMD |
@@@ -1671,12 -1693,37 +1693,37 @@@ handle_vf_resume
  	return DRM_GPU_SCHED_STAT_NO_HANG;
  }
 =20
+ static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue =
*q);
+ static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q);
+=20
  static void guc_exec_queue_fini(struct xe_exec_queue *q)
  {
  	struct xe_guc_exec_queue *ge =3D q->guc;
  	struct xe_guc *guc =3D exec_queue_to_guc(q);
  	struct drm_device *drm =3D &guc_to_xe(guc)->drm;
 =20
+ 	/*
+ 	 * A secondary can leave the group while still preempt suspended (e.g.
+ 	 * xe_vm_remove_compute_exec_queue() forces its preempt fence to signal,
+ 	 * which suspends it). It holds one forwarded suspend reference on the
+ 	 * primary, so drop it and resume the primary if it was the last member
+ 	 * that had it suspended. Primaries forward to nobody, so they don't need
+ 	 * this.
+ 	 *
+ 	 * First make sure the primary's forwarded suspend has completed. If the
+ 	 * secondary was killed/reset before its preempt fence worker ran, that
+ 	 * worker skips suspend_wait() (see preempt_fence_work_func()), leaving
+ 	 * the primary's suspend possibly in flight. drop_suspend() runs under a
+ 	 * spinlock and cannot wait, so drain it here with the uninterruptible
+ 	 * blocking wait; otherwise resuming the primary in drop_suspend() could
+ 	 * trip the !suspend_pending assert.
+ 	 */
+ 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+ 		if (READ_ONCE(q->guc->suspend_count))
+ 			guc_exec_queue_suspend_wait_blocking(q);
+ 		guc_exec_queue_multi_queue_drop_suspend(q);
+ 	}
+=20
  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
  		struct xe_exec_queue_group *group =3D q->multi_queue.group;
 =20
@@@ -2176,23 -2223,147 +2223,147 @@@ static int guc_exec_queue_set_multi_que
  	return 0;
  }
 =20
+ /*
+  * Core suspend: take a suspend reference on @q and, on the first referen=
ce,
+  * disable its GuC context so the GPU is actually preempted. Caller must =
have
+  * ensured @q is not killed/banned/wedged. Returns true if this was the f=
irst
+  * suspend reference (the 0->1 transition).
+  */
+ static bool __guc_exec_queue_suspend(struct xe_exec_queue *q)
+ {
+ 	struct xe_guc_exec_queue *ge =3D q->guc;
+ 	struct xe_gpu_scheduler *sched =3D &ge->sched;
+ 	struct xe_sched_msg *msg =3D ge->static_msgs + STATIC_MSG_SUSPEND;
+ 	bool first;
+=20
+ 	xe_sched_msg_lock(sched);
+ 	first =3D (++ge->suspend_count =3D=3D 1);
+ 	if (first) {
+ 		bool added =3D guc_exec_queue_try_add_msg(q, msg, SUSPEND);
+=20
+ 		/* slot must be free at 0->1 */
+ 		xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), added);
+ 		ge->suspend_pending =3D true;
+ 	}
+ 	xe_sched_msg_unlock(sched);
+=20
+ 	return first;
+ }
+=20
+ /*
+  * Core resume: drop a suspend reference on @q and, on the last reference,
+  * re-enable its GuC context. Returns true if this dropped the last suspe=
nd
+  * reference (the 1->0 transition).
+  */
+ static bool __guc_exec_queue_resume(struct xe_exec_queue *q)
+ {
+ 	struct xe_guc_exec_queue *ge =3D q->guc;
+ 	struct xe_gpu_scheduler *sched =3D &ge->sched;
+ 	struct xe_sched_msg *msg =3D ge->static_msgs + STATIC_MSG_RESUME;
+ 	struct xe_guc *guc =3D exec_queue_to_guc(q);
+ 	bool last;
+=20
+ 	xe_sched_msg_lock(sched);
+ 	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
+ 	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
+ 	last =3D (--ge->suspend_count =3D=3D 0);
+ 	if (last) {
+ 		bool added =3D guc_exec_queue_try_add_msg(q, msg, RESUME);
+=20
+ 		/* slot must be free at 1->0 */
+ 		xe_gt_assert(guc_to_gt(guc), added);
+ 	}
+ 	xe_sched_msg_unlock(sched);
+=20
+ 	return last;
+ }
+=20
  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
  {
- 	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
- 	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_SUSPEND;
-=20
  	if (exec_queue_killed_or_banned_or_wedged(q))
  		return -EINVAL;
 =20
- 	xe_sched_msg_lock(sched);
- 	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
- 		q->guc->suspend_pending =3D true;
- 	xe_sched_msg_unlock(sched);
+ 	/*
+ 	 * Non-multi-queue queues and multi-queue primaries suspend themselves
+ 	 * directly: their own msg_lock makes the suspend_count 0->1 transition
+ 	 * and the suspend_pending update atomic, so no group level serialization
+ 	 * is needed.
+ 	 */
+ 	if (!xe_exec_queue_is_multi_queue_secondary(q)) {
+ 		__guc_exec_queue_suspend(q);
+ 		return 0;
+ 	}
+=20
+ 	/*
+ 	 * A secondary's suspend is meaningless once the primary - which owns the
+ 	 * group's GuC context - is gone, so fail it too. This keeps the
+ 	 * secondary's effective state consistent with guc_exec_queue_reset_stat=
us(),
+ 	 * which already reports the primary's killed/banned/wedged state for
+ 	 * secondaries. A primary killed *after* this check is still handled at
+ 	 * message-processing time, where the SUSPEND is a no-op for a killed
+ 	 * context; this only covers an already-dead primary.
+ 	 */
+ 	if (exec_queue_killed_or_banned_or_wedged(xe_exec_queue_multi_queue_prim=
ary(q)))
+ 		return -EINVAL;
+=20
+ 	/*
+ 	 * A secondary doesn't interface with GuC: suspend it like any other
+ 	 * queue (its own suspend_count drives its internally handled scheduler
+ 	 * state) and, only on its own 0->1 transition, forward the suspend to t=
he
+ 	 * primary so the GPU is actually preempted. Hold @suspend_lock so that
+ 	 * observing the secondary's transition and forwarding it to the primary
+ 	 * happen atomically; this keeps the primary's refcount paired with memb=
er
+ 	 * transitions even if the same secondary is suspended and resumed
+ 	 * concurrently across rebind cycles.
+ 	 */
+ 	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
+ 		if (__guc_exec_queue_suspend(q))
+ 			__guc_exec_queue_suspend(xe_exec_queue_multi_queue_primary(q));
+ 	}
 =20
  	return 0;
  }
 =20
- static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
+ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
+ {
+ 	struct xe_guc *guc =3D exec_queue_to_guc(q);
+=20
+ 	xe_gt_warn(guc_to_gt(guc),
+ 		   "Suspend fence, guc_id=3D%d, failed to respond, banning queue",
+ 		   q->guc->id);
+ 	/*
+ 	 * The GuC failed to respond to the suspend within the timeout. This is
+ 	 * not recoverable for this context, so ban it and tear it down via
+ 	 * cleanup rather than leave it suspended forever. __suspend_fence_signal
+ 	 * clears suspend_pending and wakes any waiter.
+ 	 *
+ 	 * @q is the primary here; it owns the group's GuC context, so a failure
+ 	 * to suspend it wedges the whole group. Ban and tear down the entire
+ 	 * group in the multi-queue case.
+ 	 */
+ 	if (xe_exec_queue_is_multi_queue(q)) {
+ 		set_exec_queue_group_banned(q);
+ 		__suspend_fence_signal(q);
+ 		xe_guc_exec_queue_group_trigger_cleanup(q);
+ 	} else {
+ 		set_exec_queue_banned(q);
+ 		__suspend_fence_signal(q);
+ 		xe_guc_exec_queue_trigger_cleanup(q);
+ 	}
+ }
+=20
+ /*
+  * Wait for @q's own suspend to complete: suspend_pending cleared, or the=
 queue
+  * killed / GuC stopped. With @blocking, wait uninterruptibly and do not =
handle
+  * VF recovery (for callers that must complete on behalf of a possibly
+  * cross-process queue); otherwise wait interruptibly.
+  *
+  * Returns 0 on completion or -ETIME on timeout. Interruptible waits may =
also
+  * return -EAGAIN (VF recovery in progress, retry) or -ERESTARTSYS (abort=
ed by a
+  * signal; suspend_pending may still be set, so callers must not resume()
+  * without re-confirming the suspend).
+  */
+ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool=
 blocking)
  {
  	struct xe_guc *guc =3D exec_queue_to_guc(q);
  	struct xe_device *xe =3D guc_to_xe(guc);
@@@ -2208,44 -2379,146 +2379,146 @@@
  	 xe_guc_read_stopped(guc))
 =20
  retry:
- 	if (IS_SRIOV_VF(xe))
+ 	if (blocking) {
+ 		if (IS_SRIOV_VF(xe))
+ 			ret =3D wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
+ 		else
+ 			ret =3D wait_event_timeout(q->guc->suspend_wait, WAIT_COND,
+ 						 HZ * 5);
+ 	} else if (IS_SRIOV_VF(xe)) {
  		ret =3D wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
- 						       vf_recovery(guc),
- 						       HZ * 5);
- 	else
+ 						       vf_recovery(guc), HZ * 5);
+ 	} else {
  		ret =3D wait_event_interruptible_timeout(q->guc->suspend_wait,
  						       WAIT_COND, HZ * 5);
+ 	}
 =20
- 	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
+ 	if (!blocking && vf_recovery(guc) && !xe_device_wedged(xe))
  		return -EAGAIN;
 =20
- 	if (!ret) {
- 		xe_gt_warn(guc_to_gt(guc),
- 			   "Suspend fence, guc_id=3D%d, failed to respond",
- 			   q->guc->id);
- 		/* XXX: Trigger GT reset? */
+ 	if (!ret)
  		return -ETIME;
- 	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
+ 	else if (!blocking && IS_SRIOV_VF(xe) && !WAIT_COND)
  		/* Corner case on RESFIX DONE where vf_recovery() changes */
  		goto retry;
- 	}
 =20
  #undef WAIT_COND
 =20
  	return ret < 0 ? ret : 0;
  }
 =20
+ static int guc_exec_queue_suspend_wait_common(struct xe_exec_queue *q, bo=
ol blocking)
+ {
+ 	int ret;
+=20
+ 	/*
+ 	 * A secondary's suspend rides the sched-message worker (short-circuited,
+ 	 * no GuC round-trip) and so is not synchronous with
+ 	 * guc_exec_queue_suspend(): its own suspend_pending may still be set
+ 	 * here. Waiting on the primary alone is not sufficient - if the primary
+ 	 * was already suspended, the forward is a refcount-only transition that
+ 	 * queues no new primary SUSPEND and leaves the primary's suspend_pending
+ 	 * clear, so the primary wait would return immediately while the
+ 	 * secondary's suspend is still in flight, and a later resume() would tr=
ip
+ 	 * the secondary's !suspend_pending assert. So first wait for the
+ 	 * secondary's own suspend to complete, then wait on the primary.
+ 	 *
+ 	 * A timeout on either bans the queue (being multi-queue, that tears down
+ 	 * the whole group). A secondary suspend has no real GuC round-trip, so
+ 	 * its timeout is a software scheduler stall rather than a GuC fault, but
+ 	 * banning is still the safe recovery: otherwise the queue is left with
+ 	 * suspend_pending set and a subsequent resume() trips the !suspend_pend=
ing
+ 	 * assert.
+ 	 */
+ 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+ 		ret =3D guc_exec_queue_wait_suspend_done(q, blocking);
+ 		if (ret =3D=3D -ETIME)
+ 			guc_exec_queue_suspend_timeout_ban(q);
+ 		if (ret)
+ 			return ret;
+ 	}
+=20
+ 	q =3D xe_exec_queue_multi_queue_primary(q);
+ 	ret =3D guc_exec_queue_wait_suspend_done(q, blocking);
+ 	if (ret =3D=3D -ETIME)
+ 		guc_exec_queue_suspend_timeout_ban(q);
+=20
+ 	return ret;
+ }
+=20
+ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
+ {
+ 	return guc_exec_queue_suspend_wait_common(q, false);
+ }
+=20
+ /*
+  * Uninterruptible variant of guc_exec_queue_suspend_wait() for callers t=
hat
+  * must complete the wait on behalf of a queue possibly owned by a differ=
ent
+  * process (e.g. cleanup/undo paths). An interruptible wait could return
+  * -ERESTARTSYS if the calling task is signalled, leaving that queue susp=
ended
+  * forever (cross-process DoS). VF recovery is deliberately not handled (=
no
+  * -EAGAIN) since a blocking caller cannot retry.
+  */
+ static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q)
+ {
+ 	return guc_exec_queue_suspend_wait_common(q, true);
+ }
+=20
  static void guc_exec_queue_resume(struct xe_exec_queue *q)
  {
- 	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
- 	struct xe_sched_msg *msg =3D q->guc->static_msgs + STATIC_MSG_RESUME;
- 	struct xe_guc *guc =3D exec_queue_to_guc(q);
+ 	/*
+ 	 * Non-multi-queue queues and multi-queue primaries resume themselves
+ 	 * directly; their own msg_lock is sufficient.
+ 	 */
+ 	if (!xe_exec_queue_is_multi_queue_secondary(q)) {
+ 		__guc_exec_queue_resume(q);
+ 		return;
+ 	}
 =20
- 	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
+ 	/*
+ 	 * Mirror of guc_exec_queue_suspend(): resume the secondary like any
+ 	 * other queue and, only on its own 1->0 transition, forward the resume
+ 	 * to the primary so the primary's GuC context is re-enabled once the
+ 	 * last member that suspended it resumes. @suspend_lock keeps the
+ 	 * secondary transition and the primary forward atomic.
+ 	 */
+ 	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
+ 		if (__guc_exec_queue_resume(q))
+ 			__guc_exec_queue_resume(xe_exec_queue_multi_queue_primary(q));
+ 	}
+ }
 =20
- 	xe_sched_msg_lock(sched);
- 	guc_exec_queue_try_add_msg(q, msg, RESUME);
- 	xe_sched_msg_unlock(sched);
+ /*
+  * Drop a leaving secondary's forwarded suspend reference on the primary =
and
+  * resume the primary if this was the last member that had it suspended.
+  * See guc_exec_queue_fini().
+  */
+ static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue =
*q)
+ {
+ 	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
+ 		struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
+=20
+ 		/*
+ 		 * A suspended secondary holds exactly one suspend reference on the
+ 		 * primary (forwarded on its 0->1 transition). If it leaves while
+ 		 * still suspended, release that reference so the primary is not
+ 		 * kept disabled forever.
+ 		 */
+ 		if (!READ_ONCE(q->guc->suspend_count))
+ 			break;
+=20
+ 		if (exec_queue_killed_or_banned_or_wedged(primary))
+ 			break;
+=20
+ 		/*
+ 		 * No suspend_wait() here (and we can't - suspend_lock is a
+ 		 * spinlock). guc_exec_queue_fini() has already drained the
+ 		 * primary's forwarded suspend with the blocking wait, so its
+ 		 * suspend has completed (suspend_pending cleared) by the time we
+ 		 * resume it here. __guc_exec_queue_resume() asserts this.
+ 		 */
+ 		__guc_exec_queue_resume(primary);
+ 	}
  }
 =20
  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
@@@ -2274,6 -2547,7 +2547,7 @@@ static const struct xe_exec_queue_ops g
  	.set_multi_queue_priority =3D guc_exec_queue_set_multi_queue_priority,
  	.suspend =3D guc_exec_queue_suspend,
  	.suspend_wait =3D guc_exec_queue_suspend_wait,
+ 	.suspend_wait_blocking =3D guc_exec_queue_suspend_wait_blocking,
  	.resume =3D guc_exec_queue_resume,
  	.reset_status =3D guc_exec_queue_reset_status,
  };
@@@ -3030,6 -3304,38 +3304,38 @@@ int xe_guc_exec_queue_memory_cat_error_
 =20
  	/* Treat the same as engine reset */
  	xe_guc_exec_queue_reset_trigger_cleanup(q);
+=20
+ 	return 0;
+ }
+=20
+ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 =
len)
+ {
+ 	struct xe_gt *gt =3D guc_to_gt(guc);
+ 	struct xe_exec_queue *q;
+ 	u32 guc_id;
+=20
+ 	if (unlikely(!len || len > 1))
+ 		return -EPROTO;
+=20
+ 	guc_id =3D msg[0];
+=20
+ 	if (guc_id =3D=3D GUC_ID_UNKNOWN) {
+ 		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
+ 		return 0;
+ 	}
+=20
+ 	q =3D g2h_exec_queue_lookup(guc, guc_id);
+ 	if (unlikely(!q))
+ 		return -EPROTO;
+=20
+ 	xe_gt_err(gt,
+ 		  "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s, logical_mask=
=3D0x%x",
+ 		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
+=20
+ 	trace_xe_guc_uncorrectable_error(q);
+=20
+ 	/* Treat the same as engine reset */
+ 	xe_guc_exec_queue_reset_trigger_cleanup(q);
 =20
  	return 0;
  }

--xRlcgmWHH8fJP0SD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeNFAACgkQJNaLcl1U
h9AbDgf/ahNZSbq8FyUKDzdq60k1dgquLYcSUTkkS/V2j2EtQEvZs6CGAQKOwtwd
QAI9FW5ZG3ObcSae+8qZg4286G4oSSfPJ7hrFdhEVHZccQK0TLZNneumPFliaH40
l8JYVRrkoJMwS7xGU837ymse9Y+9DV62f8T1qxHu04BlwEffQkeyEF8uFPZrGOdT
o3oKEKt/8J13ryj5Kf9hJPdH6QEAsGJxzTsQobqILGuZo4aDvpTZXzTylkh055DP
IQtVd7SYWwISbBEAw0pImRFAZkbb1Z5B3v12ZwHuP47pRC9HtS/KiH/JXpnbVZ+x
/rsKE30rOm1rdcaHUqCgiJB7ICutdg==
=ax63
-----END PGP SIGNATURE-----

--xRlcgmWHH8fJP0SD--
