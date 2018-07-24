From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: build warning after merge of the fsi tree
Date: Tue, 24 Jul 2018 16:39:19 +1000
Message-ID: <e3a66e2364db2e5439ca8e08cb0def3195d303a4.camel@kernel.crashing.org>
References: <20180724160356.7f5a018d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724160356.7f5a018d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@linuxfoundation.org
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2018-07-24 at 16:03 +1000, Stephen Rothwell wrote:
> Hi Benjamin,
> 
> After merging the fsi tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:

Ah thanks. It's a pair of missing "z" qualifiers in those dev_dbg.

This normally won't show as this driver can only be enabled on 32-bit
ARM, but COMPILE_TEST will allow you to build it on x86_64 thus
triggering the warning.

I've pushed a fix in the fsi tree.

Greg, do you want a new signed tag with the fix or that can wait
for my next pull request ? I have a last bunch of chardev conversions
and object lifetime fixes being reviewed that I was thinking of sending
later this week.

Cheers,
Ben.

> 
> In file included from include/linux/printk.h:336:0,
>                  from include/linux/kernel.h:14,
>                  from include/linux/delay.h:22,
>                  from drivers/fsi/fsi-master-ast-cf.c:8:
> drivers/fsi/fsi-master-ast-cf.c: In function 'fsi_master_acf_read':
> drivers/fsi/fsi-master-ast-cf.c:609:23: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
>   dev_dbg(master->dev, "read id %d addr %x size %ud\n", id, addr, size);
>                        ^
> include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
>    __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                        ^~~
> include/linux/device.h:1428:23: note: in expansion of macro 'dev_fmt'
>   dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                        ^~~~~~~
> drivers/fsi/fsi-master-ast-cf.c:609:2: note: in expansion of macro 'dev_dbg'
>   dev_dbg(master->dev, "read id %d addr %x size %ud\n", id, addr, size);
>   ^~~~~~~
> drivers/fsi/fsi-master-ast-cf.c: In function 'fsi_master_acf_write':
> drivers/fsi/fsi-master-ast-cf.c:634:23: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t {aka long unsigned int}' [-Wformat=]
>   dev_dbg(master->dev, "write id %d addr %x size %ud raw_data: %08x\n",
>                        ^
> include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
>    __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                        ^~~
> include/linux/device.h:1428:23: note: in expansion of macro 'dev_fmt'
>   dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                        ^~~~~~~
> drivers/fsi/fsi-master-ast-cf.c:634:2: note: in expansion of macro 'dev_dbg'
>   dev_dbg(master->dev, "write id %d addr %x size %ud raw_data: %08x\n",
>   ^~~~~~~
> 
> Introduced by commit
> 
>   6a794a27daca ("fsi: master-ast-cf: Add new FSI master using Aspeed ColdFire")
> 
