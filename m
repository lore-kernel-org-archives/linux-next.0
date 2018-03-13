From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 13 Mar 2018 12:44:34 -0700
Message-ID: <20180313124434.6f91b499b16080e766ab070f@linux-foundation.org>
References: <20180313205119.6ca3c1aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313205119.6ca3c1aa@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On Tue, 13 Mar 2018 20:51:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (lots of
> configuations) failed like this:
> 
> (from the i386 defconfig build)
> 
> In file included from include/linux/memcontrol.h:29:0,
>                  from include/linux/swap.h:9,
>                  from include/linux/suspend.h:5,
>                  from arch/x86/kernel/asm-offsets.c:13:
> include/linux/mm.h: In function 'get_mm_hiwater_rss':
> include/linux/mm.h:1569:9: error: first argument to '__builtin_choose_expr' not a constant
> include/linux/mm.h: In function 'get_mm_hiwater_vm':
> include/linux/mm.h:1574:9: error: first argument to '__builtin_choose_expr' not a constant
> 
> and many more ...
> 
> Caused by commit
> 
>   c7c133f3d5ff ("kernel.h: skip single-eval logic on literals in min()/max()")
> (and perhaps the folloups)
> 
> Just a few of my builds actaully worked (including those I do
> during the day).  For complete logs see
> http://kisskb.ellerman.id.au/kisskb/head/13556/ .
> 
> I guess it could be compiler version specific.  The failing ones are
> done with gcc 4.6.3.  My successful ones with gcc 7.3.1.

Yes, this is being a pain in the butt.  I guess we should drop the
patches for now.
