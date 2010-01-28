From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: linux-next:als tree build failure
Date: Thu, 28 Jan 2010 11:59:37 +0000
Message-ID: <4B617C29.6010300@cam.ac.uk>
References: <20100128182334.7226bdf6.sfr@canb.auug.org.au> <20100128084107.682db589@hyperion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ppsw-5.csi.cam.ac.uk ([131.111.8.135]:51316 "EHLO
	ppsw-5.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483Ab0A1L6L (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Jan 2010 06:58:11 -0500
In-Reply-To: <20100128084107.682db589@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Zhang Rui <rui.zhang@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 01/28/10 07:41, Jean Delvare wrote:
> On Thu, 28 Jan 2010 18:23:34 +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next build (powerpc allnoconfig) failed like this:
>>
>> ld: drivers/i2c/chips/built-in.o: No such file: No such file or directory
>>
>> Caused by commit b75349f118718a435f2bb7b6e675572ecd591627 ("tsl2550: Move
>> form i2c/chips to als and update interfaces").  This removes the last
>> driver from drivers/i2c/chips/ .  Maybe it needs to remove the directory
>> completely and the references to it from drivers/i2c as well.
>>
>> I have reverted that commit for today.
> 
> My bad. I asked Jonathan to split the directory removal from the driver
> move for clarity. I didn't expect this to cause a build failure.
> 
> Jonathan, I guess that at least the drivers/i2c/Makefile part must be
> moved back to the tsl2550 driver move patch. I leave it to you whether
> you want to move all the rest back as well, or just that part.
> 
> Thanks Stephen for the heads up and sorry again for the breakage.
> 
Sorry from me as well.  It never occurred to me either that it might cause
a build failure.

It does make sense to keep these two steps separate.  Ah well, I guess any
work around would be a pretty terrible cludge.  I'll roll these two patches
back together and otherwise we will end up with something even less coherent.

Thanks,

Jonathan
