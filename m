From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] sysfs: compile fix, struct file forward declaration
Date: Thu, 20 May 2010 10:36:22 -0700
Message-ID: <20100520173622.GB5927@kroah.com>
References: <20100518164409.8b19c786.sfr@canb.auug.org.au>
 <20100518140226.GB24113@kroah.com>
 <20100518210607.GI8301@sequoia.sous-sol.org>
 <20100518212448.GA31331@kroah.com>
 <20100518223219.GJ8301@sequoia.sous-sol.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:43546 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753640Ab0ETRgc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 May 2010 13:36:32 -0400
Content-Disposition: inline
In-Reply-To: <20100518223219.GJ8301@sequoia.sous-sol.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Wright <chrisw@sous-sol.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 18, 2010 at 03:32:19PM -0700, Chris Wright wrote:
> On Tue, May 18, 2010 at 04:44:09PM +1000, Stephen Rothwell wrote:
> > After merging the driver-core tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > cc1: warnings being treated as errors
> > In file included from include/linux/kobject.h:21,
> >                  from include/linux/device.h:17,
> >                  from arch/powerpc/lib/devres.c:10:
> > include/linux/sysfs.h:97: error: 'struct file' declared inside parameter list
> > include/linux/sysfs.h:97: error: its scope is only this definition or
> > declaration, which is probably not what you want
> > include/linux/sysfs.h:99: error: 'struct file' declared inside parameter list
> > include/linux/sysfs.h:101: error: 'struct file' declared inside parameter list
> > 
> > and many more (arch/powerpc is built with -Werror (as do some other
> > architectures)) and lots of similar warnings ...
> 
> Add missing forward declaration
> 
> Signed-off-by: Chris Wright <chrisw@sous-sol.org>

Thanks, now merged in.

greg k-h
