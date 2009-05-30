From: Greg KH <gregkh@suse.de>
Subject: Re: 20090529: sysfs/reiserfs: possible circular locking dependency
Date: Sat, 30 May 2009 08:56:41 -0700
Message-ID: <20090530155641.GA11360@suse.de>
References: <a4423d670905300833v7ed43bd1p22de438bbc4e69ac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55635 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759423AbZE3QDE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 30 May 2009 12:03:04 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670905300833v7ed43bd1p22de438bbc4e69ac@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>

On Sat, May 30, 2009 at 07:33:03PM +0400, Alexander Beregalov wrote:
> Hi
> 
> Here is a boot process.
> 
> udev: starting version 141
> [ INFO: possible circular locking dependency detected ]
> 2.6.30-rc7-next-20090529-06589-g7701864 #6

Is this a new thing?  I have not changed any sysfs code in -next in a
while.  Has there been any reiserfs changes?

thanks,

greg k-h
