From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Tue, 20 Jan 2015 13:43:07 -0800
Message-ID: <20150120214307.GA9394@roeck-us.net>
References: <20150120185308.53f4af4e@canb.auug.org.au>
 <20150120165655.GA10904@kria>
 <4237741.ePaG0Gba6D@sifl>
 <20150120175135.GA25973@kria>
 <20150120195432.GH29656@ZenIV.linux.org.uk>
 <20150120204504.GA309@kria>
 <20150120210202.GI29656@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51999 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750822AbbATVnr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jan 2015 16:43:47 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YDgaQ-002meQ-VQ
	for linux-next@vger.kernel.org; Tue, 20 Jan 2015 21:43:47 +0000
Content-Disposition: inline
In-Reply-To: <20150120210202.GI29656@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Sabrina Dubroca <sd@queasysnail.net>, Paul Moore <pmoore@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, Richard Guy Briggs <rgb@redhat.com>

On Tue, Jan 20, 2015 at 09:02:03PM +0000, Al Viro wrote:
> On Tue, Jan 20, 2015 at 09:45:04PM +0100, Sabrina Dubroca wrote:
> 
> > printk(KERN_ERR "fn_lookup %s %d\n", name, retval);
> > 
> > and I get:
> > 
> > [    1.618558] fn_lookup bsg/0:0:0:0 -2
> > [    1.619437] fn_lookup bsg 0
> > [    1.620236] fn_lookup bsg/0:0:0:0 -2
> > [    1.625996] fn_lookup sda 0
> > [    1.626609] fn_lookup sda 0
> > [    1.639007] fn_lookup sda1 0
> > [    1.639691] fn_lookup sda1 0
> > [    1.643656] fn_lookup bsg/1:0:0:0 -2
> > [    1.644974] fn_lookup bsg 0
> > [    1.645928] fn_lookup bsg/1:0:0:0 -2
> > [    1.649483] fn_lookup /dev/ram -2
> > [    1.650424] fn_lookup /dev/root -2
> > [    1.651234] VFS: Cannot open root device "sda1" or unknown-block(8,1): error -2
> 
> That -2 is -ENOENT...  Wait a sec, what's in filename, filename->name and
> what do you get from your printk on kernel with that commit reverted?

On microblaze target:

patch reverted:

name . rv 0
name usr rv 0
name usr/lib rv 0
name usr/share rv 0
name usr/share/udhcpc rv 0
name usr/bin rv 0
name usr/bin/logger rv 0
...

broken:

filename c78a4000 filename->name c78a4014:. name . rv 0
filename c78a4000 filename->name c78a4014:usr name usr rv 0
filename c78a4000 filename->name c78a4014:usr/lib name usr/lib rv -2
filename c78a4000 filename->name c78a4014:usr/share name usr/share rv -2
filename c78a4000 filename->name c78a4014:usr/share/udhcpc name usr/share/udhcpc rv -2
filename c78a4000 filename->name c78a4014:usr/bin name usr/bin rv -2
filename c78ae000 filename->name c78ae014:usr/bin/logger name usr/bin/logger rv -2
...

Guenter
