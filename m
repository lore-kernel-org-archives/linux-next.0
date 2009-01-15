From: Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>
Subject: Re: linux-next: manual merge of the kmemleak tree
Date: Thu, 15 Jan 2009 12:29:51 +0200
Message-ID: <20090115102950.GA5201@localhost>
References: <20090115162717.de2b3a3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.26]:13427 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753154AbZAOK31 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Jan 2009 05:29:27 -0500
Received: by ey-out-2122.google.com with SMTP id 22so189440eye.37
        for <linux-next@vger.kernel.org>; Thu, 15 Jan 2009 02:29:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20090115162717.de2b3a3c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>

On Thu, Jan 15, 2009 at 04:27:17PM +1100, Stephen Rothwell wrote:
> Hi Catalin,
> 
> Today's linux-next merge of the kmemleak tree got a conflict in mm/slob.c
> between commit 3eae2cb24a96509e0a38cc48dc1538a2826f4e33 ("kmemtrace: SLOB
> hooks") from the ftrace tree and commit
> 19f8f253a808d317d34ccbbad3b15a1a8d2ac444 ("kmemleak: Add the slob memory
> allocation/freeing hooks") from the kmemleak tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --cc mm/slob.c
> index 4d1c0fc,30b870f..0000000
> --- a/mm/slob.c
> +++ b/mm/slob.c
> @@@ -489,12 -482,9 +490,13 @@@ void *__kmalloc_node(size_t size, gfp_
>   			page = virt_to_page(ret);
>   			page->private = size;
>   		}
>  +
>  +		kmemtrace_mark_alloc_node(KMEMTRACE_TYPE_KMALLOC,
>  +					  _RET_IP_, ret,
>  +					  size, PAGE_SIZE << order, gfp, node);
>   	}
>   
> + 	kmemleak_alloc(ret, size, 1, gfp);
>   	return ret;
>   }
>   EXPORT_SYMBOL(__kmalloc_node);

Hi,

Perhaps kmemleak could attach to the kmemtrace traces. I'm currently
working on moving kmemtrace w/ ftrace to tracepoints instead of markers,
it'll hit the list soon. We'll use generic names for tracepoints, like
trace_kmalloc_node(). If this sounds okay, tell me and I'll relocate the
tracepoints definitions to a slab heades. All you'll need to do is
attach to probes using register_trace_*(), same as kmemtrace does.


	Cheers,
	Eduard
