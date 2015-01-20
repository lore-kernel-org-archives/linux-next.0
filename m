From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Tue, 20 Jan 2015 14:13:09 -0800
Message-ID: <20150120221309.GA18589@roeck-us.net>
References: <20150120185308.53f4af4e@canb.auug.org.au>
 <20150120165655.GA10904@kria>
 <4237741.ePaG0Gba6D@sifl>
 <20150120175135.GA25973@kria>
 <20150120195432.GH29656@ZenIV.linux.org.uk>
 <20150120204504.GA309@kria>
 <20150120210202.GI29656@ZenIV.linux.org.uk>
 <20150120220823.GB18129@kria>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57445 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037AbbATWNp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jan 2015 17:13:45 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YDh3R-0033LG-M2
	for linux-next@vger.kernel.org; Tue, 20 Jan 2015 22:13:45 +0000
Content-Disposition: inline
In-Reply-To: <20150120220823.GB18129@kria>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Paul Moore <pmoore@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, Richard Guy Briggs <rgb@redhat.com>

On Tue, Jan 20, 2015 at 11:08:23PM +0100, Sabrina Dubroca wrote:
> 2015-01-20, 21:58:31 +0000, Al Viro wrote:
> > On Tue, Jan 20, 2015 at 10:38:58PM +0100, Sabrina Dubroca wrote:
> > 
> > > [    1.538646] fn_lookup bsg/0:0:0:0 -2, ffff88001f718000 bsg/0:0:0:0
> > > [    1.539704] fn_lookup bsg 0, ffff88001f718000 bsg
> > > [    1.540559] fn_lookup bsg/0:0:0:0 -2, ffff88001f718000 bsg/0:0:0:0
> > > [    1.552611] fn_lookup bsg/1:0:0:0 -2, ffff88001f718000 bsg/1:0:0:0
> > > [    1.553689] fn_lookup bsg 0, ffff88001f718000 bsg
> > > [    1.554505] fn_lookup bsg/1:0:0:0 -2, ffff88001f718000 bsg/1:0:0:0
> > > [    1.557554] fn_lookup sda 0, ffff88001f718000 sda
> > > [    1.558368] fn_lookup sda 0, ffff88001f718000 sda
> > > [    1.564190] fn_lookup sda1 0, ffff88001f718000 sda1
> > > [    1.565008] fn_lookup sda1 0, ffff88001f718000 sda1
> > > [    1.570751] fn_lookup /dev/ram -2, ffff88001f71a300 /dev/ram
> > > [    1.571786] fn_lookup /dev/root -2, ffff88001f71b480 /dev/root
> > 
> > Nuts...  Is reverting just this (do_path_lookup()) part of commit sufficient
> > to recover the normal behaviour?
> 
> Yes.
> 
Same on microblaze.

Guenter
