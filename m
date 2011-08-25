From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH] tty/powerpc: fix build break with ehv_bytechan.c on allyesconfig
Date: Thu, 25 Aug 2011 13:51:20 -0500
Message-ID: <4E5699A8.1070708@freescale.com>
References: <1314289245-14946-1-git-send-email-timur@freescale.com> <20110825163234.GA31629@kroah.com> <4E568E19.405@freescale.com> <20110825184655.GB1891@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]:27748
	"EHLO VA3EHSOBE010.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755273Ab1HYSvf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Aug 2011 14:51:35 -0400
In-Reply-To: <20110825184655.GB1891@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

Greg KH wrote:
> But don't you really want this type of check at runtime?  What happens
> if you load this driver on a machine that is not a guest?  Will things
> break?  Shouldn't you still refuse to load somehow?

This is in the udbg code, which falls under the category of, "turn this on only
if you know what you're doing."

The udbg code runs very early, before the device tree is available.  There's no
way of knowing at this point whether or not we're running under a hypervisor.
If you turn on udbg support, then it means that you're trying to do some very
specific debugging on a specific platform.

So I'm not removing this code just to fix the build break.  It really should
never have been there in the first place.

-- 
Timur Tabi
Linux kernel developer at Freescale
