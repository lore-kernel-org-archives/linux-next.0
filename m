From: Richard Purdie <rpurdie@rpsys.net>
Subject: Re: linux-next: leds tree build failure
Date: Thu, 23 Oct 2008 22:46:13 +0100
Message-ID: <1224798373.5427.79.camel@dax.rpnet.com>
References: <20081021154722.fa74b698.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tim.rpsys.net ([194.106.48.114]:49773 "EHLO tim.rpsys.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754026AbYJWVqz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 17:46:55 -0400
In-Reply-To: <20081021154722.fa74b698.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Pavel Machek <pavel@suse.cz>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Stephen,

On Tue, 2008-10-21 at 15:47 +1100, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/leds/leds-hp-disk.c: In function 'hpled_add':
> drivers/leds/leds-hp-disk.c:101: error: invalid lvalue in assignment
> 
> Caused by commit 9c78ff6e65cad9f9fcf0bbde2bfbbf3a544fb704 ("leds: Add
> driver for HP harddisk protection LEDs") from the leds tree inertacting
> with commit db89b4f0dbab837d0f3de2c3e9427a8d5393afa3 ("ACPI: catch calls
> of acpi_driver_data on pointer of wrong type") from the acpi tree.
> 
> I fixed it up (see below).

Thanks for spotting that and fixing. I've added the fix to the tree
before I sent the pull request.

Cheers,

Richard
