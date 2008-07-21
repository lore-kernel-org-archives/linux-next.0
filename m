From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: Tree for July 8 (HID)
Date: Mon, 21 Jul 2008 17:55:15 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807211754140.3037@jikos.suse.cz>
References: <20080708192251.3275d283.sfr@canb.auug.org.au> <20080708111649.e61b19bc.randy.dunlap@oracle.com> <alpine.LNX.1.10.0807090954480.25171@jikos.suse.cz> <20080718153732.d79f7d9f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:54677 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751152AbYGUPzQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 11:55:16 -0400
In-Reply-To: <20080718153732.d79f7d9f.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Jiri Slaby <jslaby@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, Pascal Terjan <pterjan@mandriva.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 18 Jul 2008, Randy Dunlap wrote:

>> The dependency of usbkbd/usbmouse on usbhid is strange anyway. I'd 
>> probably remove the whole quirk lookup thing from usbkbd/usbmouse 
>> drivers. They introduce this ugly dependency, which is not worth it I 
>> guess. Also usbkbd/usbmouse drivers are not needed in the vast majority 
>> of cases anyway, and they shouldn't be loaded in standard 
>> configurations at all.
> Build error still present in linux-next 20080718.
> Please fix it in some manner.

OK, I have just completely removed the quirk lookup from usbmouse/usbkbd 
drivers. So this should be fixed in next -next.

Thanks,

-- 
Jiri Kosina
SUSE Labs
