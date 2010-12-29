From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree (input
 tree related)
Date: Tue, 28 Dec 2010 18:34:58 -0800
Message-ID: <20101229023457.GA4206@core.coreip.homeip.net>
References: <20101229125129.d48fb6fc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:51390 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524Ab0L2CfG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Dec 2010 21:35:06 -0500
Content-Disposition: inline
In-Reply-To: <20101229125129.d48fb6fc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ping Cheng <pinglinux@gmail.com>

On Wed, Dec 29, 2010 at 12:51:29PM +1100, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/input/touchscreen/wacom_w8001.c: In function 'w8001_setup':
> drivers/input/touchscreen/wacom_w8001.c:287: error: implicit declaration of function 'mdelay'
> 
> Caused by commit b8fe15cb1b435928f9967d660e925fe7afb32787 ("Input:
> wacom_w8001 - support pen or touch only devices").  See Rule 1 in
> Documentation/SubmitChecklist.
> 
> I have reverted that commit for today.

Thank you Stephen, I'll fix this up in my tree.

-- 
Dmitry
