From: Jani Nikula <jani.nikula@intel.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Date: Fri, 05 Jun 2015 11:03:20 +0300
Message-ID: <87sia6a8fr.fsf@intel.com>
References: <20150605054634.E4FA3140218@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:37282 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753333AbbFEIBF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jun 2015 04:01:05 -0400
In-Reply-To: <20150605054634.E4FA3140218@ozlabs.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "mpe@ellerman.id.au" <michael@ozlabs.org>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Hoath <nicholas.hoath@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Damien Lespiau <damien.lespiau@intel.com>

On Fri, 05 Jun 2015, "mpe@ellerman.id.au" <michael@ozlabs.org> wrote:
> Hi Dave,
>
> Today's linux-next merge of the drm tree got a conflict in
> drivers/gpu/drm/i915/intel_ringbuffer.c between commit 4f47c99a9be7 ("drm/i915:
> Move WaBarrierPerformanceFixDisable:skl to skl code from chv code") from the
> drm-intel-fixes tree and commit b62adbd1ea1f ("drm/i915/bxt: Move
> WaForceEnableNonCoherent to Skylake only") from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Our tree seems to have the if blocks the other way round. I don't think
it matters, but Ville, Damien, chime in if you think it does.

BR
Jani.

>
> cheers
>
> diff --cc drivers/gpu/drm/i915/intel_ringbuffer.c
> index 005b5e04de4d,d934f857394d..000000000000
> --- a/drivers/gpu/drm/i915/intel_ringbuffer.c
> +++ b/drivers/gpu/drm/i915/intel_ringbuffer.c
> @@@ -1017,13 -1030,17 +1023,24 @@@ static int skl_init_workarounds(struct 
>   		WA_SET_BIT_MASKED(HIZ_CHICKEN,
>   				  BDW_HIZ_POWER_COMPILER_CLOCK_GATING_DISABLE);
>   
>  +	if (INTEL_REVID(dev) == SKL_REVID_C0 ||
>  +	    INTEL_REVID(dev) == SKL_REVID_D0)
>  +		/* WaBarrierPerformanceFixDisable:skl */
>  +		WA_SET_BIT_MASKED(HDC_CHICKEN0,
>  +				  HDC_FENCE_DEST_SLM_DISABLE |
>  +				  HDC_BARRIER_PERFORMANCE_DISABLE);
>  +
> + 	if (INTEL_REVID(dev) <= SKL_REVID_D0) {
> + 		/*
> + 		 *Use Force Non-Coherent whenever executing a 3D context. This
> + 		 * is a workaround for a possible hang in the unlikely event
> + 		 * a TLB invalidation occurs during a PSD flush.
> + 		 */
> + 		/* WaForceEnableNonCoherent:skl */
> + 		WA_SET_BIT_MASKED(HDC_CHICKEN0,
> + 				  HDC_FORCE_NON_COHERENT);
> + 	}
> + 
>   	return skl_tune_iz_hashing(ring);
>   }
>   

-- 
Jani Nikula, Intel Open Source Technology Center
