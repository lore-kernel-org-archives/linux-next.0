From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Problem with tty changes in linux-next
Date: Tue, 6 Jul 2010 17:35:02 +0200
Message-ID: <201007061735.02881.arnd@arndb.de>
References: <20100706130403.GD3991@pengutronix.de> <201007061623.48363.arnd@arndb.de> <20100706151454.GB12444@suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:53897 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752460Ab0GFPfO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Jul 2010 11:35:14 -0400
In-Reply-To: <20100706151454.GB12444@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Luotao Fu <l.fu@pengutronix.de>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Weisbecker <fweisbec@gmail.com>, Ilya Dryomov <idryomov@gmail.com>

On Tuesday 06 July 2010 17:14:54 Greg KH wrote:
> I should get to this today and push it into the next
> linux-next release.

Ok, thanks!

On Tuesday 06 July 2010 16:40:52 Ilya Dryomov wrote:
> I had the same issue. Here is the patch:
> 
> https://patchwork.kernel.org/patch/108700/

Yes, that's the one. It would be good to get another confirmation
from Luotao Fu that this fixes all the problems with missing characters.
As I mentioned, the boot-time warning will get taken care of by
a different patch, but can be safely ignored.

	Arnd 
