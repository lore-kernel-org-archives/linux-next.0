From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the input tree
Date: Mon, 23 Jan 2012 22:59:07 -0800
Message-ID: <20120124065907.GA4572@core.coreip.homeip.net>
References: <20120124142516.07860a401ac9216cfa10a6ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:65170 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951Ab2AXG7O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Jan 2012 01:59:14 -0500
Content-Disposition: inline
In-Reply-To: <20120124142516.07860a401ac9216cfa10a6ad@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>

Hi Stephen,

On Tue, Jan 24, 2012 at 02:25:16PM +1100, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> After merging the input tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: ".ktime_get_monotonic_offset" [drivers/input/evdev.ko] undefined!
> 
> Caused by commit 04f2c50e5fd8 ("Input: add infrastructure for selecting
> clockid for event time stamps").
> 
> I have used the input tree from next-20120123 for today.

Sorry about that, I will drop the offending commit for time being.

Thanks.

-- 
Dmitry
