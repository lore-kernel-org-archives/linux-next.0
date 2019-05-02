From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: build failure after merge of the f2fs tree
Date: Wed, 1 May 2019 20:42:14 -0700
Message-ID: <20190502034214.GA37709@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190502105309.7ad51660@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502105309.7ad51660@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chao Yu <yuchao0@huawei.com>
List-Id: linux-next.vger.kernel.org

On 05/02, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> After merging the f2fs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/trace/define_trace.h:96,
>                  from include/trace/events/f2fs.h:1724,
>                  from fs/f2fs/super.c:35:
> include/trace/events/f2fs.h: In function 'trace_raw_output_f2fs_filemap_fault':
> include/trace/events/f2fs.h:1310:3: error: '_entry' undeclared (first use in this function); did you mean 'dentry'?
>    _entry->ret)
>    ^~~~~~
> include/trace/trace_events.h:360:22: note: in definition of macro 'DECLARE_EVENT_CLASS'
>   trace_seq_printf(s, print);     \
>                       ^~~~~
> include/trace/trace_events.h:79:9: note: in expansion of macro 'PARAMS'
>          PARAMS(print));         \
>          ^~~~~~
> include/trace/events/f2fs.h:1287:1: note: in expansion of macro 'TRACE_EVENT'
>  TRACE_EVENT(f2fs_filemap_fault,
>  ^~~~~~~~~~~
> include/trace/events/f2fs.h:1307:2: note: in expansion of macro 'TP_printk'
>   TP_printk("dev = (%d,%d), ino = %lu, index = %lu, ret = %lx",
>   ^~~~~~~~~
> include/trace/events/f2fs.h:1310:3: note: each undeclared identifier is reported only once for each function it appears in
>    _entry->ret)
>    ^~~~~~
> include/trace/trace_events.h:360:22: note: in definition of macro 'DECLARE_EVENT_CLASS'
>   trace_seq_printf(s, print);     \
>                       ^~~~~
> include/trace/trace_events.h:79:9: note: in expansion of macro 'PARAMS'
>          PARAMS(print));         \
>          ^~~~~~
> include/trace/events/f2fs.h:1287:1: note: in expansion of macro 'TRACE_EVENT'
>  TRACE_EVENT(f2fs_filemap_fault,
>  ^~~~~~~~~~~
> include/trace/events/f2fs.h:1307:2: note: in expansion of macro 'TP_printk'
>   TP_printk("dev = (%d,%d), ino = %lu, index = %lu, ret = %lx",
>   ^~~~~~~~~
> 
> Caused by commit
> 
>   90a238561901 ("f2fs: add tracepoint for f2fs_filemap_fault()")
> 
> I have applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 2 May 2019 10:44:46 +1000
> Subject: [PATCH] f2fs: fix up for "f2fs: add tracepoint for
>  f2fs_filemap_fault()"
> 
> Fixes: 90a238561901 ("f2fs: add tracepoint for f2fs_filemap_fault()")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/trace/events/f2fs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 6a53c793cf20..53b96f12300c 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -1307,7 +1307,7 @@ TRACE_EVENT(f2fs_filemap_fault,
>  	TP_printk("dev = (%d,%d), ino = %lu, index = %lu, ret = %lx",
>  		show_dev_ino(__entry),
>  		(unsigned long)__entry->index,
> -		_entry->ret)
> +		__entry->ret)

My bad. I was so hurried up. Uploaded again w/ fix.

Thanks,

>  );
>  
>  TRACE_EVENT(f2fs_writepages,
> -- 
> 2.20.1
> 
> -- 
> Cheers,
> Stephen Rothwell
