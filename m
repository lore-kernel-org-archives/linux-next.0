From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: next-20171103 build: 3 failures 22 warnings (next-20171103)
Date: Sat, 4 Nov 2017 04:27:29 +0900
Message-ID: <20171104042729.2196dbe1ad905c71f18cbb1e@kernel.org>
References: <E1eAbKY-0001Sc-Ue@optimist>
        <CAK8P3a2JFOgp5nPmEnM9NATutQ_+aSxdHGh6YHcnveMJ+eASJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751957AbdKCT1d (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Nov 2017 15:27:33 -0400
In-Reply-To: <CAK8P3a2JFOgp5nPmEnM9NATutQ_+aSxdHGh6YHcnveMJ+eASJg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Build bot for Mark Brown <broonie@kernel.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, linaro-kernel@lists.linaro.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andi Kleen <andi@firstfloor.org>, Masami Hiramatsu <mhiramat@kernel.org>

Hi

On Fri, 3 Nov 2017 15:44:53 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

> On Fri, Nov 3, 2017 at 1:44 PM, Build bot for Mark Brown
> <broonie@kernel.org> wrote:
> >
> > Errors summary: 4
> >           2 ../include/linux/kernel.h:931:18: error: invalid type argument of unary '*' (have 'int')
> >           2 ../include/linux/kernel.h:930:32: error: invalid type argument of unary '*' (have 'int')
> >           1 ../lib/bug.c:213:32: error: 'module_bug_list' undeclared (first use in this function)
> >           1 ../include/linux/rculist.h:352:49: error: dereferencing pointer to incomplete type 'struct module'
> 
> Just sent a patch
> 
> > Warnings Summary: 22
> >           2 ../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> >           2 ../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >           2 ../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >           2 ../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> >           2 ../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >           2 ../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> >           2 ../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >           2 ../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >           1 ../arch/arm/probes/kprobes/test-core.c:398:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> >           1 ../arch/arm/probes/kprobes/test-core.c:390:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> 
> I need a little help from Masami Hiramatsu to understand what the plan is here:
> Do we just need to remove those files now that jprobes are gone, or do
> we actually
> want to restore the functionality using some other replacement code?
> 
> I'm asking because the __deprecated warning seems unhelpful if there
> isn't an easy
> way to address the warning.

It seems that the arm/probes case is just for testing, I'll just remove it
because it's functionality is gone.
Others should be decided by network maintainers. Maybe those are not used anymore,
or should be rewritten by kprobes or ftrace.

Thank you,

> 
> >           2 ../drivers/staging/rtlwifi/base.c:2167:23: warning: unused variable 'hw' [-Wunused-variable]
> >           2 ../drivers/staging/rtl8723bs/hal/hal_btcoex.c:1415:5: warning: unused variable 'ret2' [-Wunused-variable]
> >           2 ../drivers/staging/rtl8723bs/hal/hal_btcoex.c:1414:5: warning: unused variable 'ret1' [-Wunused-variable]
> >           2 ../drivers/soc/qcom/rmtfs_mem.c:211:1: warning: label 'remove_cdev' defined but not used [-Wunused-label]
> >           2 ../drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:693:20: warning: unused variable 'chip' [-Wunused-variable]
> 
> Mostly unrelated issues all have existing patches.
> 
> >           2 ../drivers/gpu/drm/vc4/vc4_bo.c:95:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
> >           2 ../drivers/gpu/drm/vc4/vc4_bo.c:91:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
> >           1 ../drivers/usb/mtu3/mtu3_qmu.c:300:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
> >           1 ../drivers/usb/mtu3/mtu3_qmu.c:300:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka long long unsigned int}' [-Wformat=]
> >           1 ../drivers/usb/mtu3/mtu3_qmu.c:261:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
> >           1 ../drivers/usb/mtu3/mtu3_qmu.c:261:25: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'dma_addr_t {aka long long unsigned int}' [-Wformat=]
> 
> Sent a patch for these too
> 
> >           1 ../drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:1780:4: warning: 'skb' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> This came through arm-soc, I also have a patch for it, which should go through
> netdev, though that leaves arm-soc showing that warning.
> 
>       Arnd


-- 
Masami Hiramatsu <mhiramat@kernel.org>
