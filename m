From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: build warning after merge of the f2fs tree
Date: Mon, 26 Nov 2018 13:59:24 -0800
Message-ID: <20181126215924.GA55960@jaegeuk-macbookpro.roam.corp.google.com>
References: <20181126111933.1b0fb324@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181126111933.1b0fb324@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kees Cook <keescook@google.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 11/26, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> After merging the f2fs tree, today's linux-next build
> (x86_64_allmodconfig) produced this warning:
> 
> In file included from fs/f2fs/dir.c:11:
> fs/f2fs/f2fs.h: In function '__mark_inode_dirty_flag':
> fs/f2fs/f2fs.h:2388:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    if (set)
>       ^
> fs/f2fs/f2fs.h:2390:2: note: here
>   case FI_DATA_EXIST:
>   ^~~~
> 
> Exposed by my use of -Wimplicit-fallthrough
> 
> I am not sure why this has turned up now (as opposed to earlier today).

The above change had been there for a long time, as an intended behavior.
Hmm, I'm not sure how to avoid this.

Thanks,

> 
> -- 
> Cheers,
> Stephen Rothwell
