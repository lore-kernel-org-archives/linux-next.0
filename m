From: Xi Ruoyao <xry111@outlook.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Date: Mon, 16 Mar 2015 21:43:31 +0800
Message-ID: <BLU437-SMTP229FA75B0BDC81D45AB16A9E020@phx.gbl>
References: <20150316133049.39f516f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from blu004-omc3s8.hotmail.com ([65.55.116.83]:64338 "EHLO
	BLU004-OMC3S8.hotmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753874AbbCPNoR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2015 09:44:17 -0400
In-Reply-To: <20150316133049.39f516f2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Damien Lespiau <damien.lespiau@intel.com>


On 03/16/2015 at 10:30 AM, Stephen Rothwell wrote:
> Hi Dave,
>
> Today's linux-next merge of the drm tree got a conflict in
> drivers/gpu/drm/i915/intel_display.c between commit 2dccc9898d45
> ("drm/i915: Ensure plane->state->fb stays in sync with plane->fb") from
> the drm-intel-fixes tree and commit afd65eb4cc05 ("drm/i915: Ensure
> plane->state->fb stays in sync with plane->fb"), f55548b5af87
> ("drm/i915: Don't try to reference the fb in
> get_initial_plane_config()") and presumably others from the drm tree.
>
> Same patch summary, different authors, committers and added function.
>
> I fixed it up (I effectively used the drm tree version) and can carry
> the fix as necessary (no action is required).
>
My patch with commit 2dccc9898d45 is for Linux 4.0-rcN. It has no 
relationship
  with linux-next since Matt Roper's afd65eb4cc05 has solved this long 
long ago.

So, 2dccc9898d45 should not be tagged with for-linux-next-fixes (in 
repository
http://cgit.freedesktop.org/drm-intel/). I think it caused the mess of 
version
control.

BTW, there is still one thing should be done in linux-next. We should 
change
Matt's update_state_fb to use drm_atomic_set_fb_for_plane since the logic of
Matt's code is duplicated with drm_atomic_set_fb_for_plane.

-- 
Xi Ruoyao
School of Aerospace Science and Technology
Xidian University, Xi'an, China
