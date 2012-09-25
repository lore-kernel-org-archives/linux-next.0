From: David Rientjes <rientjes@google.com>
Subject: Re: mmotm 2012-09-20-17-25 uploaded (fs/bimfmt_elf on uml)
Date: Tue, 25 Sep 2012 16:28:14 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1209251627220.6503@chino.kir.corp.google.com>
References: <20120921002638.7859F100047@wpzn3.hot.corp.google.com> <505C865D.5090802@xenotime.net> <20120922115606.5ca9f599cd88514ddda4831d@canb.auug.org.au> <alpine.DEB.2.00.1209251243320.31518@chino.kir.corp.google.com>
 <20120926074827.32c7187adef6327c74c75564@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20120926074827.32c7187adef6327c74c75564@canb.auug.org.au>
Sender: owner-linux-mm@kvack.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@xenotime.net>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org

On Wed, 26 Sep 2012, Stephen Rothwell wrote:

> > This still happens on x86_64 for linux-next as of today's tree.
> 
> Are you sure?  next-20120925?
> 
> $ grep -n vmalloc fs/binfmt_elf.c
> 30:#include <linux/vmalloc.h>
> 1421:	data = vmalloc(size);
> 

Ok, it looks like it's fixed by 1bb6a4c9514e in today's linux-next tree; 
that wasn't present when I pulled it at 2am PDT, so it must be a time zone 
difference.  Thanks.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
