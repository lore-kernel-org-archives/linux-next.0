Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2768B665;
	Sun,  8 Feb 2026 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770590813; cv=none; b=YLpBq7U/sK/TyqrbzJ4tKGSTYBUceXkGn6KzSdUlDWucnn/+VvrBEGTUu59mPQbRBB5IeVSvjT/qD84ZehlePOyiAuTTLVbMCyq26vtkSOopGen2WuLSdaEjZCaV5J983SltJmUIXaMmuQI/jLUWUjbEoe6TqS8e6DcNlzZweRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770590813; c=relaxed/simple;
	bh=hEzUixNjVVNaa3Bxv+XxJ+VxH06BOg0rYo4G6AVrlLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUpFoniR6Zrdn4XnOmvfwOLBwjd/vtiyqQYoQGVEYRfc3E54W4lMm4IlTGHDMuEhA5zT90ehucMqLmeHGZmlVvAXUTnC9heboNnp5WjcPBpYcrwgn4lpbr1Q9mAoPCA1ft3YLY7EcwZeTr896GgO6t4HdAyvP0nq7j7nhwR2b/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mz+zDOcx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mz+zDOcx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987C4C4CEF7;
	Sun,  8 Feb 2026 22:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770590813;
	bh=hEzUixNjVVNaa3Bxv+XxJ+VxH06BOg0rYo4G6AVrlLA=;
	h=Date:From:To:Cc:Subject:From;
	b=mz+zDOcxqewnhtiTyX911RPqDHx555kfBqnju6WLfG64Hxge/kJq+aZwdvMiDzr1Q
	 FslSqj4B80BLSqr41PgoxSvf9qgQuAK98roGE1VWOLiU1uvuxIB5ZrH3H+3p3e/k5n
	 1K4kuR3SgnmDEMvpXTTjBjf6zSn33HWCtxgrIEKNaGbITHk01uG7AxNu3cYVeVsjUJ
	 VesUndK6otkBjaQP60X4Oz6SQrkoNGXmdcUSP1pCyX0V4hdi0pTx1MUD5/XbnmqmkO
	 eW8ejU1xGzK/j9zzQGVHr1u30Ds7z0M2tfZQyj6/niAbMVP2VBpXUuq1lZVI3kmhsO
	 dmKArDU7ELYSw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 51EBF1AC57F1; Sun, 08 Feb 2026 22:46:50 +0000 (GMT)
Date: Sun, 8 Feb 2026 22:46:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
	Shuicheng Lin <shuicheng.lin@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aYkSWobP3JUatoHn@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B62MvGnV4Ep6+BKn"
Content-Disposition: inline


--B62MvGnV4Ep6+BKn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_migrate.c

between commit:

  e022c16965b834 ("drm/xe: Fix kerneldoc for xe_migrate_exec_queue")

=66rom the origin tree and commits:

  fa18290bf0723b ("drm/xe/vf: Shadow buffer management for CCS read/write o=
perations")
  5d5ef695497950 ("drm/xe: Fix kerneldoc for xe_migrate_exec_queue")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_migrate.c
index 9d7329cef910af,078a9bc2821dd6..00000000000000
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c

--B62MvGnV4Ep6+BKn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmJElkACgkQJNaLcl1U
h9C5MQf+IrUNqHN8u1iJNvgbL+Rmuk+uWKvtZkzWNqaBKGwomc9eAUJk7ocSV1cA
TuXps/mInmsctnzM89VN3+lLiwDiFg7Ps1TKF5bkcCvKn3WqrV8q0ZRWU9am4oGI
/fjLRIO163o/+BJDKXfYE+ifepdP10o9IGcOob4n0Hda2Im8+Y08xfXqVovPL99N
bngNPWxUc0nQzdgzgvYKAlZL21cQhSNrIePe95VMbpuqYbtjCL8EID5b6CyhiNIi
uB7Ghpz3US7BlCnjVZauHhSNM0uZk0kKQGvCVwaU3itrEfixHBxVH+lTsVVVU8rK
03tQXUgGJC6lHcVfD5CFv25m0U0bBQ==
=veOn
-----END PGP SIGNATURE-----

--B62MvGnV4Ep6+BKn--
