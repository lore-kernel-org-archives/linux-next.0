From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Fri, 17 Aug 2012 06:25:31 -0700
Message-ID: <20120817132531.GD28980@kroah.com>
References: <20120817140123.56bf158c14abc8fc0147bd67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:50732 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751287Ab2HQNZd (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Aug 2012 09:25:33 -0400
Content-Disposition: inline
In-Reply-To: <20120817140123.56bf158c14abc8fc0147bd67@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <ming.lei@canonical.com>

On Fri, Aug 17, 2012 at 02:01:23PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "device_pm_lock" [drivers/base/firmware_class.ko] undefined!
> ERROR: "dpm_list" [drivers/base/firmware_class.ko] undefined!
> ERROR: "device_pm_unlock" [drivers/base/firmware_class.ko] undefined!
> 
> Caused by commit 37276a51f803 ("firmware: introduce
> device_cache/uncache_fw_images").

Thanks, known bug, Ming is working on resolving the issue.

greg k-h
