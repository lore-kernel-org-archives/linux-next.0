From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Mon, 5 Jan 2009 17:27:10 +1030
Message-ID: <200901051727.11403.rusty@rustcorp.com.au>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:38342 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751179AbZAEG5R (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 01:57:17 -0500
In-Reply-To: <20090105143239.08b1a060.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Christoph Lameter <cl@linux-foundation.org>

On Monday 05 January 2009 14:02:39 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in kernel/module.c
> between commit d3794979a8a80c222ce9d016a6dfc4bed36965d0 ("Zero based
> percpu: infrastructure to rebase the per cpu area to zero") from the
> tip-core tree and the cpualloc patches from the rr tree.

That's a sweet patch, but there are a few issues with it.  Main one is
that noone sets CONFIG_HAVE_ZERO_BASED_PER_CPU yet.  Is there more sitting
outside the tree, Mike?

1) Author is wrong.  This is Christoph's, not Mike's.
2) module.c now includes asm/sections.h twice.
3) We do still need RELOC_HIDE: it's for the compiler, not us.  It
   can otherwise make assumptions about pointers remaining within objects.
4) Defining SHIFT_PERCPU_PTR for UP, and DEFINE_PER_CPU_FIRST are currently
   unnecessary.  I assume for future patches, but I want to see them!

Thanks,
Rusty.
