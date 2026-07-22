Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8224749F6;
	Wed, 22 Jul 2026 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735944; cv=none; b=Yt9TLvo7eUGHjmWHlzhfVXH9eALtICUvDkLsSNasNLEKWC0RhLh5DyRjmg1VOYZtrEtXXNr9s8GH6iMJkrhdl71qbzBLk5dVcko6fh4RI564POr/+mi+xXF3Qx5vCrFKCci/irdIjcE0Ql22h+zhK4kBrbcjOlzLpMeMYdfp/t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735944; c=relaxed/simple;
	bh=3iw6ylLdlRzB03PkfBQDk3BOPq7sh6SGBQtjFEpDqfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jfdo94XdkJ1kSBaVAZQIAzvj8YXLhGtPmOLTLj9M/SxO1fOaBTOBtjoYjXoMSbqPlHrWW1FXhc3rQdry6zBRuZRU3s6SM2CV6ZMCoUoeaRT01iuvyzhv1WllBNC74cIo0zuOtsYL9vpyIr1tJjO9vFvkfjQ9pMEwrVGR6/aLf8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIyEu7Gu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIyEu7Gu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357081F000E9;
	Wed, 22 Jul 2026 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735942;
	bh=B29T2zqBY3Fjz4nTdto96+V4TQjVKXqDlTKOZWQWSbU=;
	h=Date:From:To:Cc:Subject;
	b=QIyEu7GugOaVxc6iO0takx6K034+jP2QvvvryDHIWvH9RRSxtsZfgLN9U5TaDs/Y3
	 zcENMABwEmmAWL54JM/PNaYXmA56JVnYvN7/lrw6tm4pTSpOLU8zMH+6MNJnN9/LTk
	 C+yFs/lnaFUbcJc7YuOJ7Pavq6jnEGLgpYPxUeYQqT7LwJUIcfIhINS4S9wCP5PYH0
	 8wkwPVMNs0KgssY3cRLDa/FWhRDjcz/QcKGs09vID3OZHJ8XzPd1t09p0FbGHtPtQJ
	 QkNxrxevmIUTu4HCHfD5V66nB2JtYYt8i+bnhr25YgMLMM/w4lg7oCR4TFo/ptoAfs
	 DgdZaCsFD2geg==
Date: Wed, 22 Jul 2026 16:58:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <amDowq64C91cU5QD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Eos0PlyncBeeehI8"
Content-Disposition: inline


--Eos0PlyncBeeehI8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c

between commit:

  56441f9e08ad6 ("drm/xe/vf: Fix VF CCS attach/detach race with in-flight B=
O moves")

=66rom the origin tree and commit:

  d45ad0aa7a1eb ("drm/xe/vf: Fix VF CCS attach/detach race with in-flight B=
O moves")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 6787564629c65,a8c831fbee3b5..0000000000000
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@@ -3,6 -3,8 +3,8 @@@
   * Copyright =A9 2025 Intel Corporation
   */
 =20
+ #include <drm/drm_drv.h>
+=20
  #include "instructions/xe_mi_commands.h"
  #include "instructions/xe_gpu_commands.h"
  #include "xe_bb.h"
@@@ -446,7 -448,7 +448,7 @@@ err_unwind
  	 */
  	for_each_ccs_rw_ctx(ctx_id) {
  		if (bo->bb_ccs[ctx_id])
- 			xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
+ 			xe_migrate_ccs_rw_copy_clear(bo, ctx_id, true);
  	}
  	return err;
  }
@@@ -466,19 -468,27 +468,27 @@@ int xe_sriov_vf_ccs_detach_bo(struct xe
  	struct xe_device *xe =3D xe_bo_device(bo);
  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
  	struct xe_mem_pool_node *bb;
+ 	bool bound;
+ 	int idx;
 =20
  	xe_assert(xe, IS_VF_CCS_READY(xe));
 =20
  	if (!xe_bo_has_valid_ccs_bb(bo))
  		return 0;
 =20
+ 	bound =3D drm_dev_enter(&xe->drm, &idx);
+=20
  	for_each_ccs_rw_ctx(ctx_id) {
  		bb =3D bo->bb_ccs[ctx_id];
  		if (!bb)
  			continue;
 =20
- 		xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
+ 		xe_migrate_ccs_rw_copy_clear(bo, ctx_id, bound);
  	}
+=20
+ 	if (bound)
+ 		drm_dev_exit(idx);
+=20
  	return 0;
  }
 =20

--Eos0PlyncBeeehI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpg6MEACgkQJNaLcl1U
h9BEgwf9G89kjG0iOKyfZOZZhyofxrlVXgkmtLjZvsbxG24Mme1Y0QevFW/Tb+It
m6WMj8dtIeQPYpld8A32RrJirZZlFdfI5fM9i5iYl0NufHy+2CJ1Hmnxxj+xeVq+
znTfcFutOkv/coitisvonub08YzludvY9rJI9jrTcEqb44HgKqQwtXQEWM8+6Euj
zeP/Q8I5bu++sY/yMSZy3Bom3MjPFftk2mwc4bhu9fCtjs53TpjcPv8igsuNQAu0
5G9czs0eHHC3ru5Cg60i6HMgyh8sCeX8m3VwJgLpO5ZziwaqUxs82CrLlI6NMBAv
mfVdbfRzk7+H6iaJe8g/euhaqCDvkQ==
=6ISS
-----END PGP SIGNATURE-----

--Eos0PlyncBeeehI8--
