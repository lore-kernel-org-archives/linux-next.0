From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Linus' tree build warnings
Date: Mon, 2 Mar 2009 09:37:19 +0100
Message-ID: <20090302083719.GA6040@elte.hu>
References: <20090302183511.a1415086.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:40894 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756605AbZCBIhd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Mar 2009 03:37:33 -0500
Content-Disposition: inline
In-Reply-To: <20090302183511.a1415086.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Suresh Siddha <suresh.b.siddha@intel.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (i386 defconfig) produced these warnings:
> 
> In file included from drivers/gpu/drm/i915/i915_drv.h:36,
>                  from drivers/gpu/drm/i915/i915_drv.c:35:
> include/linux/io-mapping.h: In function 'io_mapping_map_wc':
> include/linux/io-mapping.h:95: warning: ISO C90 forbids mixed declarations and code
> 
> And several more of the same.

yes, a patch for that was already sent.

	Ingo
