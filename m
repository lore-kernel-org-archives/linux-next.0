Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB9E2745E;
	Mon,  9 Mar 2026 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082189; cv=none; b=Vb2Wcd63LymSBKXYSrrHPA2DYRjZFr1fTct0j8eAEQcYcJcOOk15WVVfGZUr2quGoP6W7PDKEugmhk45RRXgc5/ICBNsrF9uxhLnstRkc1iDzAPlFrm+e9Iz+q+52JCNVAzT2JOZ4tJMDOyktzqnTqvqR/DuMgclrJ4WJZpPnyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082189; c=relaxed/simple;
	bh=SURmaUkD0VJOBFXVicYusVnL4OtIX7ZrKvZd86ESEc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFYwN1EUWOUpYqe4BF9LBqP8GXR5R3Cx4vRDoXI8aEBskvwuDi2p5imuOw3ehv5CjzBL1eIovgsarh0xhbsBrHSBr+JWv9aO6CO3mIYAs3DIV5gDwXDc127QLpC9N/5p26W/jNcnW+QIeGQgYj8LYwRSe8enULo7AiTdHvPITo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTOjBBO1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTOjBBO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38438C4CEF7;
	Mon,  9 Mar 2026 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773082188;
	bh=SURmaUkD0VJOBFXVicYusVnL4OtIX7ZrKvZd86ESEc0=;
	h=Date:From:To:Cc:Subject:From;
	b=pTOjBBO1GIz82vkdhY4ygRC43x3+6yRR74NmqOrlHInuDDecAQ78x7yeZNiTiNWdZ
	 ptLGbz2rRGKrx3VGubgd/Fws05c6UQHSNQ8C19GKOnD9Jf+Rrmfquq8etYe1qHb+Ix
	 sm0pK9eFKE+LS7ItHwhaRhi1TR7+Tzjg1exVbZq5zX7ef7yOuUXA+la+uCf8CybkAM
	 GoU9xwGmrDUnEdVhbb5sdg96iE+uNB08OqlCKpxaWfKe2Z/eT6OKGBzMbcf3q6WzYL
	 WhKcDYaRSBy/hrGvmCkk7JshVRq5K9VcRmm6b/v24eLJ+1A6/oMVm2eAQs1VJZaW/P
	 Y/dcbskqQviig==
Date: Mon, 9 Mar 2026 18:49:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <aa8WSH-ILSebstIB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zXUhl2GkkGGjFV6R"
Content-Disposition: inline


--zXUhl2GkkGGjFV6R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a conflict in:

  kernel/sched/ext.c

between commits:

  c2a57380df9dd ("sched: Replace use of system_unbound_wq with system_dfl_w=
q")

=66rom the tip tree and commit:

  cde94c032b32b ("sched_ext: Make watchdog sub-sched aware")

=66rom the sched-ext tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I do note there's another system_unbound_wq usage there which for some
reason wasn't updated...

diff --cc kernel/sched/ext.c
index 7278d57496478,d6d8073370130..0000000000000
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@@ -2766,8 -3205,11 +3205,11 @@@ static void scx_watchdog_workfn(struct=20
 =20
  		cond_resched();
  	}
- 	queue_delayed_work(system_dfl_wq, to_delayed_work(work),
- 			   READ_ONCE(scx_watchdog_timeout) / 2);
+=20
+ 	intv =3D READ_ONCE(scx_watchdog_interval);
+ 	if (intv < ULONG_MAX)
 -		queue_delayed_work(system_unbound_wq, to_delayed_work(work),
++		queue_delayed_work(system_dfl_wq, to_delayed_work(work),
+ 				   intv);
  }
 =20
  void scx_tick(struct rq *rq)
@@@ -4282,9 -5218,247 +5218,247 @@@ static void free_kick_syncs(void
  	}
  }
 =20
