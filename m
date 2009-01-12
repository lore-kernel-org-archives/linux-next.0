From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Fix cpufreq drivers after cpufreq core changes
Date: Tue, 13 Jan 2009 08:45:36 +1100
Message-ID: <1231796736.22571.34.camel__5362.45258194885$1231797009$gmane$org@pasglop>
References: <20090112104837.69feedec.sfr@canb.auug.org.au>
	 <1231719015.22571.4.camel@pasglop> <1231719721.22571.9.camel@pasglop>
	 <20090112083412.GB19701@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757886AbZALVrs@vger.kernel.org>
In-Reply-To: <20090112083412.GB19701@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Mike Travis <travis@sgi.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, Olof Johansson <olof@lixom.net>, arndb <arndb@arndb.de>
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
