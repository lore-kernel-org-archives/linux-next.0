Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8AA156661;
	Mon, 23 Feb 2026 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853698; cv=none; b=PuCChjkV8n1r3E92cbmIqww/xQ8Z4nktBWLBTYOcwg+nJRoLCI3gVPHd+tQBm5TYRVT3b8+md+GRgUVPzYM0Kf6z3P0MlJV/kblL1vLZvk4lZL//ljeA7c6xusyU/jDNxGSa3KHffTY2h2h1vxX4GytuHz6KC61R8c9GUJOG0ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853698; c=relaxed/simple;
	bh=G4fv3oqiIpZGsbhmrOEgxtUbmzhG1zxRuwGCElZSSoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bb6Jhdz+9qqllBocoShIuy4BnqZ0LcyzasxVWjYCfdhpGSlnB3LXrDfHzLfvmdmWn/Hr9U2XkJCuZ405PEjndhOrX4T43LteRymRZHUDVsDg4IwsdatNGx2eiwg6ljss64dqH87h48Nimsk8QzpDZpsaaAAunnHN+TUI+2edjDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcUiBrIh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcUiBrIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C36C116C6;
	Mon, 23 Feb 2026 13:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771853697;
	bh=G4fv3oqiIpZGsbhmrOEgxtUbmzhG1zxRuwGCElZSSoo=;
	h=Date:From:To:Cc:Subject:From;
	b=VcUiBrIhGVWcXCl0CC41RpL9wpqGHRoEGLzfC/vJR6eTOvkk7A/0g0NsZtnRprVDl
	 tOJvcEgnK1gxNuNwwYnGe5JxgXX4em4NzXcEJVO99HY/pwuNiRvsHi9al0gnrapvLf
	 ZoIpgPZqLoNPPZJ41a1ff4kbKmWdfaED8eD4aoDhtmQURP0OKoGWIoByNzfi8ikMii
	 SffwQjIsdEj/zmS8Wqym3gVmfwtrKZedT8IoXAniS9Nuvp9z6+tCluK0qtRkh80d+Y
	 paxiWD1tkQKkb5ep3zfkNT46MC8wWQdcR56M0OIE/6MIyZFqb7rFanV25S6vi7zHSU
	 EosRLHueOpgpg==
Date: Mon, 23 Feb 2026 13:34:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <aZxXfTCmjfTd-lUL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z73fIjOklE8xTSlG"
Content-Disposition: inline


--Z73fIjOklE8xTSlG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/drm_suballoc.c

between commit:

  69050f8d6d075 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar=
 types")

=66rom the origin tree and commit:

  16843e6638b74 ("drm/sa: Split drm_suballoc_new() into SA alloc and init h=
elpers")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/drm_suballoc.c
index e44ad39e310cd,dc9bef3c0419d..0000000000000
--- a/drivers/gpu/drm/drm_suballoc.c
+++ b/drivers/gpu/drm/drm_suballoc.c
@@@ -293,13 -293,37 +293,37 @@@ static bool drm_suballoc_next_hole(stru
  }
 =20
  /**
-  * drm_suballoc_new() - Make a suballocation.
+  * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
+  * @gfp: gfp flags used for memory allocation.
+  *
+  * Allocate memory for an uninitialized suballoc object. Intended usage is
+  * allocate memory for suballoc object outside of a reclaim tainted conte=
xt
+  * and then be initialized at a later time in a reclaim tainted context.
+  *
+  * @drm_suballoc_free() should be used to release the memory if returned
+  * suballoc object is in uninitialized state.
+  *
+  * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
+  */
+ struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
+ {
+ 	struct drm_suballoc *sa;
+=20
 -	sa =3D kmalloc(sizeof(*sa), gfp);
++	sa =3D kmalloc_obj(*sa, gfp);
+ 	if (!sa)
+ 		return ERR_PTR(-ENOMEM);
+=20
+ 	sa->manager =3D NULL;
+=20
+ 	return sa;
+ }
+ EXPORT_SYMBOL(drm_suballoc_alloc);
+=20
+ /**
+  * drm_suballoc_insert() - Initialize a suballocation and insert a hole.
   * @sa_manager: pointer to the sa_manager
+  * @sa: The struct drm_suballoc.
   * @size: number of bytes we want to suballocate.
-  * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
-  *       the argument is provided for suballocations from reclaim context=
 or
-  *       where the caller wants to avoid pipelining rather than wait for
-  *       reclaim.
   * @intr: Whether to perform waits interruptible. This should typically
   *        always be true, unless the caller needs to propagate a
   *        non-interruptible context from above layers.

--Z73fIjOklE8xTSlG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcV3wACgkQJNaLcl1U
h9DeGAf8DaNc9rGM/7tR9Zl8JDunw1txc54ITcHZm6LQ/Ma8wQ5C8XbD/hfJd5JX
zOjuYxoQ+Qc6mHoGw/IaiO+IzC8Nz5aTmCoAKyXtFJK/8Xa1sU4a/2GRvaKOzbNY
sEVef19Cn57OcojZ/odQs2iEbPVkBBapDsGTdcd2gpcuSqCNnC1PaVGYbijBck9S
P4ZaWbhrOnYnQbCSwEP+UL5gd/yOND8G65LRS+jSZrrUu4CBHwSjx8SlhvkSSCz/
Y17esPYdhy764cyArk7uULilJQ2zqkQQe2lKUGkl/7GYlTeZxjN5y1AyTkVRPvjR
+0lTWnpjCpUNFic4aAuhGxjA8t+zxw==
=eo9O
-----END PGP SIGNATURE-----

--Z73fIjOklE8xTSlG--
