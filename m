From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Tue, 13 Jun 2017 08:20:48 +0200
Message-ID: <20170613062048.GA3123@kroah.com>
References: <20170613160418.655a8f12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170613160418.655a8f12@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 13, 2017 at 04:04:18PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/block/zram/zram_drv.c:1296:28: error: expected ')' before numeric constant
>  static CLASS_ATTR(hot_add, 0400, hot_add_show, NULL);
>                             ^
> drivers/block/zram/zram_drv.c:1330:3: error: 'class_attr_hot_add' undeclared here (not in a function)
>   &class_attr_hot_add.attr,
>    ^
> drivers/block/zram/zram_drv.c:1282:16: warning: 'hot_add_show' defined but not used [-Wunused-function]
>  static ssize_t hot_add_show(struct class *class,
>                 ^
> 
> Caused by commit
> 
>   27104a53d02e ("zram: use class_groups instead of class_attrs")
> 
> I have reverted that commit for today (and commit
> 
>   ecbaa83ee84c ("driver core: remove class_attrs from struct class")
> 
> temporarily so the the tree will build).

Crap I missed one.  I'll go fix that up now so this should work for
tomorrows linux-next, thanks for letting me know.

Odd that 0-day isn't giving me any failed build reports :(

thanks,

greg k-h
