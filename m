From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 22
Date: Tue, 22 Oct 2013 12:24:03 -0700
Message-ID: <20131022192403.GB28630@roeck-us.net>
References: <1382454517-4074-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:52949 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753971Ab3JVTYL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2013 15:24:11 -0400
Content-Disposition: inline
In-Reply-To: <1382454517-4074-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>

On Tue, Oct 22, 2013 at 05:08:34PM +0200, Thierry Reding wrote:
> Hi all,
> 
> I've uploaded today's linux-next tree to the master branch of the
> repository below:
> 
>         git://gitorious.org/thierryreding/linux-next.git
> 
> A next-20131022 tag is also provided for convenience.
> 
> Gained a couple new conflicts, fixed more build failures. ARM seems to
> be in pretty good shape, as is the 64-bit x86 allmodconfig.
> 

x86_64:defconfig, i386:allyesconfig and i386:allmodconfig fail to build.

lib/built-in.o: In function `trace_swiotlb_bounced':
include/trace/events/swiotlb.h:9: undefined reference to `__tracepoint_swiotlb_bounced'

and

lib/built-in.o: In function `swiotlb_map_page':
(.text+0x10c94): undefined reference to `__tracepoint_swiotlb_bounced'

arm:allmodconfig fails as well, currently with

arch/arm/common/bL_switcher.c: In function 'bL_switcher_enable':
arch/arm/common/bL_switcher.c:580:2: error: implicit declaration of function
'cpu_hotplug_driver_lock' [-Werror=implicit-function-declaration]
arch/arm/common/bL_switcher.c:582:3: error: implicit declaration of function
'cpu_hotplug_driver_unlock' [-Werror=implicit-function-declaration]

Overall, failures are up to
	total: 110 pass: 88 skipped: 4 fail: 18
from 14 failures yesterday.

Guenter
