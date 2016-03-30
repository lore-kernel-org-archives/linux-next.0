From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 30 (waketorture.c)
Date: Wed, 30 Mar 2016 09:56:47 -0700
Message-ID: <56FC054F.8010706@infradead.org>
References: <20160330125012.35e0ca75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160330125012.35e0ca75@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On 03/29/16 18:50, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160329:
> 


on i386 or x86_64:

waketorture.c:(.text+0x5d578): undefined reference to `trace_clock_global'
waketorture.c:(.text+0x5d731): undefined reference to `trace_clock_local'
waketorture.c:(.text+0x5d765): undefined reference to `trace_clock_local'
waketorture.c:(.text+0x5d7a7): undefined reference to `trace_clock_local'
waketorture.c:(.text+0x5d835): undefined reference to `trace_clock_local'
waketorture.c:(.text+0x5d879): undefined reference to `trace_clock_local'
kernel/built-in.o:waketorture.c:(.text+0x5d9a3): more undefined references to `trace_clock_local' follow
waketorture.c:(.init.text+0x3e11): undefined reference to `trace_clock_global'


on i386:

kernel/built-in.o: In function `wake_torture_stats_print':
waketorture.c:(.text+0x4a990): undefined reference to `__udivdi3'
waketorture.c:(.text+0x4a9eb): undefined reference to `__udivdi3'
waketorture.c:(.text+0x4a9fd): undefined reference to `__udivdi3'
waketorture.c:(.text+0x4aa19): undefined reference to `__umoddi3'
waketorture.c:(.text+0x4aa39): undefined reference to `__udivdi3'



Let me know if you need .config files for any of these.

-- 
~Randy
