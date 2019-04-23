From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2019-04-19-14-53 uploaded (objtool)
Date: Tue, 23 Apr 2019 08:45:49 -0700
Message-ID: <9b6de597-110c-aa83-4c58-3dbe937948cf@infradead.org>
References: <20190419215358.WMVFXV3bT%akpm@linux-foundation.org>
 <af3819b4-008f-171e-e721-a9a20f85d8d1@infradead.org>
 <20190423082448.GY11158@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423082448.GY11158@hirez.programming.kicks-ass.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, sfr@canb.auug.org.au, Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On 4/23/19 1:24 AM, Peter Zijlstra wrote:
> On Fri, Apr 19, 2019 at 09:36:46PM -0700, Randy Dunlap wrote:
>> On 4/19/19 2:53 PM, akpm@linux-foundation.org wrote:
>>> The mm-of-the-moment snapshot 2019-04-19-14-53 has been uploaded to
>>>
>>>    http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> mmotm-readme.txt says
>>>
>>> README for mm-of-the-moment:
>>>
>>> http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>>> more than once a week.
>>
>> on x86_64:
>>
>>   CC      lib/strncpy_from_user.o
>> lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x315: call to __ubsan_handle_add_overflow() with UACCESS enabled
>>   CC      lib/strnlen_user.o
>> lib/strnlen_user.o: warning: objtool: strnlen_user()+0x337: call to __ubsan_handle_sub_overflow() with UACCESS enabled
> 
> Lemme guess, you're using GCC < 8 ? That had a bug where UBSAN
> considered signed overflow UB when using -fno-strict-overflow or
> -fwrapv.

Correct.  7.4.0.

Patch works for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> Now, we could of course allow this symbol, but I found only the below
> was required to make allyesconfig build without issue.
> 
> Andy, Linus?
> 
> (note: the __put_user thing is from this one:
> 
>   drivers/gpu/drm/i915/i915_gem_execbuffer.c:	if (unlikely(__put_user(offset, &urelocs[r-stack].presumed_offset))) {
> 
>  where (ptr) ends up non-trivial due to UBSAN)
> 
> ---
> 
> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> index 22ba683afdc2..c82abd6e4ca3 100644
> --- a/arch/x86/include/asm/uaccess.h
> +++ b/arch/x86/include/asm/uaccess.h
> @@ -427,10 +427,11 @@ do {									\
>  ({								\
>  	__label__ __pu_label;					\
>  	int __pu_err = -EFAULT;					\
> -	__typeof__(*(ptr)) __pu_val;				\
> -	__pu_val = x;						\
> +	__typeof__(*(ptr)) __pu_val = (x);			\
> +	__typeof__(ptr) __pu_ptr = (ptr);			\
> +	__typeof__(size) __pu_size = (size);			\
>  	__uaccess_begin();					\
> -	__put_user_size(__pu_val, (ptr), (size), __pu_label);	\
> +	__put_user_size(__pu_val, __pu_ptr, __pu_size, __pu_label);	\
>  	__pu_err = 0;						\
>  __pu_label:							\
>  	__uaccess_end();					\
> diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
> index 58eacd41526c..07045bc4872e 100644
> --- a/lib/strncpy_from_user.c
> +++ b/lib/strncpy_from_user.c
> @@ -26,7 +26,7 @@
>  static inline long do_strncpy_from_user(char *dst, const char __user *src, long count, unsigned long max)
>  {
>  	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
> -	long res = 0;
> +	unsigned long res = 0;
>  
>  	/*
>  	 * Truncate 'max' to the user-specified limit, so that
> diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
> index 1c1a1b0e38a5..0729378ad3e9 100644
> --- a/lib/strnlen_user.c
> +++ b/lib/strnlen_user.c
> @@ -28,7 +28,7 @@
>  static inline long do_strnlen_user(const char __user *src, unsigned long count, unsigned long max)
>  {
>  	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
> -	long align, res = 0;
> +	unsigned long align, res = 0;
>  	unsigned long c;
>  
>  	/*
> 


-- 
~Randy
