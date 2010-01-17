From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 14 (drm header files)
Date: Sun, 17 Jan 2010 15:17:18 -0800
Message-ID: <20100117151718.f88c5f21.randy.dunlap@oracle.com>
References: <20100114172047.406ebda8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:37550 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754121Ab0AQXR7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 17 Jan 2010 18:17:59 -0500
In-Reply-To: <20100114172047.406ebda8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 14 Jan 2010 17:20:47 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100113:


Is anything being done about these?
or does anything need to be done?


usr/include/drm/drm_mode.h:84: found __[us]{8,16,32,64} type without #include <linux/types.h>
usr/include/drm/i915_drm.h:119: found __[us]{8,16,32,64} type without #include <linux/types.h>
usr/include/drm/mga_drm.h:260: found __[us]{8,16,32,64} type without #include <linux/types.h>
usr/include/drm/radeon_drm.h:758: found __[us]{8,16,32,64} type without #include <linux/types.h>
usr/include/drm/via_drm.h:117: found __[us]{8,16,32,64} type without #include <linux/types.h>


Thanks,
---
~Randy
