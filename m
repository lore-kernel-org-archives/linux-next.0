Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EAE8472;
	Mon,  6 Apr 2026 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775484343; cv=none; b=DUG+fSWrOManrWnWqKoegG4kq8dqBv3kbboVN1Kk81BPxziv16PrRzKxvQOW0oMS8W1aJw334ubneuOhjl1H/6cXn2FHLKcOz3Mys54fRLINhfeK0gBkFOj9y01dpTwht0RKX3RVzO69NK56L16Tjhq3yS/9RIqDn1IbeDt+4Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775484343; c=relaxed/simple;
	bh=m8M6HfqomcOnVcyEC3qf+a0hDBNNK7dOGROtCU5jmdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvAk6XzlHDGdh6LZoKLYRPnNgL2L1b2YNO57pdkH4K/2OoBpSUyDajYOvXXj+9nMlI5fLTzTOnq2kYrkfkqHW8sNoHSVOKWDDEvOKwH7awuIMVvGIhTMe4JRXTKcNpKF5dbY9Q+DIzVZpCPimLXj/QopO8fep8EPbrvFb/ZVuNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vd+U4F+P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vd+U4F+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3895FC4CEF7;
	Mon,  6 Apr 2026 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775484343;
	bh=m8M6HfqomcOnVcyEC3qf+a0hDBNNK7dOGROtCU5jmdc=;
	h=Date:From:To:Cc:Subject:From;
	b=Vd+U4F+PIH3WZxagoyE/u61kZ3JvrhAdsOiYDgCkLRS+9MOlPd550J8Uw8GaihvzA
	 oGapxjHeTQmtbp9GDjupCFO5EMEGOw0faL6/woznKdjOOIDpBrI1QK/wGhXJjMvMkn
	 VcDJBT3Ht53vhU8uTSaFwkloliPP0EK3cJ9Ui7RSDpLq8zYbe0fEd387nFqu/oCVp1
	 U9+5iks3UsCNyELrB9hWVpIy+SqWLDQTx3teDHhsyoBKY28sq9d0JpNXtvo49c76aG
	 nG7zEnaTw50nmzkIhxxXFElz/Atv5iLjtFziBO5tTOImYA1l3ik0OrVS+IFAL9rnuW
	 dyEVZrQxCK3qA==
Date: Mon, 6 Apr 2026 15:05:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Amir Goldstein <amir73il@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: linux-next: manual merge of the security tree with the vfs-brauner
 tree
Message-ID: <adO9szS5_I7TmAjz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GRQ03595chXysmwE"
Content-Disposition: inline


--GRQ03595chXysmwE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  fs/file_table.c

between commit:

  1f1651d6dc2ac ("fs: hide file and bfile caches behind runtime const machi=
nery")

=66rom the vfs-brauner tree and commit:

  fbec24706feb2 ("fs: prepare for adding LSM blob to backing_file")

=66rom the security tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/file_table.c
index c40ec1be28992,d19d879b6efc1..0000000000000
--- a/fs/file_table.c
+++ b/fs/file_table.c
@@@ -70,6 -69,25 +73,25 @@@ void backing_file_set_user_path(struct=20
  }
  EXPORT_SYMBOL_GPL(backing_file_set_user_path);
 =20
+ #ifdef CONFIG_SECURITY
+ void *backing_file_security(const struct file *f)
+ {
+ 	return backing_file(f)->security;
+ }
+=20
+ void backing_file_set_security(struct file *f, void *security)
+ {
+ 	backing_file(f)->security =3D security;
+ }
+ #endif /* CONFIG_SECURITY */
+=20
+ static inline void backing_file_free(struct backing_file *ff)
+ {
+ 	security_backing_file_free(&ff->file);
+ 	path_put(&ff->user_path);
 -	kmem_cache_free(bfilp_cachep, ff);
++	kmem_cache_free(bfilp_cache, ff);
+ }
+=20
  static inline void file_free(struct file *f)
  {
  	security_file_free(f);
@@@ -77,10 -95,9 +99,9 @@@
  		percpu_counter_dec(&nr_files);
  	put_cred(f->f_cred);
  	if (unlikely(f->f_mode & FMODE_BACKING)) {
- 		path_put(backing_file_user_path(f));
- 		kmem_cache_free(bfilp_cache, backing_file(f));
+ 		backing_file_free(backing_file(f));
  	} else {
 -		kmem_cache_free(filp_cachep, f);
 +		kmem_cache_free(filp_cache, f);
  	}
  }
 =20

--GRQ03595chXysmwE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTvbIACgkQJNaLcl1U
h9AZEgf+O+3Q918PhpUAgAU6EV+lYdcTPMdKqeAl5jUGQEWp2M7vFHFgu+dSiFJa
oU3CHKZIxm6iCk3zwNnQVI9DbMS3ahRgXTTySQ99qv1IQ73L71RvHMnK4RfcsLyF
WrjeJLQQ3SD4l5nzGT+cIpVO4cHqR6PZgbbx0uuTaC8vL9+YSoTx5vI8kwCjDv3V
VMiXm1IB5P92aUOHUvwlPO8fJDLsfJKhSOIanuN29yng94wgYO+TldtvW+r17Z3q
59sWH4h7yPA/+r3G/iE3A228p4/tgnNorRlv7+Z23FR0SnK7rrseCdXcMTOSwYsD
Mwt958RoGdZx9v8aVaD9ytnNU5zzoA==
=Pao5
-----END PGP SIGNATURE-----

--GRQ03595chXysmwE--
