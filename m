From: David Rientjes <rientjes@google.com>
Subject: Re: mmotm 2012-09-20-17-25 uploaded (fs/bimfmt_elf on uml)
Date: Tue, 25 Sep 2012 12:43:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1209251243320.31518@chino.kir.corp.google.com>
References: <20120921002638.7859F100047@wpzn3.hot.corp.google.com> <505C865D.5090802@xenotime.net> <20120922115606.5ca9f599cd88514ddda4831d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41926 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754184Ab2IYTnz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 15:43:55 -0400
Received: by pbbrr4 with SMTP id rr4so638690pbb.19
        for <linux-next@vger.kernel.org>; Tue, 25 Sep 2012 12:43:55 -0700 (PDT)
In-Reply-To: <20120922115606.5ca9f599cd88514ddda4831d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@xenotime.net>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Richard Weinberger <richard@nod.at>

On Sat, 22 Sep 2012, Stephen Rothwell wrote:

> > on uml for x86_64 defconfig:
> > 
> > fs/binfmt_elf.c: In function 'fill_files_note':
> > fs/binfmt_elf.c:1419:2: error: implicit declaration of function 'vmalloc'
> > fs/binfmt_elf.c:1419:7: warning: assignment makes pointer from integer without a cast
> > fs/binfmt_elf.c:1437:5: error: implicit declaration of function 'vfree'
> 
> reported in linux-next (offending patch reverted for other
> problems).
> 

This still happens on x86_64 for linux-next as of today's tree.
