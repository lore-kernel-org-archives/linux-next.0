From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 14 Dec 2011 23:21:03 -0800
Message-ID: <20111215072103.GA13747@kroah.com>
References: <20111215173754.87103f66f6188693933cb539@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111215173754.87103f66f6188693933cb539@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 15, 2011 at 05:37:54PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/xen/xen-selfballoon.c:305:36: error: expected ')' before '(' token
> drivers/xen/xen-selfballoon.c:327:42: error: expected ')' before '(' token
> drivers/xen/xen-selfballoon.c:349:48: error: expected ')' before '(' token
> 
> etc ...
> 
> [Along with many warnings like:
> 
> drivers/xen/xen-selfballoon.c:284:8: warning: 'struct device_attribute' declared inside parameter list [enabled by default]
> ]
> 
> Presumably caused by commit drivers/xen/xen-selfballoon.c ("xen-balloon:
> convert sysdev_class to a regular subsystem").

Ick, Kay, can you make a fix-up patch?

And here I thought I built xen in my test kernel, crap, sorry about
that.

greg k-h
