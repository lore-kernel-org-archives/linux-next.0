From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: Kconfig HID dependency error from roccat merge
Date: Tue, 3 Jul 2012 11:23:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1207031123050.17304@pobox.suse.cz>
References: <20120703042920.GC7328@windriver.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55762 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753153Ab2GCJXw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Jul 2012 05:23:52 -0400
In-Reply-To: <20120703042920.GC7328@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org

On Tue, 3 Jul 2012, Paul Gortmaker wrote:

> This is showing up in all the linux-next builds since Monday.
> 
> -------------
> drivers/hid/Kconfig:7:error: recursive dependency detected!
> drivers/hid/Kconfig:7:	symbol HID is selected by USB_HID
> drivers/hid/usbhid/Kconfig:4:	symbol USB_HID depends on HID
> ------------
> 
> It can be easily reproduced by doing a simple x86-64 defconfig.
> I've traced (bisected) it to this:
> 
> -------------
> commit 71e9fd494490cdb7ae9b7f7c16ee5dd5760bbc23
> Merge: ccfa24b 7392d73
> Author: Jiri Kosina <jkosina@suse.cz>
> Date:   Fri Jun 29 15:02:22 2012 +0200
> 
>     Merge branch 'roccat' into for-next
> 
>     Conflicts:
>         drivers/hid/Kconfig
> -------------
> 
> Please have a look at it when you have a chance.

Yes, sorry for that, already reported to me by several people. I have 
messed up the conflict resolution. I have just pushed out fixed for-next 
branch, so it should show up in the next -next :) release properly.

Thanks,

-- 
Jiri Kosina
SUSE Labs
