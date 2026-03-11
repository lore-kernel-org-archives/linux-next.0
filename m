Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE373DFC96;
	Wed, 11 Mar 2026 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231540; cv=none; b=O3qPKSlgDx8Q6jTskDVsrgapQi4B2qAqmoGdyyzBF93pQwBG2miiaAN5pkyp8XZ6eOadFoQt8YuUuaIkRQTb626pwT54zzehDV8gL4ObPtepFwM8hcP7dY0ze15VW9N7QmYjuQgxdPjJlHOBAQ0wrsW664geiOPp/yYL01noNOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231540; c=relaxed/simple;
	bh=JPy1P/nZjsTDepdMBvS4sgUwRld2mjU32vdkoNCV31k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nNhXFICLZs8R1mU4/NOjx5V/7///GTOuoMFUQDIjSu9emd6jSRZuprLjhnDpDyst6TWrWgZY21709kul+QOS1ApeCX2/m9+tR42OaLSCnKXN53h2Nn/oKdqvcQX+aseLbccj7bxBuRyCRusd3glgLAAnG185/IdL5cVy1SixWuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyJCsFyA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyJCsFyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD2CC4CEF7;
	Wed, 11 Mar 2026 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773231539;
	bh=JPy1P/nZjsTDepdMBvS4sgUwRld2mjU32vdkoNCV31k=;
	h=Date:From:To:Cc:Subject:From;
	b=PyJCsFyA7XA6Dde5mr4ouKu2viYihju/M07qxSGKS+ZvyfcCZA58w1WUgEZvC4IN/
	 uLqYPNUpeju8zz38ZqGeuz0Z22g0KonRYHGLITefqu9RvMp+2MmwsLk9J8mogTecUi
	 rDxGN/DKNiiTyKDYh2IpKbpV+HTpt+vQOXj+iCmrTcry7m1x5GpUSKtoDjvitWHDfV
	 4gKRN4FT69Y+MLXIuuSNRTjceL1+L1iKDa9XgBffBVwh1hwnDvtwrhGn6AHTSt84Dl
	 +x5xISwW2o8fA3Qp891RIUswdnSpu77rfEvFMttaK25ckCsTZ2Bw1D4rigcoEFX8rZ
	 xZjTNR/uCCiUg==
Date: Wed, 11 Mar 2026 12:18:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: manual merge of the drm-xe tree with the mm-hotfixes tree
Message-ID: <abFdr2hYWR-WSPvw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Na+vzgnSWw1C9h4"
Content-Disposition: inline


--6Na+vzgnSWw1C9h4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  include/linux/mmu_notifier.h

between commit:

  599b4e290c876 ("mm/mmu_notifier: clean up mmu_notifier.h kernel-doc")

=66rom the mm-hotfixes tree and commit:

  7aba71dbc4164 ("mm/mmu_notifier: Allow two-pass struct mmu_interval_notif=
iers")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/mmu_notifier.h
index 3705d350c8633,b60673a8e0bbb..0000000000000
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@@ -233,8 -233,33 +233,33 @@@ struct mmu_notifier=20
  	unsigned int users;
  };
 =20
+ /**
+  * struct mmu_interval_notifier_finish - mmu_interval_notifier two-pass a=
bstraction
+  * @link: Lockless list link for the notifiers pending pass list
+  * @notifier: The mmu_interval_notifier for which the finish pass is call=
ed.
+  *
+  * Allocate, typically using GFP_NOWAIT in the interval notifier's start =
pass.
+  * Note that with a large number of notifiers implementing two passes,
+  * allocation with GFP_NOWAIT will become increasingly likely to fail, so=
 consider
+  * implementing a small pool instead of using kmalloc() allocations.
+  *
+  * If the implementation needs to pass data between the start and the fin=
ish passes,
+  * the recommended way is to embed struct mmu_interval_notifier_finish in=
to a larger
+  * structure that also contains the data needed to be shared. Keep in min=
d that
+  * a notifier callback can be invoked in parallel, and each invocation ne=
eds its
+  * own struct mmu_interval_notifier_finish.
+  *
+  * If allocation fails, then the &mmu_interval_notifier_ops->invalidate_s=
tart op
+  * needs to implements the full notifier functionality. Please refer to i=
ts
+  * documentation.
+  */
+ struct mmu_interval_notifier_finish {
+ 	struct llist_node link;
+ 	struct mmu_interval_notifier *notifier;
+ };
+=20
  /**
 - * struct mmu_interval_notifier_ops
 + * struct mmu_interval_notifier_ops - callback for range notification
   * @invalidate: Upon return the caller must stop using any SPTEs within t=
his
   *              range. This function can sleep. Return false only if slee=
ping
   *              was required but mmu_notifier_range_blockable(range) is f=
alse.

--6Na+vzgnSWw1C9h4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxXa4ACgkQJNaLcl1U
h9DUfQf8DDF+368HcmXtWEmMP5aHhUZ+3DfCxbuzu/HH623OQmzEG0GmHprLBFqZ
OIbYMCpoDKYpZtUNjXhkpeeVTMS2+oWXLNg8YJG7Uwp/YoxksLYDIqRmIqzAUbvW
cA/e94BKG6va47hz8pAFEUbDQu5hU5UXlG3qCpb7WVP2dgWdTPOlaTj6L5uK+Fa8
gmiUkstU1cx5o2HOWyR3KZvqH8KU/350ygICENr7EHedHyX5MdgzvKMI9iG7Kmr6
AFSLOt25o79wP6SbdN+6najN272tTZU5EEUbaksiIoFch9TB2taPbHypThf7tfDk
AYNf6dp+Y2c57JXgpudJEC47eyEOqQ==
=LOXu
-----END PGP SIGNATURE-----

--6Na+vzgnSWw1C9h4--
