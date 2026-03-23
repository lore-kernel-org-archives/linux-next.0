Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61018271A6D;
	Mon, 23 Mar 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280961; cv=none; b=UY3QB4TIVfdjb1kHX7W6o6K4nvjXjfqdgHmuf90+rcSyH+AHvsfgwq+DvZ35XInp6YE+DVoXrpmVEsBsJNoYxF5ao23HL7ZM0h73rQl+9m6TqrkKYQ054ONz3yDOX7MCiLP36s6GRgF0/Q7OenySR8+Vd2b8Yv7w0jt+wPGtqnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280961; c=relaxed/simple;
	bh=lxS4nBMo8We4F74POduxni4DB+9Z0VFoL+7C3D1E5sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FZa36SX4vG+2hzmMTb7mXi3nAxhg/wCJMrsN+Zm/P17RfMRm8sUir1AnDmQ4ZTN7qXmIydV53ltDLvUorftvUkGnXpYL3kPg1RyHtzZCHc2SkVcsHDaeJdepnPkuJ1VzDO50x4PJPQfzX6PJmKUvgPxwEO52HKyuykBkQx3zbn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlaICk+L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlaICk+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F54C4CEF7;
	Mon, 23 Mar 2026 15:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774280961;
	bh=lxS4nBMo8We4F74POduxni4DB+9Z0VFoL+7C3D1E5sw=;
	h=Date:From:To:Cc:Subject:From;
	b=IlaICk+LhcgnkeK5vgnpeRFNmg8YAuxO2THBEO4qtShe+qoR7c0TLOKibTgwHe5OH
	 DyWo9C4bKLn2MSP43lku9Cq+NpGEjpOnwTN5zI1Dey+UwWrgZJVqDSUzIytvNTQXZj
	 /pXkk66G8ED0gNJdJI7oNI7GLaJ9nI9+GHsHJlNhsmMmkufEvWS00XXCxMIcygiLN4
	 sgAIh2X2KJnEdJgUWBvagyUyf0NLlIoOX0Kurw9uYRdYbotraorqwSDsG7U2DI/Wtn
	 DXgTWJthPD60DCcwvWs4XzQRJ3pPfmshBu5APO7OAJsL4abuFPPCR0tabXSSx4Qxaq
	 Gl3VnElSIzX3g==
Date: Mon, 23 Mar 2026 15:49:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <acFg_IktBmoIf1CV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IAfpwK6E9G4qaQbC"
Content-Disposition: inline


--IAfpwK6E9G4qaQbC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_ggtt_types.h

between commit:

  01f2557aa684e ("drm/xe: Open-code GGTT MMIO access protection")

=66rom the origin tree and commit:

  95f5f9a96dcfb ("drm/xe: Move struct xe_ggtt to xe_ggtt.c")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_ggtt_types.h
index c002857bb7611,cf754e4d502ad..0000000000000
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@@ -6,57 -6,12 +6,13 @@@
  #ifndef _XE_GGTT_TYPES_H_
  #define _XE_GGTT_TYPES_H_
 =20
+ #include <linux/types.h>
  #include <drm/drm_mm.h>
 =20
- #include "xe_pt_types.h"
-=20
- struct xe_bo;
+ struct xe_ggtt;
  struct xe_ggtt_node;
 +struct xe_gt;
 =20
- /**
-  * struct xe_ggtt - Main GGTT struct
-  *
-  * In general, each tile can contains its own Global Graphics Translation=
 Table
-  * (GGTT) instance.
-  */
- struct xe_ggtt {
- 	/** @tile: Back pointer to tile where this GGTT belongs */
- 	struct xe_tile *tile;
- 	/** @start: Start offset of GGTT */
- 	u64 start;
- 	/** @size: Total usable size of this GGTT */
- 	u64 size;
-=20
- #define XE_GGTT_FLAGS_64K       BIT(0)
- #define XE_GGTT_FLAGS_ONLINE	BIT(1)
- 	/**
- 	 * @flags: Flags for this GGTT
- 	 * Acceptable flags:
- 	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
- 	 * - %XE_GGTT_FLAGS_ONLINE - is GGTT online, protected by ggtt->lock
- 	 *   after init
- 	 */
- 	unsigned int flags;
- 	/** @scratch: Internal object allocation used as a scratch page */
- 	struct xe_bo *scratch;
- 	/** @lock: Mutex lock to protect GGTT data */
- 	struct mutex lock;
- 	/**
- 	 *  @gsm: The iomem pointer to the actual location of the translation
- 	 * table located in the GSM for easy PTE manipulation
- 	 */
- 	u64 __iomem *gsm;
- 	/** @pt_ops: Page Table operations per platform */
- 	const struct xe_ggtt_pt_ops *pt_ops;
- 	/** @mm: The memory manager used to manage individual GGTT allocations */
- 	struct drm_mm mm;
- 	/** @access_count: counts GGTT writes */
- 	unsigned int access_count;
- 	/** @wq: Dedicated unordered work queue to process node removals */
- 	struct workqueue_struct *wq;
- };
-=20
  typedef void (*xe_ggtt_set_pte_fn)(struct xe_ggtt *ggtt, u64 addr, u64 pt=
e);
  typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,
  				     struct xe_ggtt_node *node,

--IAfpwK6E9G4qaQbC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBYPsACgkQJNaLcl1U
h9BKDQf/QvCH+61bMR3hDTTDmSSXw8t2IJRlctlClnpZedMGPcP9Vt7jTPKMUDFI
QgM8vdxvcJIpZ4E77Ab7V3ZxozG9AbwDz+LXKWgTEAVqw67zb9dY89LbRsNt27hk
bHK3ADb04MMIRGh3VgYkFoM0ZanGGzDUTwTsDlcnB8jD4nWUmKRqLVx9AlxYrnzl
4GIefe45y3CPAfpiWm3hrfihKT54d7gDJSpHJNRNVsFBDhM+2Ep0K0Q4sGrmRLSd
xJ5sVGW2yoEAtLbARB/m8ndnu1xdWMaYgBvG2SOjM27VfTC7UXPNKNprilTj8QTA
2Uvzxm/QCQxEuaWwnfdfKcSFncdiEA==
=L4Jp
-----END PGP SIGNATURE-----

--IAfpwK6E9G4qaQbC--
