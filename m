From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: next-20171103 build: 3 failures 22 warnings (next-20171103)
Date: Sat, 4 Nov 2017 06:12:40 +0900
Message-ID: <20171104061240.0c56c5e9f3ede3341e8fd4a9@kernel.org>
References: <E1eAbKY-0001Sc-Ue@optimist>
        <CAK8P3a2JFOgp5nPmEnM9NATutQ_+aSxdHGh6YHcnveMJ+eASJg@mail.gmail.com>
        <20171104042729.2196dbe1ad905c71f18cbb1e@kernel.org>
        <CAK8P3a1j5p7wYpwY3neF8Z4EwcFsS6TciEy3UAcGaSfujrQN_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755802AbdKCVMo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Nov 2017 17:12:44 -0400
In-Reply-To: <CAK8P3a1j5p7wYpwY3neF8Z4EwcFsS6TciEy3UAcGaSfujrQN_Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Build bot for Mark Brown <broonie@kernel.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, linaro-kernel@lists.linaro.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Hemminger <stephen@networkplumber.org>, Networking <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, Daniel Borkmann <dborkman@redhat.com>, Ian McDonald <ian.mcdonald@jandi.co.nz>, Wei Yongjun <yjwei@cn.fujitsu.com>

On Fri, 3 Nov 2017 21:16:21 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

> On Fri, Nov 3, 2017 at 8:27 PM, Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > On Fri, 3 Nov 2017 15:44:53 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Fri, Nov 3, 2017 at 1:44 PM, Build bot for Mark Brown <broonie@kernel.org> wrote:
> >>
> >> > Warnings Summary: 22
> >> >           2 ../net/sctp/probe.c:240:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> >> >           2 ../net/sctp/probe.c:194:3: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >> >           2 ../net/sctp/probe.c:189:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >> >           2 ../net/ipv4/tcp_probe.c:298:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> >> >           2 ../net/ipv4/tcp_probe.c:280:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >> >           2 ../net/dccp/probe.c:190:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> >> >           2 ../net/dccp/probe.c:170:4: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >> >           2 ../net/dccp/probe.c:166:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >> >           1 ../arch/arm/probes/kprobes/test-core.c:398:2: warning: 'unregister_jprobe' is deprecated [-Wdeprecated-declarations]
> >> >           1 ../arch/arm/probes/kprobes/test-core.c:390:2: warning: 'register_jprobe' is deprecated [-Wdeprecated-declarations]
> >>
> >> I need a little help from Masami Hiramatsu to understand what the plan is here:
> >> Do we just need to remove those files now that jprobes are gone, or do
> >> we actually want to restore the functionality using some other replacement code?
> >>
> >> I'm asking because the __deprecated warning seems unhelpful if there
> >> isn't an easy way to address the warning.
> >
> > It seems that the arm/probes case is just for testing, I'll just remove it
> > because it's functionality is gone.
> 
> Makes sense, thanks!
> 
> > Others should be decided by network maintainers. Maybe those are not used anymore,
> > or should be rewritten by kprobes or ftrace.
> 
> Added a few people to cc that worked on {tcp,dccp,sctp}_probe in the past
> for clarification. Do you already have plans to deal with this?

As far as I can see, those features can not be fixed simply using kprobes because
they are using function arguments. Fortunately we already have trace-events nowadays.
So my suggestion is adding trace-events in the target function with required
arguments, rewrite user-space tools to use ftrace, and remove the modules.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
