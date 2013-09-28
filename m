From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Date: Fri, 27 Sep 2013 18:04:02 -0700
Message-ID: <20130928010402.GA22939@kroah.com>
References: <20130927171029.609cf783d3f9645ebe7117c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130927171029.609cf783d3f9645ebe7117c0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Sudeep Dutt <sudeep.dutt@intel.com>, Dasaratharaman Chandramouli <dasaratharaman.chandramouli@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Caz Yokoyama <Caz.Yokoyama@intel.com>, Harshavardhan R Kharche <harshavardhan.r.kharche@intel.com>, Nikhil Rao <nikhil.rao@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 27, 2013 at 05:10:29PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/misc/mic/host/mic_main.c: In function 'mic_probe':
> drivers/misc/mic/host/mic_main.c:320:3: error: too many arguments to function 'sysfs_get_dirent'
>    NULL, "state");
>    ^
> In file included from include/linux/kobject.h:21:0,
>                  from include/linux/module.h:16,
>                  from drivers/misc/mic/host/mic_main.c:26:
> include/linux/sysfs.h:465:1: note: declared here
>  sysfs_get_dirent(struct sysfs_dirent *parent_sd, const unsigned char *name)
>  ^
> 
> Caused by commit 3a6a9201897c ("Intel MIC Host Driver, card OS state
> management") interacting with commit 388975cccaaf ("sysfs: clean up
> sysfs_get_dirent()") from the driver-core tree.
> 
> I added this merge fix patch:

That looks correct, thanks, I'll carry this along to handle the merge
issue when it all goes to Linus.

greg k-h
