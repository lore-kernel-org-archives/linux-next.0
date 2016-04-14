From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 14 Apr 2016 09:35:52 -0300
Message-ID: <20160414123552.GD2439@redhat.com>
References: <20160414121418.288bd117@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160414121418.288bd117@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Em Thu, Apr 14, 2016 at 12:14:18PM +1000, Stephen Rothwell escreveu:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc64le perf)
> failed like this:
> 
> make[3]: *** No rule to make target '/home/sfr/next/perf/arch/x86/include/generated/asm/syscalls_64.c', needed by '/home/sfr/next/perf/util/syscalltbl.o'.  Stop.
> 
> (I build in /home/sfr/next/next with objects in /home/sfr/next/perf.)

I'll check, should've been caught by a cross compiler build for ppc64le
I have in place :-\

minimal-ubuntu-x-ppc64el: Ok

But maybe not, as this requires audit-libs-devel and that is not present
on that minimal ubuntu x-compiler setup, sigh :-\

- Arnaldo
 
> Presumably caused by commit
> 
>   1b700c997500 ("perf tools: Build syscall table .c header from kernel's syscall_64.tbl")
> 
> I have reverted that commit for today (which fixes my build problem but
> may not be overall correct).
> 
> -- 
> Cheers,
> Stephen Rothwell
