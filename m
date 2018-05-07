From: Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 7 May 2018 09:47:54 -0700
Message-ID: <f7c0ebfe-1986-6ce5-8641-5503ea6a05fb@infradead.org>
References: <20180504141756.670dc3f3@canb.auug.org.au>
 <4fb39549-8902-950d-3076-82a11b1c5102@infradead.org>
 <20180507141039.GA1934@rodete-desktop-imager.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507141039.GA1934@rodete-desktop-imager.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Minchan Kim <minchan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

On 05/07/2018 07:10 AM, Minchan Kim wrote:
> On Fri, May 04, 2018 at 08:39:43AM -0700, Randy Dunlap wrote:
>> On 05/03/2018 09:17 PM, Stephen Rothwell wrote:
>>> Hi Andrew,
>>>
>>> After merging the akpm-current tree, today's linux-next build
>>> (x86_64_allmodconfig) produced this warning:
>>>
>>> drivers/block/zram/zram_drv.c: In function 'read_block_state':
>>> drivers/block/zram/zram_drv.c:674:16: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 5 has type '__kernel_time_t {aka long int}' [-Wformat=]
>>>     "%12lu %12llu.%06lu %c%c%c\n",
>>>            ~~~~~^
>>>            %12lu
>>>     (unsigned long)index, ts.tv_sec,
>>>                           ~~~~~~~~~
>>>
>>> Introduced by commit
>>>
>>>   827c7dbda8eb ("zram-introduce-zram-memory-tracking-update-fix-fix")
>>>
>>
>> typedef __s64 time64_t;
>>
>> struct timespec64 {
>> 	time64_t	tv_sec;			/* seconds */
>> 	long		tv_nsec;		/* nanoseconds */
>> };
>>
>> time64_t is signed. Also, %lu on i386 et al is for 32-bit longs.
>> I guess that "we" will need to cast ts.tv_sec to (s64) and use %lld to print it
>> in order to satisfy other $arch.
>>
>> Andrew, want to add a fix-fix-fix patch?
> 
> Thanks for the fix during I am absent, Andrew and Randy.
> Here goes fix.
> Andrew please fold this patchset.
> 
> From 16569c7abb641930b4e4ec66b4dc2005e6c87be8 Mon Sep 17 00:00:00 2001
> From: Minchan Kim <minchan@kernel.org>
> Date: Mon, 7 May 2018 23:00:16 +0900
> Subject: [PATCH] zram-introduce-zram-memory-tracking-update-fix-fix-fix
> 
> fix compile warning
> 
> drivers/block/zram/zram_drv.c: In function 'read_block_state':
> drivers/block/zram/zram_drv.c:674:16: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 5 has type '__kernel_time_t {aka long int}' [-Wformat=]
>     "%12lu %12llu.%06lu %c%c%c\n",
>            ~~~~~^
>            %12lu
>     (unsigned long)index, ts.tv_sec,
>                           ~~~~~~~~~
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>  drivers/block/zram/zram_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index f2f3104b2b48..635307e3238b 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -671,8 +671,8 @@ static ssize_t read_block_state(struct file *file, char __user *buf,
>  
>  		ts = ktime_to_timespec64(zram->table[index].ac_time);
>  		copied = snprintf(kbuf + written, count,
> -			"%12lu %12llu.%06lu %c%c%c\n",
> -			(unsigned long)index, ts.tv_sec,
> +			"%12lu %12lld.%06ld %c%c%c\n",
> +			(unsigned long)index, (s64)ts.tv_sec,
>  			ts.tv_nsec / NSEC_PER_USEC,
>  			zram_test_flag(zram, index, ZRAM_SAME) ? 's' : '.',
>  			zram_test_flag(zram, index, ZRAM_WB) ? 'w' : '.',
> 

	ssize_t index,

	so why not print it with %zd (or %12zd) and skip the cast?

-- 
~Randy