- static void scx_disable_workfn(struct kthread_work *work)
+ static void refresh_watchdog(void)
+ {
+ 	struct scx_sched *sch;
+ 	unsigned long intv =3D ULONG_MAX;
+=20
+ 	/* take the shortest timeout and use its half for watchdog interval */
+ 	rcu_read_lock();
+ 	list_for_each_entry_rcu(sch, &scx_sched_all, all)
+ 		intv =3D max(min(intv, sch->watchdog_timeout / 2), 1);
+ 	rcu_read_unlock();
+=20
+ 	WRITE_ONCE(scx_watchdog_timestamp, jiffies);
+ 	WRITE_ONCE(scx_watchdog_interval, intv);
+=20
+ 	if (intv < ULONG_MAX)
 -		mod_delayed_work(system_unbound_wq, &scx_watchdog_work, intv);
++		mod_delayed_work(system_dfl_wq, &scx_watchdog_work, intv);
+ 	else
+ 		cancel_delayed_work_sync(&scx_watchdog_work);
+ }
+=20
+ static s32 scx_link_sched(struct scx_sched *sch)
+ {
+ 	scoped_guard(raw_spinlock_irq, &scx_sched_lock) {
+ #ifdef CONFIG_EXT_SUB_SCHED
+ 		struct scx_sched *parent =3D scx_parent(sch);
+ 		s32 ret;
+=20
+ 		if (parent) {
+ 			ret =3D rhashtable_lookup_insert_fast(&scx_sched_hash,
+ 					&sch->hash_node, scx_sched_hash_params);
+ 			if (ret) {
+ 				scx_error(sch, "failed to insert into scx_sched_hash (%d)", ret);
+ 				return ret;
+ 			}
+=20
+ 			list_add_tail(&sch->sibling, &parent->children);
+ 		}
+ #endif	/* CONFIG_EXT_SUB_SCHED */
+=20
+ 		list_add_tail_rcu(&sch->all, &scx_sched_all);
+ 	}
+=20
+ 	refresh_watchdog();
+ 	return 0;
+ }
+=20
+ static void scx_unlink_sched(struct scx_sched *sch)
+ {
+ 	scoped_guard(raw_spinlock_irq, &scx_sched_lock) {
+ #ifdef CONFIG_EXT_SUB_SCHED
+ 		if (scx_parent(sch)) {
+ 			rhashtable_remove_fast(&scx_sched_hash, &sch->hash_node,
+ 					       scx_sched_hash_params);
+ 			list_del_init(&sch->sibling);
+ 		}
+ #endif	/* CONFIG_EXT_SUB_SCHED */
+ 		list_del_rcu(&sch->all);
+ 	}
+=20
+ 	refresh_watchdog();
+ }
+=20
+ #ifdef CONFIG_EXT_SUB_SCHED
+ static DECLARE_WAIT_QUEUE_HEAD(scx_unlink_waitq);
+=20
+ static void drain_descendants(struct scx_sched *sch)
+ {
+ 	/*
+ 	 * Child scheds that finished the critical part of disabling will take
+ 	 * themselves off @sch->children. Wait for it to drain. As propagation
+ 	 * is recursive, empty @sch->children means that all proper descendant
+ 	 * scheds reached unlinking stage.
+ 	 */
+ 	wait_event(scx_unlink_waitq, list_empty(&sch->children));
+ }
+=20
+ static void scx_fail_parent(struct scx_sched *sch,
+ 			    struct task_struct *failed, s32 fail_code)
+ {
+ 	struct scx_sched *parent =3D scx_parent(sch);
+ 	struct scx_task_iter sti;
+ 	struct task_struct *p;
+=20
+ 	scx_error(parent, "ops.init_task() failed (%d) for %s[%d] while disablin=
g a sub-scheduler",
+ 		  fail_code, failed->comm, failed->pid);
+=20
+ 	/*
+ 	 * Once $parent is bypassed, it's safe to put SCX_TASK_NONE tasks into
+ 	 * it. This may cause downstream failures on the BPF side but $parent is
+ 	 * dying anyway.
+ 	 */
+ 	scx_bypass(parent, true);
+=20
+ 	scx_task_iter_start(&sti, sch->cgrp);
+ 	while ((p =3D scx_task_iter_next_locked(&sti))) {
+ 		if (scx_task_on_sched(parent, p))
+ 			continue;
+=20
+ 		scoped_guard (sched_change, p, DEQUEUE_SAVE | DEQUEUE_MOVE) {
+ 			scx_disable_and_exit_task(sch, p);
+ 			rcu_assign_pointer(p->scx.sched, parent);
+ 		}
+ 	}
+ 	scx_task_iter_stop(&sti);
+ }
+=20
+ static void scx_sub_disable(struct scx_sched *sch)
+ {
+ 	struct scx_sched *parent =3D scx_parent(sch);
+ 	struct scx_task_iter sti;
+ 	struct task_struct *p;
+ 	int ret;
+=20
+ 	/*
+ 	 * Guarantee forward progress and wait for descendants to be disabled.
+ 	 * To limit disruptions, $parent is not bypassed. Tasks are fully
+ 	 * prepped and then inserted back into $parent.
+ 	 */
+ 	scx_bypass(sch, true);
+ 	drain_descendants(sch);
+=20
+ 	/*
+ 	 * Here, every runnable task is guaranteed to make forward progress and
+ 	 * we can safely use blocking synchronization constructs. Actually
+ 	 * disable ops.
+ 	 */
+ 	mutex_lock(&scx_enable_mutex);
+ 	percpu_down_write(&scx_fork_rwsem);
+ 	scx_cgroup_lock();
+=20
+ 	set_cgroup_sched(sch_cgroup(sch), parent);
+=20
+ 	scx_task_iter_start(&sti, sch->cgrp);
+ 	while ((p =3D scx_task_iter_next_locked(&sti))) {
+ 		struct rq *rq;
+ 		struct rq_flags rf;
+=20
+ 		/* filter out duplicate visits */
+ 		if (scx_task_on_sched(parent, p))
+ 			continue;
+=20
+ 		/*
+ 		 * By the time control reaches here, all descendant schedulers
+ 		 * should already have been disabled.
+ 		 */
+ 		WARN_ON_ONCE(!scx_task_on_sched(sch, p));
+=20
+ 		/*
+ 		 * If $p is about to be freed, nothing prevents $sch from
+ 		 * unloading before $p reaches sched_ext_free(). Disable and
+ 		 * exit $p right away.
+ 		 */
+ 		if (!tryget_task_struct(p)) {
+ 			scx_disable_and_exit_task(sch, p);
+ 			continue;
+ 		}
+=20
+ 		scx_task_iter_unlock(&sti);
+=20
+ 		/*
+ 		 * $p is READY or ENABLED on @sch. Initialize for $parent,
+ 		 * disable and exit from @sch, and then switch over to $parent.
+ 		 *
+ 		 * If a task fails to initialize for $parent, the only available
+ 		 * action is disabling $parent too. While this allows disabling
+ 		 * of a child sched to cause the parent scheduler to fail, the
+ 		 * failure can only originate from ops.init_task() of the
+ 		 * parent. A child can't directly affect the parent through its
+ 		 * own failures.
+ 		 */
+ 		ret =3D __scx_init_task(parent, p, false);
+ 		if (ret) {
+ 			scx_fail_parent(sch, p, ret);
+ 			put_task_struct(p);
+ 			break;
+ 		}
+=20
+ 		rq =3D task_rq_lock(p, &rf);
+ 		scoped_guard (sched_change, p, DEQUEUE_SAVE | DEQUEUE_MOVE) {
+ 			/*
+ 			 * $p is initialized for $parent and still attached to
+ 			 * @sch. Disable and exit for @sch, switch over to
+ 			 * $parent, override the state to READY to account for
+ 			 * $p having already been initialized, and then enable.
+ 			 */
+ 			scx_disable_and_exit_task(sch, p);
+ 			scx_set_task_state(p, SCX_TASK_INIT);
+ 			rcu_assign_pointer(p->scx.sched, parent);
+ 			scx_set_task_state(p, SCX_TASK_READY);
+ 			scx_enable_task(parent, p);
+ 		}
+ 		task_rq_unlock(rq, p, &rf);
+=20
+ 		put_task_struct(p);
+ 	}
+ 	scx_task_iter_stop(&sti);
+=20
+ 	scx_cgroup_unlock();
+ 	percpu_up_write(&scx_fork_rwsem);
+=20
+ 	/*
+ 	 * All tasks are moved off of @sch but there may still be on-going
+ 	 * operations (e.g. ops.select_cpu()). Drain them by flushing RCU. Use
+ 	 * the expedited version as ancestors may be waiting in bypass mode.
+ 	 * Also, tell the parent that there is no need to keep running bypass
+ 	 * DSQs for us.
+ 	 */
+ 	synchronize_rcu_expedited();
+ 	disable_bypass_dsp(sch);
+=20
+ 	scx_unlink_sched(sch);
+=20
+ 	mutex_unlock(&scx_enable_mutex);
+=20
+ 	/*
+ 	 * @sch is now unlinked from the parent's children list. Notify and call
+ 	 * ops.sub_detach/exit(). Note that ops.sub_detach/exit() must be called
+ 	 * after unlinking and releasing all locks. See scx_claim_exit().
+ 	 */
+ 	wake_up_all(&scx_unlink_waitq);
+=20
+ 	if (sch->ops.sub_detach && sch->sub_attached) {
+ 		struct scx_sub_detach_args sub_detach_args =3D {
+ 			.ops =3D &sch->ops,
+ 			.cgroup_path =3D sch->cgrp_path,
+ 		};
+ 		SCX_CALL_OP(parent, SCX_KF_UNLOCKED, sub_detach, NULL,
+ 			    &sub_detach_args);
+ 	}
+=20
+ 	if (sch->ops.exit)
+ 		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, exit, NULL, sch->exit_info);
+ 	kobject_del(&sch->kobj);
+ }
+ #else	/* CONFIG_EXT_SUB_SCHED */
+ static void drain_descendants(struct scx_sched *sch) { }
+ static void scx_sub_disable(struct scx_sched *sch) { }
+ #endif	/* CONFIG_EXT_SUB_SCHED */
+=20
+ static void scx_root_disable(struct scx_sched *sch)
  {
- 	struct scx_sched *sch =3D container_of(work, struct scx_sched, disable_w=
ork);
  	struct scx_exit_info *ei =3D sch->exit_info;
  	struct scx_task_iter sti;
  	struct task_struct *p;

--zXUhl2GkkGGjFV6R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmvFkcACgkQJNaLcl1U
h9Ctiwf/cwj+oDqHY4mrlPTSlBwXrddQ+sSPgcPKROT09GEzJxYqcQ1oCHg1d4lR
hfqK9uGYKuUGLbZD76IRWMvQ3hj/64CrO1YZZbSQAvBFtHks1YDnlAF5od2rUHTo
g8RESrJrziY1YAfbqGWkTIp5RkIHbuTDQc+vDbpIeyFAQ+WJolh2geQ9thJR2M7n
wIOOUFApQwcXgMvcdks6ejOd1G+INdVAX8uZBGjVRA7VBt5oaG8DoBxKyU4hMeEW
318TIG8VtM5y3Nc0g8c65uG3J5NQszNCBGcgtnFTNWnHaQ0voCpoKz94HQYhrZS6
5SpjSy6NZGsxmp3MIRdjTIQm6Is5mw==
=sOna
-----END PGP SIGNATURE-----

--zXUhl2GkkGGjFV6R--
