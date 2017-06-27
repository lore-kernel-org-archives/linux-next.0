From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2017-06-23-15-03 uploaded
Date: Wed, 28 Jun 2017 07:56:42 +1000
Message-ID: <20170628075642.6b3934f0@canb.auug.org.au>
References: <594d905d.geNp0UO7DULvNDPS%akpm@linux-foundation.org>
	<CAC=cRTNJe5Bo-1E+3oJEbWM8Yt5SyZOhnUiC9U5OK0GWrp1E0g@mail.gmail.com>
	<c3caa911-6e40-42a8-da4d-45243fb7f4ad@suse.cz>
	<13ab3968-a7e4-add3-b050-438d462f7fc4@suse.cz>
	<CAKwiHFjfrWqa+0NhL1EHKJwmghrL52Xzn-tYJsOi1B41shCsTg@mail.gmail.com>
	<20170627134033.d6df2435117d52721d37a748@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20170627134033.d6df2435117d52721d37a748@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Vlastimil Babka <vbabka@suse.cz>, huang ying <huang.ying.caritas@gmail.com>, mm-commits@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Tue, 27 Jun 2017 13:40:33 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> oops, that was me manually fixing rejects - I missed a bit.
> 
> --- a/mm/page_alloc.c~mm-page_allocc-eliminate-unsigned-confusion-in-__rmqueue_fallback-fix
> +++ a/mm/page_alloc.c
> @@ -2212,7 +2212,7 @@ static bool unreserve_highatomic_pageblo
>   * condition simpler.
>   */
>  static inline bool
> -__rmqueue_fallback(struct zone *zone, unsigned int order, int start_migratetype)
> +__rmqueue_fallback(struct zone *zone, int order, int start_migratetype)
>  {
>  	struct free_area *area;
>  	int current_order;
> _
> 

I have pushed that into the original patch in linux-next for today.

-- 
Cheers,
Stephen Rothwell

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
