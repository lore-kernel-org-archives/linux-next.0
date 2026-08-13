Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7B46AF1B;
	Thu, 13 Aug 2026 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623222; cv=none; b=VnxvR+APn8XgSuKR/+daPOjlaJwhCFdHnSEJ4CmOkcCPqiMs/w5fgHgIpuy6U0BRjxci9M4T5IDrzh3wH4o82OMLcM16RyH1eiGSHAnrAx8mpRQaUImDJCGlIv6nC5Wb7wiwLEmGFLd6RNvyNpC+bKDnu0iorwIWRkn8pXSkPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623222; c=relaxed/simple;
	bh=2cZNLlQRoHb7OsRvBlDlc0fEOeozVJh4wQwuZnZmwaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XbeRyB06bcttOZhfDUnrdjhUiaA8tXxponmaQd2IR1ANOjIFhVNMXFR7dm97LzHhJ6JAHt8XPxcXl+/tTjRst0rwA+bRMKPOO9f4zQxbuLGUfWOG7oCEW5vYyrKyFdvx1fB0k32xlfrbmhPZ1MmNe4zr9HyLXP8M/atKLIfJYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amStIZZ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amStIZZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FFC1F000E9;
	Thu, 13 Aug 2026 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786623220;
	bh=6Q074hYF4xy09fhX5KSSJSCmYnBpxOBwijtHkbyrmQc=;
	h=Date:From:To:Cc:Subject;
	b=amStIZZ7l883s90K+wJVSCSXgFOeN+33tjVxBdCVkX3d2WP5IqDOAaN2ITUiHpOFW
	 w8N82Aw9MNcVrzUcwP/q1ymRuzfKOg4+yIK9j4u9V1uJ4HpbJ1oath62u8cGnNn1SH
	 tq5+swDlRb+ZcTvCqUqjNvMoiN4Z+mvy7SB6V6deZHXngqe6b9sETIQRdM8TfNeMwI
	 quxW4KFM4n1WvQQq39deE80QLCc0HjipyeFC7XdbZjxpV25gJpZBSRf/NUmJ2hq8J6
	 VnSuksyxLVCFYc8RrBovZEX3ot+f6HHeoNJtjRFyFf65qTNkk9UC8o5zo1eKiN1yWE
	 VhWeWWXfNmhJQ==
Date: Thu, 13 Aug 2026 13:13:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Andreas Gruenbacher <agruenba@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the gfs2 tree
Message-ID: <an208OpVMNEI2Zfo@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dt66ExFNl+dNUtKW"
Content-Disposition: inline


--Dt66ExFNl+dNUtKW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/gfs2/lock_dlm.c

between commit:

  657e5af4fe0b9 ("gfs2: harden gfs2_glock_hold")

=66rom the gfs2 tree and commit:

  91e27ed8a387c ("lockref: tidy up dead count handling")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/gfs2/lock_dlm.c
index babce07b84f19,cc901fb97da0c..0000000000000
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@@ -126,7 -126,7 +126,7 @@@ static void gdlm_ast(void *arg
  	clear_bit(GLF_BLOCKING, &gl->gl_flags);
 =20
  	/* If the glock is dead, we only react to a dlm_unlock() reply. */
- 	if (__lockref_is_dead(&gl->gl_lockref) &&
+ 	if (lockref_is_dead(&gl->gl_lockref) &&
  	    gl->gl_lksb.sb_status !=3D -DLM_EUNLOCK)
  		return;
 =20
@@@ -182,6 -182,9 +182,6 @@@ static void gdlm_bast(void *arg, int mo
  {
  	struct gfs2_glock *gl =3D arg;
 =20
 -	if (lockref_is_dead(&gl->gl_lockref))
 -		return;
 -
  	switch (mode) {
  	case DLM_LOCK_EX:
  		gfs2_glock_cb(gl, LM_ST_UNLOCKED);
@@@ -326,7 -329,7 +326,7 @@@ static void gdlm_put_lock(struct gfs2_g
  	uint32_t flags =3D 0;
  	int error;
 =20
- 	BUG_ON(!__lockref_is_dead(&gl->gl_lockref));
+ 	BUG_ON(!lockref_is_dead(&gl->gl_lockref));
 =20
  	if (test_bit(GLF_INITIAL, &gl->gl_flags)) {
  		gfs2_glock_free(gl);
@@@ -344,7 -347,7 +344,7 @@@
  	 * DLM_LOCK_PW mode, the lock value block (LVB) would be lost.
  	 */
 =20
 -	if (test_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags) &&
 +	if (test_bit(SDF_KILL, &sdp->sd_flags) &&
  	    (!gl->gl_lksb.sb_lvbptr || gl->gl_state !=3D LM_ST_EXCLUSIVE)) {
  		gfs2_glock_free_later(gl);
  		return;

--Dt66ExFNl+dNUtKW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp9tO8ACgkQJNaLcl1U
h9DoUgf/f/YI4vHhJytKgdMx2oFk13GIo7NAhXK3S4vy4odKh7vjgGZjMo8fB49q
jOqO8hT7Ynp+qeB/7kMYvqe4XhFaR4g8epJwwG3MkH78YFcR/mAqbbb1fGOYv736
YCi6LU2UHleBmjEM78Y9LC59SDJZ2smt8I6GT6obnN0c4nVaqOGKtwBfq4LeEodT
/h4juaqHKWpXXnbR9mMqHAAjQNO88Z+bMXUJwhnidtj4WbSHDcy8KOVGJpCGWjMg
8OVD+mPg2HnrLfkTHa2NNnapkZcnUSkAll6S50JM7MPiVYki+ftNp9iAW+qdW/xj
MB1OcqKXrMw4vYxfiZYUg3NYCXw6IA==
=uW1r
-----END PGP SIGNATURE-----

--Dt66ExFNl+dNUtKW--
