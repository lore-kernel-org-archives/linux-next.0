From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: origin tree build failure
Date: Mon, 12 Jan 2009 11:10:15 +1100
Message-ID: <1231719015.22571.4.camel__41226.9047847532$1231719172$gmane$org@pasglop>
References: <20090112104837.69feedec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20090112104837.69feedec.sfr@canb.auug.org.au>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>, Mike Travis <travis@sgi.com>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2009-01-12 at 10:48 +1100, Stephen Rothwell wrote:
> Hi Linus,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> arch/powerpc/platforms/pasemi/cpufreq.c: In function 'pas_cpufreq_cpu_init':
> arch/powerpc/platforms/pasemi/cpufreq.c:216: error: incompatible types in assignment
> arch/powerpc/platforms/powermac/cpufreq_64.c: In function 'g5_cpufreq_cpu_init':
> arch/powerpc/platforms/powermac/cpufreq_64.c:365: error: incompatible types in assignment
> arch/powerpc/platforms/cell/cbe_cpufreq.c: In function 'cbe_cpufreq_cpu_init':
> arch/powerpc/platforms/cell/cbe_cpufreq.c:121: error: incompatible types in assignment
> 
> Caused by commit 835481d9bcd65720b473db6b38746a74a3964218 ("cpumask:
> convert struct cpufreq_policy to cpumask_var_t") which missed updating
> all the powerpc (at least) cpufreq drivers.

Yeah, it only updates x86 it seems ... 

> Reverting that one commit required fixups, so I reverted merge commit
> 4e9b1c184cadbece3694603de5f880b6e35bd7a7 ("Merge branch 'cpus4096-for-linus'
> of git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip")
> instead.
> 
> I am hoping that this will be fixed soon and that revert doesn't
> propagate more pain through today's linux-next.

I've just made a patch, testing it now, will send it in a few minutes

Cheers,
Ben.
