From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 30 Oct 2008 09:42:05 +1100
Message-ID: <200810300942.05493.rusty@rustcorp.com.au>
References: <20081029152849.3883d072.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:53978 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754668AbYJ2WmJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 18:42:09 -0400
In-Reply-To: <20081029152849.3883d072.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

On Wednesday 29 October 2008 15:28:49 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next merge of the rr tree got quite a few conflicts - too
> many for me to fix up right now.  I shall drop it for today and try again
> tomorrow.
>
> One thing:  You need to sort out where patches belong as at least one
> change that conflicted was because different versions of the same fix was
> applied to the rr and cpus4096 trees.

We were hoping Linus would take the cpumask API patches this time around so 
this issue would vanish.  I've moved them out of my -next tree for the 
moment.

After that, it's a matter of pushing conversion patches through misc. 
maintainers over the next cycle.

Thanks,
Rusty.
