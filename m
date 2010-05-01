From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging-next tree
Date: Sat, 1 May 2010 10:48:53 -0700
Message-ID: <20100501174853.GA22217@kroah.com>
References: <20100430155205.a4171034.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100430155205.a4171034.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Thery <benjamin.thery@bull.net>, NeilBrown <neilb@suse.de>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 30, 2010 at 03:52:05PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/md/md.c: In function 'level_store':
> drivers/md/md.c:3029: error: too few arguments to function 'sysfs_get_dirent'
> 
> Caused by commit 262f8e4937e7b4a587923ca3c039a184668f49ec ("sysfs:
> Implement sysfs tagged directory support") from the driver-core tree
> interacting with commit fecc531e3cc0de60514d326c7d82f1075ed55888 ("md:
> manage redundancy group in sysfs when changing level") from the md.
> 
> I have applied this fixup patch for today and can carry it as necessary.

Thanks, that would be great.

> [This could have been avoided, of course, by creating a new API (maybe
> sysfs_get_dirent_tagged) and implementing the old API in terms of that].

Hm Eric, any thoughts?

thanks,

greg k-h
