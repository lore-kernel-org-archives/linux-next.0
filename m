From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: linux-next: Tree for Apr 22 (adjust_autoksyms.sh)
Date: Fri, 22 Apr 2016 14:43:43 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1604221423300.27452@knanqh.ubzr>
References: <20160422153503.24aa389e@canb.auug.org.au> <571A56C4.7030907@infradead.org> <alpine.LFD.2.20.1604221345340.27452@knanqh.ubzr> <571A6BCE.9040904@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <571A6BCE.9040904@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>
List-Id: linux-next.vger.kernel.org

On Fri, 22 Apr 2016, Randy Dunlap wrote:

> On 04/22/16 10:48, Nicolas Pitre wrote:
> > On Fri, 22 Apr 2016, Randy Dunlap wrote:
> > 
> >> on x86_64:
> >>
> >> I'm seeing:
> >>
> >> /bin/sh: scripts/adjust_autoksyms.sh: No such file or directory
> >> /local/lnx/next/linux-next-20160422/Makefile:937: recipe for target 'vmlinux' failed
> >>
> >> when using O=subdir for the build output directory.
> >>
> >>
> >> Is there a missing $(objtree) somewhere?
> > 
> > Rather a $(srctree).  Please try the patch below.
> 
> Hi,
> 
> Yes, this patch helps, but I think there is still a problem.
> I think that trim needs to be done after CONFIG_BUILD_DOCSRC and possibly
> after CONFIG_SAMPLES are built.

The later is already taken care of with commit dd92478a15.

> At least CONFIG_BUILD_DOCSRC seems to
> cause this error:
> 
> Setup is 16508 bytes (padded to 16896 bytes).
> System is 6125 kB
> CRC 8aa70f94
> Kernel: arch/x86/boot/bzImage is ready  (#9)
> ERROR: "cn_del_callback" [Documentation/connector/cn_test.ko] undefined!
> ERROR: "cn_add_callback" [Documentation/connector/cn_test.ko] undefined!
> ERROR: "cn_netlink_send" [Documentation/connector/cn_test.ko] undefined!
> ../scripts/Makefile.modpost:91: recipe for target '__modpost' failed
> make[2]: *** [__modpost] Error 1

This one is indeed a problem.


Nicolas
