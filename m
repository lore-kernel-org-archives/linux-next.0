From: Andi Kleen <andi@firstfloor.org>
Subject: Re: linux-next: acpi tree build failure
Date: Tue, 12 Aug 2008 09:06:58 +0200
Message-ID: <20080812070658.GY9038@one.firstfloor.org>
References: <20080812131613.e3dfb2f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:51622 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751457AbYHLHFu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2008 03:05:50 -0400
Content-Disposition: inline
In-Reply-To: <20080812131613.e3dfb2f5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andi Kleen <andi@firstfloor.org>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>, stable@kernel.org

On Tue, Aug 12, 2008 at 01:16:13PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/misc/acer-wmi.c: In function 'set_u32':
> drivers/misc/acer-wmi.c:831: error: 'status' undeclared (first use in this function)
> 
> Caused by commit 70ea586cc54ab2fb2af42d7ee97ba4f26e315f45 ("acer-wmi: Fix
> wireless and bluetooth on early AMW0 v2 laptops").
> 
> Clearly, this hasn't even been build tested.  A bit more care, please.

It has, but the ACER_WMI option got disabled for unknown reasons in the
test builds :/

Thanks, will fix.

-Andi
