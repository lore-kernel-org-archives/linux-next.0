From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [next-20180517][ppc] watchdog: CPU 88 self-detected hard LOCKUP
 @ update_cfs_group+0x30/0x150
Date: Tue, 29 May 2018 18:39:40 +0530
Message-ID: <1527599380.3777.3.camel@abdul>
References: <1526883300.19317.18.camel@abdul>
         <20180521165056.5f3dceeb@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180521165056.5f3dceeb@roar.ozlabs.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Piggin <npiggin@gmail.com>
Cc: sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2018-05-21 at 16:50 +1000, Nicholas Piggin wrote:
> Ah, it's POWER8.
> 
> I'm betting we have a bug with nohz timer offloading somewhere.
> 
> I *think* we may have seen similar on P9 as well, but that may be
> related to problems with stop states.
> 
> Can you reproduce it easily? I'm thinking maybe adding some
> tracepoints that track decrementer settings and interrupts, and
> nohz offload activity might show something up.

Yes, the problem is reproducible consistently on our CI setup and today
It triggered on 4.17.0-rc6 (mainline) too.

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
