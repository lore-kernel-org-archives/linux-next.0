Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748F03009E2;
	Thu, 28 May 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779978530; cv=none; b=H9/LWTy9xSYOLQwhCSqSwOuG/6NqSnychv0TSSUsXz2hAfjudEy1KxGzQWSYYwvVZmA1s5MmScikx/7wiinCUZHwnIPdrxXHGObDRINI0XrGSZMrUmLfZQPANetsVEHKOhuhI65NdgpsyzNRZ+9Tki3B3qgN4SxJk8GRtQOnUbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779978530; c=relaxed/simple;
	bh=0onhG+iwUc8DCt10Q62WhX2y9hxh2mOmbqKpnl+vPtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjHW63qqHx9ZiS9QDNQY7iV7oRdEpTj/5QaHz91f2ALonmlVXshYoEUvWbk6ThjhXJheLmxzN2gwKfhrjtssEM/uLAjv2WEPlCRDoVA1n8b7UH+hes6FDJBLBy3B5yobY23KDh/hpCt9Mub1LjrQkyhg8g1fCenARUS6g3kRTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odkoZq1N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odkoZq1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2811F000E9;
	Thu, 28 May 2026 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779978529;
	bh=PZMxrhf1kqTFeN129a/5CA/HQpWWCFIJTPhF8oEGmx8=;
	h=Date:From:To:Cc:Subject;
	b=odkoZq1NrorfN12bzW0EkRaSrqxCjx7gt+Plo56CheOZxGcqKece6q2N3S0DeoYbJ
	 PDKb3m9F+ur/NpGXAqClW1qtv8+oaB+MgLtvWy0bld3oqeRFvaTP+lNLKsbQL0kMsf
	 CpMsfmKj0JqWmJmdjDVO2Gw/0Nzym+ftI4c7EQKFcdNcnaJilGvxJF0HTdr0E/1Kqw
	 RWiSyBG7hw+BGIfEgVwpBzUB400TK2k/8Lxg6kYAmGIL+xaWjNjdBPjkb+zwha/MSF
	 jAwg9HWgGM7cRiI+M1WFaVwVZCC3k3qaYyx2pgOYx2hryA9gretm98Ph2jYNKqKI6M
	 HsXtk5N7Saj2A==
Date: Thu, 28 May 2026 15:28:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the nfsd tree
Message-ID: <ahhRHXWXMtagI5Zi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QZL0A0kEfYAKheg+"
Content-Disposition: inline


--QZL0A0kEfYAKheg+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got conflicts in:

  kernel/ptrace.c
  fs/exec.c
  include/linux/binfmts.h
  kernel/exec_state.c

between commits:

  6b1c66c9cca99 ("exec_state: relocate dumpable information")
  38205ecbe6b6d ("exec: free the old mm outside the exec locks")

=66rom the nfsd tree and commits:

  6b1c66c9cca99 ("exec_state: relocate dumpable information")
  38205ecbe6b6d ("exec: free the old mm outside the exec locks")

=66rom the vfs-brauner tree plus some other context from vfs-brauner
merges.  Specifically this is due to the nfsd tree having a build break
=66rom the vfs-brauner tree it's based on and being held at an old version
with it's old version of vfs-brauner while the vfs-brauner tree has been
updated.  However since the build issue isn't fixed in the version of
vfs-brauner I have today (I saw a patch on the list though, I guess this
will be fixed tomorrow?) the below merge isn't actually going to be in
-next, I'm merging the old version that's shared with nfsd and there's
no actual conflict in today's tree.

Are you sure it's a good idea to base the nfsd tree on something
that's rebasing?

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/exec.c
index 894added369dd,b92fe7db176cf..0000000000000
--- a/fs/exec.c
+++ b/fs/exec.c
@@@ -836,16 -836,18 +836,18 @@@ EXPORT_SYMBOL(read_code)
  /*
   * Maps the mm_struct mm into the current task struct.
   * On success, this function returns with exec_update_lock
-  * held for writing.
+  * held for writing. The replaced address space is stashed in
+  * bprm->old_mm for setup_new_exec() to release outside the lock.
   */
- static int exec_mmap(struct mm_struct *mm, struct user_namespace *user_ns)
+ static int exec_mmap(struct linux_binprm *bprm)
  {
  	struct task_exec_state *exec_state __free(put_task_exec_state) =3D NULL;
+ 	struct mm_struct *mm =3D bprm->mm;
  	struct task_struct *tsk;
  	struct mm_struct *old_mm, *active_mm;
  	int ret;
 =20
- 	exec_state =3D alloc_task_exec_state(user_ns);
+ 	exec_state =3D alloc_task_exec_state(bprm->user_ns);
  	if (!exec_state)
  		return -ENOMEM;
 =20
@@@ -898,15 -900,22 +900,22 @@@
  	if (old_mm) {
  		mmap_read_unlock(old_mm);
  		BUG_ON(active_mm !=3D old_mm);
- 		setmax_mm_hiwater_rss(&tsk->signal->maxrss, old_mm);
- 		mm_update_next_owner(old_mm);
- 		mmput(old_mm);
+ 		/* Defer teardown to setup_new_exec(), outside the exec locks. */
+ 		bprm->old_mm =3D old_mm;
  		return 0;
  	}
  	mmdrop_lazy_tlb(active_mm);
  	return 0;
  }
 =20
