From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH -next] kmemcheck: build failure after merge of the slabh
 tree
Date: Tue, 30 Mar 2010 03:00:48 +0900
Message-ID: <4BB0EAD0.2030807@kernel.org>
References: <20100329154208.009a8ae2.sfr@canb.auug.org.au> <20100329092513.6e6faf2a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100329092513.6e6faf2a.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Masters <jcm@jonmasters.org>
List-Id: linux-next.vger.kernel.org

Hello,

On 03/30/2010 01:25 AM, Randy Dunlap wrote:
> This tree seems to be a bit messy.  :(

Sorry.  Most of the failures came from me forgetting to run the
conversion script on codes which are in linux-next but not mainline,
so all the new codes ended up broken by default.  I just sent out
patches against trees in linux-next.  Once they're in, there shouldn't
be many problems.

> Sorry if I missed this patch in the (email) storm.
> 
> mm/kmemcheck.c also needs slab.h added to it:

But this one is something I missed from the mainline (my script didn't
check for isolated SLAB_* flag usages).  I'll take this one into the
slabh tree.  Thanks for reporting this.  :-)

-- 
tejun
