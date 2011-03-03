From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] staging/brcm80211: fix printk format warnings
Date: Thu, 03 Mar 2011 08:08:36 -0800
Message-ID: <4D6FBD04.6090702@oracle.com>
References: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au> <20110301162948.34c28d6e.randy.dunlap@oracle.com> <20110302210511.GA20798@kroah.com> <20110303103620.6b3c463f.sfr@canb.auug.org.au> <20110303072028.GA21427@sdf-MacBook>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:40523 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707Ab1CCQJM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2011 11:09:12 -0500
In-Reply-To: <20110303072028.GA21427@sdf-MacBook>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, driverdevel <devel@driverdev.osuosl.org>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 03/02/11 23:20, Stanislav Fomichev wrote:
>> Maybe due to conflict resolutions in my tree (assuming that Randy based
>> his patch in linux-next).
> We don't have brcm80211/sys/ directory (it was renamed to
> brcm80211/brcmsmac); so it's based on the wrong/outdated tree.

It was based on linux-next of 2011-0301, which is what the patch email
was in reply to.

> And I suppose these errors are already fixed.

Good to know.  Thanks.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