+ /* Release the address space replaced by exec, outside the exec locks. */
+ static void exec_mm_put_old(struct mm_struct *old_mm)
+ {
+ 	setmax_mm_hiwater_rss(&current->signal->maxrss, old_mm);
+ 	mm_update_next_owner(old_mm);
+ 	mmput(old_mm);
+ }
+=20
  static int de_thread(struct task_struct *tsk)
  {
  	struct signal_struct *sig =3D tsk->signal;
@@@ -1155,7 -1164,7 +1164,7 @@@ int begin_new_exec(struct linux_binprm=20
  	 * Release all of the old mmap stuff
  	 */
  	acct_arg_size(bprm, 0);
- 	retval =3D exec_mmap(bprm->mm, bprm->user_ns);
+ 	retval =3D exec_mmap(bprm);
  	if (retval)
  		goto out;
 =20
@@@ -1338,6 -1347,12 +1347,12 @@@ void setup_new_exec(struct linux_binpr
  	me->mm->task_size =3D TASK_SIZE;
  	up_write(&me->signal->exec_update_lock);
  	mutex_unlock(&me->signal->cred_guard_mutex);
+=20
+ 	/* The exec locks are dropped: release the old address space now. */
+ 	if (bprm->old_mm) {
+ 		exec_mm_put_old(bprm->old_mm);
+ 		bprm->old_mm =3D NULL;
+ 	}
  }
  EXPORT_SYMBOL(setup_new_exec);
 =20
@@@ -1394,6 -1409,9 +1409,9 @@@ static void free_bprm(struct linux_binp
  		mutex_unlock(&current->signal->cred_guard_mutex);
  		abort_creds(bprm->cred);
  	}
+ 	/* exec swapped the mm but failed before setup_new_exec() freed it */
+ 	if (bprm->old_mm)
+ 		exec_mm_put_old(bprm->old_mm);
  	do_close_execat(bprm->file);
  	if (bprm->executable)
  		fput(bprm->executable);
diff --combined include/linux/binfmts.h
index a8379f4eee615,2c77e383e7375..0000000000000
--- a/include/linux/binfmts.h
+++ b/include/linux/binfmts.h
@@@ -25,6 -25,7 +25,7 @@@ struct linux_binprm=20
  	struct page *page[MAX_ARG_PAGES];
  #endif
  	struct mm_struct *mm;
+ 	struct mm_struct *old_mm;	/* replaced address space, freed by setup_new_=
exec() */
  	/* user_ns published to task->exec_state at execve, narrowed by would_du=
mp(). */
  	struct user_namespace *user_ns;
  	unsigned long p; /* current top of mem */
diff --combined kernel/exec_state.c
index 2b7d0262d0f4e,6034f4b4808fe..0000000000000
--- a/kernel/exec_state.c
+++ b/kernel/exec_state.c
@@@ -91,7 -91,7 +91,7 @@@ void task_exec_state_set_dumpable(enum=20
  {
  	struct task_exec_state *exec_state;
 =20
- 	if (WARN_ON(value > TASK_DUMPABLE_ROOT))
+ 	if (WARN_ON_ONCE(value > TASK_DUMPABLE_ROOT))
  		value =3D TASK_DUMPABLE_OFF;
 =20
  	exec_state =3D rcu_dereference_protected(current->exec_state, true);
diff --combined kernel/ptrace.c
index ea8a682e837d9,d041645d9d17d..0000000000000
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@@ -53,11 -53,9 +53,9 @@@ bool ptracer_access_allowed(struct task
  {
  	const struct task_exec_state *es;
 =20
- 	if (!tsk->ptrace)
- 		return false;
- 	if (current !=3D tsk->parent)
- 		return false;
  	guard(rcu)();
+ 	if (ptrace_parent(tsk) !=3D current)
+ 		return false;
  	es =3D task_exec_state_rcu(tsk);
  	return READ_ONCE(es->dumpable) =3D=3D TASK_DUMPABLE_OWNER ||
  	       ptracer_capable(tsk, es->user_ns);


--QZL0A0kEfYAKheg+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYURwACgkQJNaLcl1U
h9AkaAgAgr4RzcErKFeZMBJprY5lQFRYyTsCQmgy76OgvGgTfUEMZO/UjWkJWTgP
PsWIMTNGOzBGqc7Pzo/kLfNNjtytjCqaeMD4sM8pYpZZg7rDtYuqPwd2vIryyggS
SOpG5ZTO2/2wYjwlpAa4V86yqj5j13Hl0tZi/8ev5h0f6VGNLVOXxPFxGL8SRhb8
ODFIow1G8+ghas7j8QgqyW+uq4fDbB0xhFwhaG3R1KZCT0wlbRUtcOcj8aXloGxp
8kwRkggXnnC80ewaSaK5Rb1dm1Z1TjjVb/Tc5EGlNRxYT8G8T06S11sHOcDB7uVR
44Q4Qh34kCLNiMl5+50RYbd7rvWsBg==
=ibK4
-----END PGP SIGNATURE-----

--QZL0A0kEfYAKheg+--
