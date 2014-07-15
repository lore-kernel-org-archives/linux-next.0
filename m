From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: linux-next: manual merge of the char-misc tree with the ia64
 tree
Date: Tue, 15 Jul 2014 15:22:31 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F3285CF7A@ORSMSX114.amr.corp.intel.com>
References: <20140715164349.5807b892@canb.auug.org.au>
 <20140715134458.GB17795@kroah.com> <20140715134920.GC17795@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:31065 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751037AbaGOPWe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Jul 2014 11:22:34 -0400
In-Reply-To: <20140715134920.GC17795@kroah.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "Borislav Petkov (bp@alien8.de)" <bp@alien8.de>
Cc: Arnd Bergmann <arnd@arndb.de>, "Chen, Gong" <gong.chen@linux.intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andreas Noever <andreas.noever@gmail.com>

> Wait, do we really need a drivers/ras directory for one single driver?
> Why not put it in drivers/misc/ instead?  A whole subdir at the top of
> drivers seems overkill and odd.
>
> As it's a memory driver, what about drivers/firmware/ or drivers/edac/
> or drivers/platform?

It isn't really a firmware driver, and definitely not an EDAC driver.

drivers/platform/x86 seems at least plausible.

Adding Boris as drivers/ras was his idea. I think he has plans
for more stuff to go here.

-Tony
