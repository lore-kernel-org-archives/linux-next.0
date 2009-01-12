From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Fix cpufreq drivers after cpufreq core changes
Date: Tue, 13 Jan 2009 08:45:36 +1100
Message-ID: <1231796736.22571.34.camel__24666.5585706525$1231797013$gmane$org@pasglop>
References: <20090112104837.69feedec.sfr@canb.auug.org.au>
	<1231719015.22571.4.camel@pasglop> <1231719721.22571.9.camel@pasglop>
	<20090112083412.GB19701@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20090112083412.GB19701@elte.hu>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, arndb <arndb@arndb.de>, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>, Mike Travis <travis@sgi.com>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

On Mon, 2009-01-12 at 09:34 +0100, Ingo Molnar wrote:
> * Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:
> 
> > This updates the cpufreq drivers in arch/powerpc so they build again
> > after the core cpufreq changes that broke them in commit
> > in835481d9bcd65720b473db6b38746a74a3964218.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> > 
> > Tested on a G5. Olof, Arnd, any chance you can test the cell and pasemi
> > drivers still work ?
> > 
> > Linus, you can probably merge this now to fix the build problems.
> 
> Thanks Ben!
> 
> The powerpc defconfig built fine - you might wan to turn on cpufreq in the 
> powerpc defconfig so that cross-build tests can catch problems like this.

Hrm... which config are you using ? ppc64_defconfig has them all on.

Cheers,
Ben.
