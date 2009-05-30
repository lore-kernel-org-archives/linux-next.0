From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: 20090529: sysfs/reiserfs: possible circular locking dependency
Date: Sat, 30 May 2009 18:14:20 +0200
Message-ID: <20090530161418.GC5969@nowhere>
References: <a4423d670905300833v7ed43bd1p22de438bbc4e69ac@mail.gmail.com> <20090530155641.GA11360@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:47166 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752298AbZE3QOW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 May 2009 12:14:22 -0400
Received: by ewy24 with SMTP id 24so6909679ewy.37
        for <linux-next@vger.kernel.org>; Sat, 30 May 2009 09:14:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20090530155641.GA11360@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, linux-next <linux-next@vger.kernel.org>

On Sat, May 30, 2009 at 08:56:41AM -0700, Greg KH wrote:
> On Sat, May 30, 2009 at 07:33:03PM +0400, Alexander Beregalov wrote:
> > Hi
> > 
> > Here is a boot process.
> > 
> > udev: starting version 141
> > [ INFO: possible circular locking dependency detected ]
> > 2.6.30-rc7-next-20090529-06589-g7701864 #6
> 
> Is this a new thing?  I have not changed any sysfs code in -next in a
> while.  Has there been any reiserfs changes?


Hm, may be yes. I will have a close look at it.

Thanks.


> 
> thanks,
> 
> greg k-h
