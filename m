From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (sparc, ptrace trees related)
Date: Fri, 14 Oct 2011 03:54:59 -0400 (EDT)
Message-ID: <20111014.035459.2238341687770152474.davem@davemloft.net>
References: <20111014180714.e11e15fd35dfaca839c6421e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111014180714.e11e15fd35dfaca839c6421e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, matt.fleming@intel.com, tj@kernel.org, oleg@redhat.com
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 14 Oct 2011 18:07:14 +1100

> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> arch/sparc/kernel/signal_64.c: In function 'handle_signal':
> arch/sparc/kernel/signal_64.c:482:11: error: unused variable 'blocked' [-Werror=unused-variable]
> 
> Caused by my merge of commits faddf598f0ba ("sparc: Use
> set_current_blocked()") form the sparc tree and 383fe35697e4 ("sparc: Use
> set_current_blocked() and block_sigmask()") from the ptrace tree.
> 
> I have added the following merge fix patch for today.

They didn't build test the original version of the signal patches I
put into the sparc tree either, which is why I fixed them up and put
them into the sparc GIT tree.

Ptrace folks can we not operate like this?  The only reason I found
out about the set_current_blocked() transformations was by accident,
because the original patch was posted to linux-kernel only so it never
got queued up into sparc patchwork.

Then once Oleg mentioned it to me, it didn't even compile so I fixed
it up and put the fixed up copy into my tree.  It also didn't
transform the TS_RESTORE_SIGMASK cases in the sparc signal code, so I
also added a patch to the sparc tree which took care of that.

Now you guys are creating conflicts against those fixed up patches in
another non-sparc tree, and adding new kinds of build failures as
well.

This doesn't work.
