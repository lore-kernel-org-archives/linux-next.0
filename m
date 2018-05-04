From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 4 May 2018 08:39:43 -0700
Message-ID: <4fb39549-8902-950d-3076-82a11b1c5102@infradead.org>
References: <20180504141756.670dc3f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504141756.670dc3f3@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

On 05/03/2018 09:17 PM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build
> (x86_64_allmodconfig) produced this warning:
> 
> drivers/block/zram/zram_drv.c: In function 'read_block_state':
> drivers/block/zram/zram_drv.c:674:16: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 5 has type '__kernel_time_t {aka long int}' [-Wformat=]
>     "%12lu %12llu.%06lu %c%c%c\n",
>            ~~~~~^
>            %12lu
>     (unsigned long)index, ts.tv_sec,
>                           ~~~~~~~~~
> 
> Introduced by commit
> 
>   827c7dbda8eb ("zram-introduce-zram-memory-tracking-update-fix-fix")
> 

typedef __s64 time64_t;

struct timespec64 {
	time64_t	tv_sec;			/* seconds */
	long		tv_nsec;		/* nanoseconds */
};

time64_t is signed. Also, %lu on i386 et al is for 32-bit longs.
I guess that "we" will need to cast ts.tv_sec to (s64) and use %lld to print it
in order to satisfy other $arch.

Andrew, want to add a fix-fix-fix patch?

-- 
~Randy
