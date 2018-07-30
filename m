From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the pm tree
Date: Mon, 30 Jul 2018 10:24:45 +0300
Message-ID: <20180730072445.kt2yxxifx4i7y3fr@paasikivi.fi.intel.com>
References: <20180730120053.62732d27@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180730120053.62732d27@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: linux-next.vger.kernel.org

Hi folks,

On Mon, Jul 30, 2018 at 12:00:53PM +1000, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/media/i2c/mt9v111.c: In function 'mt9v111_set_format':
> drivers/media/i2c/mt9v111.c:887:15: warning: 'idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   unsigned int idx;
>                ^~~
> 
> Introduced by commit
> 
>   aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> 
> Looks like a false positive, but not something that gcc can easily see.

This must be coming from a new driver merged to media tree recently. Thanks
for reporting this.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
