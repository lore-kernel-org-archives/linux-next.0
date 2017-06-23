From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of most trees
Date: Fri, 23 Jun 2017 13:34:11 +1000
Message-ID: <20170623133411.64199627@roar.ozlabs.ibm.com>
References: <20170622184116.0ebaabd9@roar.ozlabs.ibm.com>
        <20170622.101306.2121302610489503804.davem@davemloft.net>
        <20170623003339.11cbc062@roar.ozlabs.ibm.com>
        <20170622.105648.1780325804771154563.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170622.105648.1780325804771154563.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, amodra@gmail.com
List-Id: linux-next.vger.kernel.org

On Thu, 22 Jun 2017 10:56:48 -0400 (EDT)
David Miller <davem@davemloft.net> wrote:

> From: Nicholas Piggin <npiggin@gmail.com>
> Date: Fri, 23 Jun 2017 00:33:39 +1000
> 
> > On Thu, 22 Jun 2017 10:13:06 -0400 (EDT)
> > David Miller <davem@davemloft.net> wrote:
> >   
> >> From: Nicholas Piggin <npiggin@gmail.com>
> >> Date: Thu, 22 Jun 2017 18:41:16 +1000
> >>   
> >> > Is there any way for the linker to place the inputs to avoid unresolvable
> >> > relocations where possible?    
> >> 
> >> I don't think so.
> >>   
> >> > A way to work around this is to make arch/sparc/lib/hweight.o an obj-y
> >> > rather than lib-y. That's a hack because it just serves to move the
> >> > input location, but not really any more of a hack than the current code
> >> > that also only works because of input locations...    
> >> 
> >> I could adjust those branches in the sparc code into indirect calls
> >> but it's going to perform a bit poorly on older cpus.  
> > 
> > The build succeeds with your patch. That should solve it properly
> > so it won't come back to bite again.
> > 
> > If you can tolerate the slowdown on old CPUs I'd be grateful if
> > we could merge it for linux-next to get this thin archives tree
> > unblocked.  
> 
> Feel free to merge it into your series:
> 
> ====================
> sparc64: Use indirect calls in hamming weight stubs.
> 
> Otherwise, depending upon link order, the branch relocation
> limits could be exceeded.
> 
> Signed-off-by: David S. Miller <davem@davemloft.net>


Thanks for the patch, looks good to me.
