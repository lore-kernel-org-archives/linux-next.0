From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 21 Sep 2016 12:02:26 +1000
Message-ID: <20160921120226.5466c5b2@canb.auug.org.au>
References: <20160920164414.4062bb0b@canb.auug.org.au>
        <20160920173012.1abe1d84@canb.auug.org.au>
        <87mvj2srvj.fsf@concordia.ellerman.id.au>
        <20160921091622.53067648@canb.auug.org.au>
        <87bmzirta5.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42576 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753745AbcIUCDK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Sep 2016 22:03:10 -0400
In-Reply-To: <87bmzirta5.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, bauerman@linux.vnet.ibm.com

Hi Michael,

On Wed, 21 Sep 2016 10:27:46 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > On Tue, 20 Sep 2016 22:00:32 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:  
> >>
> >> Ah yep looks like that's the problem, patch below should fix it?  
> >
> > Yeah, I am just going to (logically) run "sed 's/CONFIG_WORD_SIZE/BITS/'"
> > over the tree during the merge of the apm-current tree today.
> >  
> >> I think I'd actually prefer it if purgatory didn't redefine the CFLAGS
> >> from scratch, so I'll see if Thiago can do that and send a new version.  
> >
> > That could be better, but there are still some additions of
> > CONFIG_WORD_SIZE elsewhere :-(  
> 
> I don't see any others in yesterday's next?

I fixed the other one I found as it caused a build failure as well but
was more obvious (and I had had time to think about what was happening).

-- 
Cheers,
Stephen Rothwell
