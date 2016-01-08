From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 8 Jan 2016 15:08:50 +1100
Message-ID: <20160108150850.1ec97e78@canb.auug.org.au>
References: <20160107195725.3a130b4d@canb.auug.org.au>
	<20160107180244.GR3818@linux.vnet.ibm.com>
	<20160108071932.060a9bcc@canb.auug.org.au>
	<20160107205220.GU3818@linux.vnet.ibm.com>
	<20160108013631.GA11410@fixme-laptop.cn.ibm.com>
	<20160108034157.GZ3818@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160108034157.GZ3818@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hi Paul,

On Thu, 7 Jan 2016 19:41:57 -0800 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
>
> Indeed, I suspect that SRCU might not be the only thing that would like
> static per-CPU variables.  ;-)

from include/linux/percpu-defs.h:

 * s390 and alpha modules require percpu variables to be defined as
 * weak to force the compiler to generate GOT based external
 * references for them.  This is necessary because percpu sections
 * will be located outside of the usually addressable area.
 *
 * This definition puts the following two extra restrictions when
 * defining percpu variables.
 *
 * 1. The symbol must be globally unique, even the static ones.
 * 2. Static percpu variables cannot be defined inside a function.
 *
 * Archs which need weak percpu definitions should define
 * ARCH_NEEDS_WEAK_PER_CPU in asm/percpu.h when necessary.
 *
 * To ensure that the generic code observes the above two
 * restrictions, if CONFIG_DEBUG_FORCE_WEAK_PER_CPU is set weak
 * definition is used for all cases.

so they can be static, but must be globally unique.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
