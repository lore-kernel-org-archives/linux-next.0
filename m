From: Petr Mladek <pmladek@suse.com>
Subject: Re: linux-next: build failure after merge of the printk tree
Date: Thu, 7 Dec 2017 14:12:12 +0100
Message-ID: <20171207131212.id337raa3t24fxig@pathway.suse.cz>
References: <20171207113707.0ce273dd@canb.auug.org.au>
 <20171207012631.GC1119@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171207012631.GC1119@jagdpanzerIV>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu 2017-12-07 10:26:31, Sergey Senozhatsky wrote:
> On (12/07/17 11:37), Stephen Rothwell wrote:
> [..]
> > include/linux/kallsyms.h: In function 'dereference_symbol_descriptor':
> > include/linux/kallsyms.h:63:8: error: implicit declaration of function '__module_address' [-Werror=implicit-function-declaration]
> >   mod = __module_address((unsigned long)ptr);
> >         ^
> > include/linux/kallsyms.h:67:9: error: implicit declaration of function 'dereference_module_function_descriptor' [-Werror=implicit-function-declaration]
> >    ptr = dereference_module_function_descriptor(mod, ptr);
> >          ^
> > 
> > and many more ...
> > 
> > Caused by commit
> > 
> >   78675fe41d57 ("symbol lookup: introduce dereference_symbol_descriptor()")
> > 
> > I have used the printk tree from next-20171206 (with its version of the
> > above patch reverted due to yesterday's error) for today.
> 
> will fix   :(

Sigh, the dependencies are quite complicated here.

Anyway, Sergey's fix for these non-x86 architectures is merged in printk.git
now.

Best Regards,
Petr
