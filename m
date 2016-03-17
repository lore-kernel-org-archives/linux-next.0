From: Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the drm tree
Date: Thu, 17 Mar 2016 09:52:40 -0700
Message-ID: <56EAE0D8.8030501@linux.intel.com>
References: <20160317130029.5569b2f4@canb.auug.org.au>
 <2913254.nLUtoX01AU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:7011 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1031244AbcCQQwl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Mar 2016 12:52:41 -0400
In-Reply-To: <2913254.nLUtoX01AU@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>

On 03/17/2016 02:00 AM, Arnd Bergmann wrote:
> On Thursday 17 March 2016 13:00:29 Stephen Rothwell wrote:
>> > -               r = get_user_pages(current, current->mm, userptr, num_pages,
>> > -                                  write, 0, p, NULL);
>> > +               r = get_user_pages(userptr, num_pages, write, 0, pages, NULL);
>> >  +
>> >  +              spin_lock(&gtt->guptasklock);
>> >  +              list_del(&guptask.list);
>> >  +              spin_unlock(&gtt->guptasklock);
>> >  +
>> >                 if (r < 0)
>> >                         goto release_pages;
...
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

Yeah, Arnd's fix looks correct to me.  The loop variable "pages" got
renamed to "p" and another variable "pages" is now being passed into the
function.

The get_user_pages() call should be against 'p', the loop variable.

Also, this is obvious if you consider that the pkeys patch was always
just removing the first two arguments.  We can see in Stephen's patch
above that it both removes those arguments *and* replaces 'p' with 'pages'.
