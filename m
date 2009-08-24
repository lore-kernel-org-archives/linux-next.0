From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: powerpc tree build warning
Date: Mon, 24 Aug 2009 03:01:53 +0200
Message-ID: <20090824010153.GB21533@lst.de>
References: <20090824102256.3e8d69b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20090824102256.3e8d69b6.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kyle@mcmartin.ca, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, ink@jurassic.park.msu.ru, rth@twiddle.net
List-Id: linux-next.vger.kernel.org

On Mon, Aug 24, 2009 at 10:22:56AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> kernel/time/tick-sched.c: In function 'tick_nohz_stop_sched_tick':
> kernel/time/tick-sched.c:261: warning: format '%02x' expects type 'unsigned int', but argument 2 has type 'long unsigned int'
> 
> Introduced by commit 6826a57d1abc8ac9f59b24f1a008554c6560a995 ("powerpc:
> Switch to asm-generic/hardirq.h") which changed
> irq_cpustat_t::__softirq_pending from "unsigned int" to "unsigned long"
> on powerpc.

Hah, that's an interesting one.  In currently mainline the following
architectures have it as unsigned long:

	alpha, parisc and blackfin/microblaze via asm-generic

and all others have it as unsigned int.  For blackfin and microblaze
it obviously doesn't matter, so the question is why alpha and parisc
have it as usinged long.  We defintively should standardize on one,
and unless alpha and parisc have good reasons for needing a long
value that would be unsigned int.
