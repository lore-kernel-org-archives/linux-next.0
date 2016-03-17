From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the drm tree
Date: Thu, 17 Mar 2016 20:39:09 +1100
Message-ID: <20160317203909.54f020e3@canb.auug.org.au>
References: <20160317130029.5569b2f4@canb.auug.org.au>
	<2913254.nLUtoX01AU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56754 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932832AbcCQJjM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Mar 2016 05:39:12 -0400
In-Reply-To: <2913254.nLUtoX01AU@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>

Hi Arnd,

On Thu, 17 Mar 2016 10:00:56 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
>
> Your merge looks incorrect to me, and I got a build warning for it:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_ttm_tt_get_user_pages':
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:535:17: error: unused variable 'p' [-Werror=unused-variable]
> 
> I think the one-line change below is what is needed here, but it's probably
> best for amdgpu maintainers to take a closer look.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> index 8b9b245fd0c8..ab34190859a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -540,7 +540,7 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct page **pages)
>  		list_add(&guptask.list, &gtt->guptasks);
>  		spin_unlock(&gtt->guptasklock);
>  
> -		r = get_user_pages(userptr, num_pages, write, 0, pages, NULL);
> +		r = get_user_pages(userptr, num_pages, write, 0, p, NULL);
>  
>  		spin_lock(&gtt->guptasklock);
>  		list_del(&guptask.list);
> 

Ah, there was another commit to this area (I stopped looking to soon):

  2f568dbd6b94 ("drm/amdgpu: move get_user_pages out of amdgpu_ttm_tt_pin_userptr v6")

Your resolution certainly looks better.  I'll do that tomorrow.

-- 
Cheers,
Stephen Rothwell
