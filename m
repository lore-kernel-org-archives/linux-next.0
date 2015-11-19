From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Thu, 19 Nov 2015 10:53:20 -0500
Message-ID: <CAHC9VhS3VGaAn34dM6pJ5KGM=jZ9bdyA71xMjD_t--YsPXF8pw@mail.gmail.com>
References: <20151119120615.13b6ce0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151119120615.13b6ce0b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>, Andrew Morton <akpm@linux-foundation.org>, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On Wed, Nov 18, 2015 at 8:06 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> Today's linux-next merge of the audit tree got a conflict in:
>
>   kernel/audit.c
>
> between commit:
>
>   d0164adc89f6 ("mm, page_alloc: distinguish between being unable to sleep, unwilling to sleep and avoiding waking kswapd")
>
> from Linus' tree and commit:
>
>   14eeba1d242e ("audit: include auditd's threads in audit_log_start() wait exception")
>
> from the audit tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen, I found the same thing yesterday while doing some
testing; your patch looks good to me.

> diff --cc kernel/audit.c
> index bc2ff61bc1d6,ca1b9cda2766..000000000000
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@@ -1371,9 -1371,9 +1371,9 @@@ struct audit_buffer *audit_log_start(st
>         if (unlikely(audit_filter_type(type)))
>                 return NULL;
>
>  -      if (gfp_mask & __GFP_WAIT) {
>  +      if (gfp_mask & __GFP_DIRECT_RECLAIM) {
> -               if (audit_pid && audit_pid == current->pid)
> +               if (audit_pid && audit_pid == current->tgid)
>  -                      gfp_mask &= ~__GFP_WAIT;
>  +                      gfp_mask &= ~__GFP_DIRECT_RECLAIM;
>                 else
>                         reserve = 0;
>         }



-- 
paul moore
www.paul-moore.com
