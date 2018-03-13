From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 13
Date: Tue, 13 Mar 2018 10:30:59 -0700
Message-ID: <431d701a-1ac2-6f95-aa49-bab1d921072b@infradead.org>
References: <20180313183326.0e93f359@canb.auug.org.au>
 <CAMM=eLdZ6adSV6Q0JLkRi9k=7g5o4SEAyGfOm0P_nqw71Jbing@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMM=eLdZ6adSV6Q0JLkRi9k=7g5o4SEAyGfOm0P_nqw71Jbing@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Snitzer <snitzer@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

On 03/13/2018 08:57 AM, Mike Snitzer wrote:
> I had to revert the following commits to get this kernel to build
> (otherwise I got macro expansion errors, using RHEL7
> gcc-4.8.5-28.el7.x86_64):
> 
> beb7eb2 kernelh-skip-single-eval-logic-on-literals-in-min-max-v3
> 19ff7e5 kernelh-skip-single-eval-logic-on-literals-in-min-max-v2
> c7c133f kernel.h: skip single-eval logic on literals in min()/max()
> 
> (it wasn't until I reverted commit c7c133f that the kernel build worked)

Yep, all of my automated randconfig builds were useless...


> Here is a snippet of the errors if commit c7c133f was applied:
> 
> [root@rhel-storage-02 linux]# make
>   CHK     include/config/kernel.release
>   CHK     include/generated/uapi/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CC      kernel/bounds.s
>   CHK     include/generated/bounds.h
>   CHK     include/generated/timeconst.h
>   CC      arch/x86/kernel/asm-offsets.s
> In file included from ./include/linux/crypto.h:21:0,
>                  from arch/x86/kernel/asm-offsets.c:9:
> ./include/linux/jiffies.h: In function ‘jiffies_delta_to_clock_t’:
> ./include/linux/kernel.h:856:2: error: first argument to
> ‘__builtin_choose_expr’ not a constant
>   __builtin_choose_expr(__builtin_constant_p(x) &&  \
>   ^
> ./include/linux/kernel.h:869:19: note: in expansion of macro ‘__max’
>  #define max(x, y) __max(typeof(x), typeof(y), x, y)
>                    ^
> ./include/linux/jiffies.h:444:28: note: in expansion of macro ‘max’
>   return jiffies_to_clock_t(max(0L, delta));
>                             ^
> ./include/linux/mm.h: In function ‘get_mm_hiwater_rss’:
> ./include/linux/kernel.h:856:2: error: first argument to
> ‘__builtin_choose_expr’ not a constant
>   __builtin_choose_expr(__builtin_constant_p(x) &&  \
>   ^
> ./include/linux/kernel.h:869:19: note: in expansion of macro ‘__max’
>  #define max(x, y) __max(typeof(x), typeof(y), x, y)
>                    ^
> ./include/linux/mm.h:1569:9: note: in expansion of macro ‘max’
>   return max(mm->hiwater_rss, get_mm_rss(mm));
>          ^
> ./include/linux/mm.h: In function ‘get_mm_hiwater_vm’:
> ./include/linux/kernel.h:856:2: error: first argument to
> ‘__builtin_choose_expr’ not a constant
>   __builtin_choose_expr(__builtin_constant_p(x) &&  \
>   ^
> ./include/linux/kernel.h:869:19: note: in expansion of macro ‘__max’
>  #define max(x, y) __max(typeof(x), typeof(y), x, y)
>                    ^
> ./include/linux/mm.h:1574:9: note: in expansion of macro ‘max’
>   return max(mm->hiwater_vm, mm->total_vm);
>          ^
> ./include/linux/bvec.h: In function ‘bvec_iter_advance’:
> ./include/linux/kernel.h:833:2: error: first argument to
> ‘__builtin_choose_expr’ not a constant
>   __builtin_choose_expr(__builtin_constant_p(x) &&  \
>   ^
> ./include/linux/kernel.h:847:19: note: in expansion of macro ‘__min’
>  #define min(x, y) __min(typeof(x), typeof(y), x, y)
>                    ^
> ./include/linux/bvec.h:59:2: note: in expansion of macro ‘min’
>   min((iter).bi_size,     \
>   ^
> ...
> 


-- 
~Randy
