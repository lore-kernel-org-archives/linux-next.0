From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: linux-next:als tree build failure
Date: Thu, 28 Jan 2010 12:33:22 +0000
Message-ID: <4B618412.30704@cam.ac.uk>
References: <20100128182334.7226bdf6.sfr@canb.auug.org.au>	<20100128084107.682db589@hyperion.delvare>	<4B617C29.6010300@cam.ac.uk> <20100128231750.1dd29044.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ppsw-7.csi.cam.ac.uk ([131.111.8.137]:57500 "EHLO
	ppsw-7.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753370Ab0A1Mbz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Jan 2010 07:31:55 -0500
In-Reply-To: <20100128231750.1dd29044.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jean Delvare <khali@linux-fr.org>, Zhang Rui <rui.zhang@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 01/28/10 12:17, Stephen Rothwell wrote:
> Hi Jonathan, Jean,
> 
> On Thu, 28 Jan 2010 11:59:37 +0000 Jonathan Cameron <jic23@cam.ac.uk> wrote:
>>
>> It does make sense to keep these two steps separate.  Ah well, I guess any
>> work around would be a pretty terrible cludge.  I'll roll these two patches
>> back together and otherwise we will end up with something even less coherent.
> 
> OK, thanks guys.
> 
Everything should now be fixed in the als tree.  New version of the move commit
cleans out the i2c/chips directory and changes the i2c/Makefile and i2c/Kconfig
appropriately.  Only remaining related elements are the debug Kconfig option for
i2c/chips but that can definitely go through the i2c tree rather than als (if there
are no other users) and shouldn't break any builds.

Thanks,

Jonathan
