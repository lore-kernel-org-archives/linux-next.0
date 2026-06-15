Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F406A3F8227;
	Mon, 15 Jun 2026 14:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534588; cv=none; b=tmJ6YO4E1/oSVfM1fnXfKrPEJLl1OdlVy3YExcK5nITYMbuQJ7nUcSQxnnPwHnvhltnxiw8ACMDD1KJL+LGXAmy0pqJltT0efqMrW4Ceaghuc78Xc0bdxUldnqUuJxCVReWm1YuHgyS/RwBSgAPW0s4VVcE7qx6tdZ4nJGszsbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534588; c=relaxed/simple;
	bh=rtIdOlIeG2tgQBqAvmFFUUSKFJ802KKaPEUU5tgr/IE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3AX/GI5nIR5RM2HSS2++p7ayON840YKLruX4f39qZNoO7TvZDGf+sdxobLUe+D84XIrDiDF1QWrzXo1agi7mjCaG03ni8P7xoC7uT2XRHAB6e5ki6APcu2qLM7Wjj5u+A0RUv4xHkgtgmUeM9WXv1DpItmMLeeR8UAflYP+bBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVYZ/WaD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVYZ/WaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A021F000E9;
	Mon, 15 Jun 2026 14:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781534586;
	bh=LafmbFlXIBPTR/4bzVRsEgdgM6EPQABwEZbU7q1DiFE=;
	h=Date:From:To:Cc:Subject;
	b=YVYZ/WaDh11MW9zOJYl/6CDiXJtGxyQU/2msTkUn0Ja4HFj0w/STEQvXMYzklq+Ia
	 qVSAp2QxuLgcr01zVRM+eLjs/v8T0bTcD/5K5m6YyUn1UfIOO19rx/shW58lCONskE
	 S4d+P9JvxCr1W+JIm2NW+begwB1xmA1YY7MjZIkynKntBTwNzgIc8dHV9ae/kjNyfz
	 tnvWXXfyWXXk+9IMU4HURiSse0LK1FzuZ8nxjwmRhPPFt1XkSlghN6rYHYpytFvo0j
	 tY01vNbgR5VC0F0kYcZhEt2iq/Q4Getekao0ssUhLolp4gSKsrA2MJ6Iyy+4ZvrpZ8
	 dbwPtXQYGJpZg==
Date: Mon, 15 Jun 2026 15:43:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <ajAPd2iyeaDRykNs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O8jfDp3wQracRQQc"
Content-Disposition: inline


--O8jfDp3wQracRQQc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_submit.c

between commit:

  347ccc0453fca ("drm/xe: fix job timeout recovery for unstarted jobs and k=
ernel queues")

=66rom the origin tree and commit:

  b1107d085e7e8 ("drm/xe: fix job timeout recovery for unstarted jobs and k=
ernel queues")
  a889e9b06bfdb ("drm/xe: wedge from the timeout handler only after releasi=
ng the queue")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_guc_submit.c
index 12a410458df6f,afe5d99cdd8bc..0000000000000
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@@ -1493,7 -1493,7 +1493,7 @@@ guc_exec_queue_timedout_job(struct drm_
  	struct xe_device *xe =3D guc_to_xe(guc);
  	int err =3D -ETIME;
  	pid_t pid =3D -1;
- 	bool wedged =3D false, skip_timeout_check;
+ 	bool wedged =3D false, wedge_device =3D false, skip_timeout_check;
 =20
  	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 =20
@@@ -1638,7 -1638,7 +1638,7 @@@ trigger_reset
  			}
  			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
  				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
- 				xe_device_declare_wedged(gt_to_xe(q->gt));
+ 				wedge_device =3D true;
  			}
  		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
  			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
@@@ -1658,6 -1658,9 +1658,9 @@@
  		xe_guc_exec_queue_trigger_cleanup(q);
  	}
 =20
+ 	if (wedge_device)
+ 		xe_device_declare_wedged(gt_to_xe(q->gt));
+=20
  	/*
  	 * We want the job added back to the pending list so it gets freed; this
  	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
@@@ -2241,14 -2244,6 +2244,6 @@@ static bool guc_exec_queue_reset_status
  	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
  }
 =20
- static bool guc_exec_queue_active(struct xe_exec_queue *q)
- {
- 	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
-=20
- 	return exec_queue_enabled(primary) &&
- 		!exec_queue_pending_disable(primary);
- }
-=20
  /*
   * All of these functions are an abstraction layer which other parts of X=
e can
   * use to trap into the GuC backend. All of these functions, aside from i=
nit,
@@@ -2268,7 -2263,6 +2263,6 @@@ static const struct xe_exec_queue_ops g
  	.suspend_wait =3D guc_exec_queue_suspend_wait,
  	.resume =3D guc_exec_queue_resume,
  	.reset_status =3D guc_exec_queue_reset_status,
- 	.active =3D guc_exec_queue_active,
  };
 =20
  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue =
*q)

--O8jfDp3wQracRQQc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowD3YACgkQJNaLcl1U
h9CGnQf/buu/0WQidXwN5KcJqxjXCasf62qhwq7wi7gf3cC/x61Fzx7FguS+Qw0j
CnuoC3bBbupAMQXQwuc0wjbv/h0UncE1XJUJea3pYhJvRwPgnbSmOCSIilrQnBOR
FDaMm0S3KEK6sKB6bOJOGfa1lo0jplFqo0HO/cNKVTUKIpb5Utqs1LmiP9KGXrQs
suiR3kKsk/dZ9DzvKUE15CvYYagwmqIzLLx6PqV0VVusA9pplAzeX+NS6wQ3ptmr
3M4fvPgM5JgtgbjpGnybfQyVbx1m2P1uevSJYRC8jErsTNq+7SX8Lwwg0YA/x+AK
cEjdEU434He12mgMApGrLOrYQq5E4w==
=a47d
-----END PGP SIGNATURE-----

--O8jfDp3wQracRQQc--
