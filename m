From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Fri, 15 Jan 2016 13:24:11 +1100
Message-ID: <20160115132411.3193fff9@canb.auug.org.au>
References: <20160112164034.0fe945a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44050 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751577AbcAOCYM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Jan 2016 21:24:12 -0500
In-Reply-To: <20160112164034.0fe945a7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Benjamin,

On Tue, 12 Jan 2016 16:40:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the aio tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> fs/built-in.o: In function `aio_thread_op_foo_at':
> file.c:(.text+0x43808): undefined reference to `__get_user_bad'
> file.c:(.text+0x43838): undefined reference to `__get_user_bad'
> 
> Caused by commit
> 
>   150a0b4905f1 ("aio: add support for async openat()")
> 
> I have used the aio tree from next-20160111 for today.

I am still getting this error.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
