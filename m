From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the tip tree with the drm tree
Date: Thu, 17 Mar 2016 10:00:56 +0100
Message-ID: <2913254.nLUtoX01AU@wuerfel>
References: <20160317130029.5569b2f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:62712 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932796AbcCQJC4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Mar 2016 05:02:56 -0400
In-Reply-To: <20160317130029.5569b2f4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>

On Thursday 17 March 2016 13:00:29 Stephen Rothwell wrote:
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 0f42b1a24446,7b82e57aa09c..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@@ -532,21 -516,9 +532,20 @@@ int amdgpu_ttm_tt_get_user_pages(struc
>         do {
>                 unsigned num_pages = ttm->num_pages - pinned;
>                 uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
>  -              struct page **pages = ttm->pages + pinned;
>  +              struct page **p = pages + pinned;
>  +              struct amdgpu_ttm_gup_task_list guptask;
>  +
>  +              guptask.task = current;
>  +              spin_lock(&gtt->guptasklock);
>  +              list_add(&guptask.list, &gtt->guptasks);
>  +              spin_unlock(&gtt->guptasklock);
>   
> -               r = get_user_pages(current, current->mm, userptr, num_pages,
> -                                  write, 0, p, NULL);
> +               r = get_user_pages(userptr, num_pages, write, 0, pages, NULL);
>  +
>  +              spin_lock(&gtt->guptasklock);
>  +              list_del(&guptask.list);
>  +              spin_unlock(&gtt->guptasklock);
>  +
>                 if (r < 0)
>                         goto release_pages;

Your merge looks incorrect to me, and I got a build warning for it:

drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_ttm_tt_get_user_pages':
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:535:17: error: unused variable 'p' [-Werror=unused-variable]

I think the one-line change below is what is needed here, but it's probably
best for amdgpu maintainers to take a closer look.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

index 8b9b245fd0c8..ab34190859a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -540,7 +540,7 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, struct page **pages)
 		list_add(&guptask.list, &gtt->guptasks);
 		spin_unlock(&gtt->guptasklock);
 
-		r = get_user_pages(userptr, num_pages, write, 0, pages, NULL);
+		r = get_user_pages(userptr, num_pages, write, 0, p, NULL);
 
 		spin_lock(&gtt->guptasklock);
 		list_del(&guptask.list);
