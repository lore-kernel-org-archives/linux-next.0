From: Luming Yu <luming.yu@gmail.com>
Subject: Re: What is the right practice to get new code upstream( was Fwd:
 [patch] a simple hardware detector for latency as well as throughput ver. 0.1.0)
Date: Thu, 14 Jun 2012 05:25:44 -0400
Message-ID: <CAJRGBZy_wqUgN_jx9PinXHSGM30XjrRm49xFXkfumucAeaQ2bw@mail.gmail.com>
References: <CAJRGBZw2TctmBxRuA-byaGNCs=1v+M-1PXSm+OuwWApSqu7UjA@mail.gmail.com>
	<20120613152045.81ab66d9.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120613152045.81ab66d9.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, tglx@linutronix.de, sfr@canb.auug.org.au, jcm@jonmasters.org, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, torvalds@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 13, 2012 at 6:20 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Tue, 12 Jun 2012 20:57:02 +0800
> Luming Yu <luming.yu@gmail.com> wrote:
>
>> I need to know what the right practice is to get your attention to
>> accept a new tool upstream like this one.
>
> Seems that you have some good feedback from Arnd to be looking at. =C2=
=A0I'm
> usually the guy for mysterious misc stuff such as this, so please cc =
me
> on future revisions.

Andrew, Thanks a lot :-) The community is really helpful after find
right people for right things.

>
> The name "hw_test" and "HW_TEST" is too vague. =C2=A0The topic "testi=
ng
> hardware" is very broad, and this module only touches a small fractio=
n
> of it, so please think up a far more specific name.
>

I'm working on Version 2 of the tool which would be renamed to
cpu_latency_test, or simply misc_latency_test?

thanks!!! /l
