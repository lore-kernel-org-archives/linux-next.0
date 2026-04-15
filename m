Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C36335072;
	Wed, 15 Apr 2026 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776249799; cv=none; b=Syzne0Q5nT1YyVjDz4VF2WHIijIcXXVPNsEHUDw+n6/vz+b6eLXaEfv6r9G8DLxlqY8x5b8gdrpCv+txMdX9CKuN4mPv5peKQ1EwTDQyCQckEe0MOMPWbcEjvbEHDk4HD0LArUjTal57jS8TgNtvCiaomeaD0hdi0S6Vntp4eNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776249799; c=relaxed/simple;
	bh=mtvYMI+AJpGKaamr1t10JXoRYJCB1tJUdvJpeTeQXhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mivcx/IuwyJ1SlZLimVOLmvadPDbADwEje6/sFBhJxIDB93ZWjQPr+5q6mx9JEAzAblLyXxwJVy47SGgy8btybIo6OW5blQAmCTFvByN7BFzY/qjwXASD0kDzMYk711Bx8PFueFkbY5a5wYZWKldEFVk05W6uJokL01N7ZM9vr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uH85xqqT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uH85xqqT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38EAC19424;
	Wed, 15 Apr 2026 10:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776249798;
	bh=mtvYMI+AJpGKaamr1t10JXoRYJCB1tJUdvJpeTeQXhE=;
	h=Date:From:To:Cc:Subject:From;
	b=uH85xqqTEGUvQ1ym1lO7Ipwaw6JTOAW1XpCWKKO8B1g39pv3h85QUHSUgPyV8fF4J
	 IneIb9rrIWlalgCwLqbYCMTB/68+T7TUjAhMm2ZwE16Lau45fveAOW+1qATVv0K0IO
	 Dpvq+nMCiVOKC4NrQjSTOTG7oJXtb56r6/MihVovvG8sTPWMCU2gopySnrhMdOZgQY
	 C3XjBzgveD3csv1E2r0SAPPPvuKLo0aFv8TDbfZXI9JwnSPyP7QHZlNFjlb/hzgbJ0
	 pvx65nhZmcazCdUEwHhV1YFNFQEVxFZQR+3gyPYPM2ZUkn2i95PRUPuzAzj4wto79n
	 tpdSsib8fVs8g==
Date: Wed, 15 Apr 2026 11:43:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the origin tree
Message-ID: <ad9rw7oR41Q3Kzuh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ERsFtt+fCZMBvgkM"
Content-Disposition: inline


--ERsFtt+fCZMBvgkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got conflicts in:

  kernel/fork.c
  kernel/nsproxy.c

between commit:

  7c8a4671dc324 ("Merge tag 'vfs-7.1-rc1.mount.v2' of git://git.kernel.org/=
pub/scm/linux/kernel/git/vfs/vfs")

=66rom the origin tree and commit:

  8ee708daac8a2 ("Merge branch 'kernel-7.1.misc' into vfs.all")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined kernel/fork.c
index 8c61c8dd43720,17497679cec70..0000000000000
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@@ -2113,7 -2113,6 +2113,7 @@@ __latent_entropy struct task_struct *co
  	ftrace_graph_init_task(p);
 =20
  	rt_mutex_init_task(p);
 +	raw_spin_lock_init(&p->blocked_lock);
 =20
  	lockdep_assert_irqs_enabled();
  #ifdef CONFIG_PROVE_LOCKING
@@@ -2956,10 -2955,9 +2956,10 @@@ static inline bool clone3_stack_valid(s
  static bool clone3_args_valid(struct kernel_clone_args *kargs)
  {
  	/* Verify that no unknown flags are passed along. */
 -	if (kargs->flags & ~(CLONE_LEGACY_FLAGS | CLONE_CLEAR_SIGHAND |
 -			     CLONE_INTO_CGROUP | CLONE_AUTOREAP | CLONE_NNP |
 -			     CLONE_PIDFD_AUTOKILL | CLONE_EMPTY_MNTNS))
 +	if (kargs->flags &
 +	    ~(CLONE_LEGACY_FLAGS | CLONE_CLEAR_SIGHAND |
 +	      CLONE_INTO_CGROUP | CLONE_AUTOREAP | CLONE_NNP |
 +	      CLONE_PIDFD_AUTOKILL | CLONE_EMPTY_MNTNS))
  		return false;
 =20
  	/*
@@@ -3110,7 -3108,7 +3110,7 @@@ static int check_unshare_flags(unsigne
  {
  	if (unshare_flags & ~(CLONE_THREAD|CLONE_FS|CLONE_SIGHAND|
  				CLONE_VM|CLONE_FILES|CLONE_SYSVSEM|
 -				CLONE_NS_ALL|UNSHARE_EMPTY_MNTNS))
 +				CLONE_NS_ALL | UNSHARE_EMPTY_MNTNS))
  		return -EINVAL;
  	/*
  	 * Not implemented, but pretend it works if there is nothing
diff --combined kernel/nsproxy.c
index d9d3d5973bf52,71bf313087671..0000000000000
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@@ -215,7 -215,7 +215,7 @@@ int unshare_nsproxy_namespaces(unsigne
  	u64 flags =3D unshare_flags;
  	int err =3D 0;
 =20
- 	if (!(flags & (CLONE_NS_ALL & ~CLONE_NEWUSER)))
+ 	if (!(flags & (CLONE_NS_ALL & ~(CLONE_NEWUSER | UNSHARE_EMPTY_MNTNS))))
  		return 0;
 =20
  	user_ns =3D new_cred ? new_cred->user_ns : current_user_ns();

--ERsFtt+fCZMBvgkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnfa8IACgkQJNaLcl1U
h9BayAf/aRB3PTv+MoCuDMOykgmUUcAVADVD4O/n4cHfoewzD/h+ZKuBEeI5dATw
trnWYipRt9cfM9815DGMfN3oOWYPYWQrFquon90r98jhxGMB4PZRN7yngP4oGQ16
PS8/7rFO/gCB5SHFqQBSML44g1leHdXLT/ULLrlL4kpIweTKLfgrslgds+fQklPO
4pTeZK6krqVLp+vPsoZFZJIqr7zBwp4wdaQSdA/seHQke820dnmtCR5dajKIrPFF
S9OUbYQEZoVNqF2SsZSLmWXz6eZW10J0lJ3WHHDZPigzmfZ9jLa5/om/QrRy6goJ
+vNTuGc+5QI9Ko0SML7mNCYr2xBEIA==
=WLWb
-----END PGP SIGNATURE-----

--ERsFtt+fCZMBvgkM--
