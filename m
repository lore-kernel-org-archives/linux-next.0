From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next:als tree build failure
Date: Thu, 28 Jan 2010 08:41:07 +0100
Message-ID: <20100128084107.682db589@hyperion.delvare>
References: <20100128182334.7226bdf6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bamako.nerim.net ([62.4.17.28]:54830 "EHLO bamako.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755043Ab0A1HlK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Jan 2010 02:41:10 -0500
In-Reply-To: <20100128182334.7226bdf6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, Zhang Rui <rui.zhang@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 28 Jan 2010 18:23:34 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc allnoconfig) failed like this:
> 
> ld: drivers/i2c/chips/built-in.o: No such file: No such file or directory
> 
> Caused by commit b75349f118718a435f2bb7b6e675572ecd591627 ("tsl2550: Move
> form i2c/chips to als and update interfaces").  This removes the last
> driver from drivers/i2c/chips/ .  Maybe it needs to remove the directory
> completely and the references to it from drivers/i2c as well.
> 
> I have reverted that commit for today.

My bad. I asked Jonathan to split the directory removal from the driver
move for clarity. I didn't expect this to cause a build failure.

Jonathan, I guess that at least the drivers/i2c/Makefile part must be
moved back to the tsl2550 driver move patch. I leave it to you whether
you want to move all the rest back as well, or just that part.

Thanks Stephen for the heads up and sorry again for the breakage.

-- 
Jean Delvare
