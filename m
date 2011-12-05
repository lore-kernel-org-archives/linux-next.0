From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for Sept 28 (mrst)
Date: Mon, 5 Dec 2011 19:41:05 +0100
Message-ID: <20111205184105.GA20121@elte.hu>
References: <20110928200404.6ed0d6c34161d233be8994fd@canb.auug.org.au>
 <4E839B94.9040305@xenotime.net>
 <4EDD0FED.7060301@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4EDD0FED.7060301@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86 maintainers <x86@kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: linux-next.vger.kernel.org


* Randy Dunlap <rdunlap@xenotime.net> wrote:

> On 09/28/2011 03:11 PM, Randy Dunlap wrote:
> > On 09/28/11 03:04, Stephen Rothwell wrote:
> >> Hi all,
> > 
> > 
> > When CONFIG_X86_INTEL_MID=y but CONFIG_X86_MRST is not enabled
> > (this is on an i386/X86_32 build):
> > 
> > rtc.c:(.init.text+0x6234): undefined reference to `__mrst_cpu_chip'
> > 
> > Full randconfig file is attached.
> 
> Hm, it's now 20111205 and this build error is still around.
> Is there any hope for getting it fixed?

Alan?

Thanks,

	Ingo
