From: Pavel Machek <pavel@suse.cz>
Subject: Re: linux-next: leds tree build failure
Date: Tue, 21 Oct 2008 10:19:10 +0200
Message-ID: <20081021081909.GA15782@atrey.karlin.mff.cuni.cz>
References: <20081021154722.fa74b698.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41915 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751625AbYJUITL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Oct 2008 04:19:11 -0400
Content-Disposition: inline
In-Reply-To: <20081021154722.fa74b698.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-next@vger.kernel.org, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>

> Hi Richard,
> 
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

ACK. (And thanks!)
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
