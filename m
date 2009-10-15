From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH -next] ia64/sn: fix percpu warnings
Date: Thu, 15 Oct 2009 10:33:57 +0900
Message-ID: <4AD67C05.2030201@kernel.org>
References: <20091014163445.f0441473.sfr@canb.auug.org.au> <20091014151003.0ef42973.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20091014151003.0ef42973.randy.dunlap@oracle.com>
Sender: linux-ia64-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jes Sorensen <jes@sgi.com>, linux-ia64@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix percpu types warning in ia64/sn:
> 
> arch/ia64/sn/kernel/setup.c:74: error: conflicting types for '__pcpu_scope___sn_cnodeid_to_nasid'
> arch/ia64/include/asm/sn/arch.h:74: error: previous declaration of '__pcpu_scope___sn_cnodeid_to_nasid' was here
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Jes Sorensen <jes@sgi.com>

Acked-by: Tejun Heo <tj@kernel.org>

Can this go through ia64 tree?  If not, I can route it through
percpu#for-fixes.

Thanks.

-- 
tejun
