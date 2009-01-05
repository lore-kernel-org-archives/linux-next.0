From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Mon, 05 Jan 2009 11:46:30 -0800
Message-ID: <49626396.7080309@sgi.com>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901051727.11403.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.179.29]:40948 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753545AbZAETqe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 14:46:34 -0500
In-Reply-To: <200901051727.11403.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Christoph Lameter <cl@linux-foundation.org>, Jack Steiner <steiner@sgi.com>

Rusty Russell wrote:
> On Monday 05 January 2009 14:02:39 Stephen Rothwell wrote:
>> Hi Rusty,
>>
>> Today's linux-next merge of the rr tree got a conflict in kernel/module.c
>> between commit d3794979a8a80c222ce9d016a6dfc4bed36965d0 ("Zero based
>> percpu: infrastructure to rebase the per cpu area to zero") from the
>> tip-core tree and the cpualloc patches from the rr tree.
> 
> That's a sweet patch, but there are a few issues with it.  Main one is
> that noone sets CONFIG_HAVE_ZERO_BASED_PER_CPU yet.  Is there more sitting
> outside the tree, Mike?

I have not had a chance to look at the new patch.  The one that I was working
on had an issue with bootup on x86_64 with certain gcc versions and got dropped
at the last moment.  Missing merge windows for the NR_CPUS=4096 changes was far
more critical to SGI.

> 
> 1) Author is wrong.  This is Christoph's, not Mike's.

Yes, most of the core code was Christoph's.  This was before I learned about
the 'From:' line in the patch.  I added some of the code to make it actually
work. ;-)

> 2) module.c now includes asm/sections.h twice.
> 3) We do still need RELOC_HIDE: it's for the compiler, not us.  It
>    can otherwise make assumptions about pointers remaining within objects.
> 4) Defining SHIFT_PERCPU_PTR for UP, and DEFINE_PER_CPU_FIRST are currently
>    unnecessary.  I assume for future patches, but I want to see them!
> 
> Thanks,
> Rusty.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
