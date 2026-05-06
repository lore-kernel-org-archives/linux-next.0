Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28350287503;
	Wed,  6 May 2026 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061359; cv=none; b=MXBkRgEIufXl52daI5rBmC3Y0HNWg4Mb3JqBau7+CJcYxXhGSkesXp1qFWmojFldpqx8uc3jBVraNYRAK2qYRhYRd27/NIUdSTK/51mHPfXHxtkgFmuzNPW4YHy+9aONNoHW4xlqJenr2uACg7kEoKBBCuc4tE0JSDVR2Ml4Hqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061359; c=relaxed/simple;
	bh=KAK+Auw1mnvENRE8ConO2NgBLnORMQs1A4PSyHUOOf0=;
	h=Date:Message-ID:From:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject; b=XgU1zJJNNEE9l97g7jEyH3IYfjVrcn+vjDBGRpg8L/KNVBMlqzaFc0eKEkNCqgw1bQDfXTrfKt6LZu5eDJjLiAHMjWRuKGy7oj9QZfXylZ2bVZShRsr3OIn4Ktrt9DSIua1avO+mI72fP6VFzlpyT5K7zrcd3h6y53VbNHAKLZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfWmPyN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfWmPyN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BA3C2BCB8;
	Wed,  6 May 2026 09:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061357;
	bh=KAK+Auw1mnvENRE8ConO2NgBLnORMQs1A4PSyHUOOf0=;
	h=Date:From:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:From;
	b=FfWmPyN5l8cKWOp/xCFoWjHRXMVE8tUspwxfus9o7tESTkpdOig5g5IAcrPGOkE+7
	 iqRWDhTouxc5OVQAoRpw0Id93sjznVTrhIg+9swFd9DCtVFzfBCJsxmbsdqaiK1U3V
	 IT73KmXBcDIG7jz9Es2+X0JOPL5V6geGhjwPoOaRNlOKRtJws9R9csl2dwBEBdS5JF
	 GdLl4Y9ertXqHKlu0yQTZauLCXk/5JOYRzz+5sm20KcVICKzXBWQjC/9Nv7ACXjqeO
	 U99fDo7xazZncxr6SVfkewSuLJEN3cYxjAz/+f+JiC0QF6LgdNd5hztnYp0elmqAnO
	 JnUZo3GwmPrVQ==
Date: Wed, 06 May 2026 11:55:55 +0200
Message-ID: <f8ede562c8335f22073b4cc5535001d4@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Chenyu Chen <chen-yu.chen@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Ray Wu <ray.wu@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-next tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  5164f7e7ff8e ("drm: Rename struct drm_atomic_state to drm_atomic_commit")

from the drm-next tree and commit:

  3c108046e1d6 ("drm/amd/display: Add power module on Linux")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. It looks
like this is pretty much what's in the amdgpu tree, modulo some
whitespace changes. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cbfdcc65bf5d,246ee40e202a..ad56a409a88e
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -10479,8 -10582,104 +10582,104 @@@ static void dm_clear_writeback(struct a
  	dc_stream_remove_writeback(dm->dc, crtc_state->stream, 0);
  }
  
+ /**
+  * amdgpu_dm_mod_power_update_streams - update mod_power stream state on modeset
+  * @state: the drm atomic state
+  * @dm: the display manager to update mod_power on
+  *
+  * Notify mod_power of stream changes on modeset events, and disable PSR/Replay
+  * in preparation for hardware programming. See also
+  * amdgpu_dm_mod_power_setup_streams() for post-modeset mod_power setup.
+  */
+ static void amdgpu_dm_mod_power_update_streams(struct drm_atomic_state *state,
+ 					       struct amdgpu_display_manager *dm)
+ {
+ 	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
+ 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+ 	struct amdgpu_dm_connector *aconnector;
+ 	struct drm_crtc *crtc;
+ 	int i = 0;
+ 
+ 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+ 		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
+ 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+ 
+ 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
+ 			continue;
+ 
+ 		/*
+ 		 * Update mod_power on modeset event in preparation for hw
+ 		 * programming. Always use the old stream, since it would have
+ 		 * been previously added to mod_power. If old stream is null (on
+ 		 * crtc enable, for example), mod_power will no-op, which is the
+ 		 * desried behavior.
+ 		 */
+ 		if (old_crtc_state->active) {
+ 			scoped_guard(mutex, &dm->dc_lock) {
+ 				amdgpu_dm_psr_set_event(dm, dm_old_crtc_state->stream, true,
+ 					psr_event_hw_programming, true);
+ 				amdgpu_dm_replay_set_event(dm, dm_old_crtc_state->stream, true,
+ 					replay_event_hw_programming, true);
+ 			}
+ 		}
+ 
+ 		if (new_crtc_state->active) {
+ 			aconnector = (struct amdgpu_dm_connector *)
+ 				dm_new_crtc_state->stream->dm_stream_context;
+ 			if (old_crtc_state->active) {
+ 				mod_power_replace_stream(dm->power_module,
+ 					dm_old_crtc_state->stream,
+ 					dm_new_crtc_state->stream,
+ 					&aconnector->psr_caps);
+ 			} else {
+ 				mod_power_add_stream(dm->power_module,
+ 					dm_new_crtc_state->stream,
+ 					&aconnector->psr_caps);
+ 			}
+ 		} else if (old_crtc_state->active) {
+ 			mod_power_remove_stream(dm->power_module,
+ 				dm_old_crtc_state->stream);
+ 		}
+ 	}
+ }
+ 
+ /**
+  * amdgpu_dm_mod_power_setup_streams - setup mod_power stream state post modeset
+  * @state: the drm atomic state
+  * @dm: the display manager to update mod_power on
+  *
+  * Notify mod_power of mode_change. This needs to be done after dc_stream
+  * updates have been committed, and VRR parameters have been updated.
+  */
+ static void amdgpu_dm_mod_power_setup_streams(struct drm_atomic_state *state,
+ 					      struct amdgpu_display_manager *dm)
+ {
+ 	struct dm_crtc_state *dm_new_crtc_state;
+ 	struct drm_crtc_state *new_crtc_state;
+ 	struct amdgpu_crtc *acrtc;
+ 	struct drm_crtc *crtc;
+ 	int i = 0;
+ 
+ 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+ 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+ 		acrtc = to_amdgpu_crtc(crtc);
+ 
+ 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
+ 			continue;
+ 
+ 		if (new_crtc_state->active) {
+ 			amdgpu_dm_link_setup_replay(dm_new_crtc_state->stream,
+ 					&acrtc->dm_irq_params.vrr_params);
+ 			mod_power_notify_mode_change(dm->power_module,
+ 						dm_new_crtc_state->stream,
+ 						false);
+ 		}
+ 	}
+ 
+ }
+ 
 -static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
 -					struct dc_state *dc_state)
 +static void amdgpu_dm_commit_streams(struct drm_atomic_commit *state,
- 					struct dc_state *dc_state)
++				     struct dc_state *dc_state)
  {
  	struct drm_device *dev = state->dev;
  	struct amdgpu_device *adev = drm_to_adev(dev);
