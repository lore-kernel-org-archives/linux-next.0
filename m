From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 30 Oct 2017 18:26:23 +0000
Message-ID: <20171030182622.tpparrqnltztesll@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lcpoegoltgydatpa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--lcpoegoltgydatpa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/scheduler/gpu_scheduler.c

between commit:

  c94501279bb191c ("Revert "drm/amdgpu: discard commands of killed processe=
s"")

=66rom Linus' tree (it even made it into -rc6 over a week ago!) and the
fixes it explicitly identifies from the drm tree. =20

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/scheduler/gpu_scheduler.c
index 38cea6fb25a8,e4d3b4ec4e92..000000000000
--- a/drivers/gpu/drm/amd/scheduler/gpu_scheduler.c
+++ b/drivers/gpu/drm/amd/scheduler/gpu_scheduler.c
@@@ -208,14 -209,34 +209,35 @@@ void amd_sched_entity_fini(struct amd_g
 =20
  	if (!amd_sched_entity_is_initialized(sched, entity))
  		return;
 +
  	/**
  	 * The client will not queue more IBs during this fini, consume existing
 -	 * queued IBs or discard them on SIGKILL
 +	 * queued IBs
  	*/
- 	wait_event(sched->job_scheduled, amd_sched_entity_is_idle(entity));
+ 	if ((current->flags & PF_SIGNALED) && current->exit_code =3D=3D SIGKILL)
+ 		r =3D -ERESTARTSYS;
+ 	else
+ 		r =3D wait_event_killable(sched->job_scheduled,
+ 					amd_sched_entity_is_idle(entity));
+ 	amd_sched_entity_set_rq(entity, NULL);
+ 	if (r) {
+ 		struct amd_sched_job *job;
+=20
+ 		/* Park the kernel for a moment to make sure it isn't processing
+ 		 * our enity.
+ 		 */
+ 		kthread_park(sched->thread);
+ 		kthread_unpark(sched->thread);
+ 		while (kfifo_out(&entity->job_queue, &job, sizeof(job))) {
+ 			struct amd_sched_fence *s_fence =3D job->s_fence;
+ 			amd_sched_fence_scheduled(s_fence);
+ 			dma_fence_set_error(&s_fence->finished, -ESRCH);
+ 			amd_sched_fence_finished(s_fence);
+ 			dma_fence_put(&s_fence->finished);
+ 			sched->ops->free_job(job);
+ 		}
 =20
- 	amd_sched_rq_remove_entity(rq, entity);
+ 	}
  	kfifo_free(&entity->job_queue);
  }
 =20

--lcpoegoltgydatpa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3bs4ACgkQJNaLcl1U
h9BkTgf9HBg5tNjHau1gHThOob75byZ3GWXJxMOV8nO6vilYlPFzDlavb8q66wFv
h1oalRQPtbQGx6IoZPv8q9pM/03+saZWjcDuDYBFmDjw1/whkdf5a2p6vJa1+dfc
LOXZjhylrrSWODqJ0om7Gh1rG/YhlzzuIC5DHR5PmCBpBlejxH3bqJBqIAn8fdTG
wBAgLanKsYipYw4IZmSvObbu8sTk7IebbbP345t0os5qrCMS+VI5Sug2D9j9wzKY
YDooogqcu1HuSpRgK0JA4lli5qXUiuLbkaCwqcHXk5V5iojB8lEWrrB4fZHZ6krk
anf5gJdG+SDl62+/gHmf0lkYSyhExg==
=aJiq
-----END PGP SIGNATURE-----

--lcpoegoltgydatpa--
