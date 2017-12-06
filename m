From: Petr Mladek <pmladek@suse.com>
Subject: Re: linux-next: build failure after merge of the printk tree
Date: Wed, 6 Dec 2017 11:17:25 +0100
Message-ID: <20171206101725.fn4sfbf7sithel55@pathway.suse.cz>
References: <20171206142300.64d5a70f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171206142300.64d5a70f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed 2017-12-06 14:23:00, Stephen Rothwell wrote:
> Hi Petr,
> 
> After merging the printk tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
> 
> lib/vsprintf.o: In function `pointer':
> vsprintf.c:(.text+0x2260): undefined reference to `dereference_symbol_descriptor'
> 
> Caused by commit
> 
>   b77929215209 ("symbol lookup: introduce dereference_symbol_descriptor()")

I have just pushed the fixed commit from Sergey and will improve my
test coverage.

> I have reverted that commit for today.

It should work now. I am sorry for the troubles.

Best Regards,
Petr
