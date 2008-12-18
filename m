From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next:  rr series import failure
Date: Thu, 18 Dec 2008 11:14:07 +1030
Message-ID: <200812181114.07643.rusty@rustcorp.com.au>
References: <20081218105019.6f564a38.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:37350 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752547AbYLRAoM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 19:44:12 -0500
In-Reply-To: <20081218105019.6f564a38.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

On Thursday 18 December 2008 10:20:19 Stephen Rothwell wrote:
> Hi Rusty,
...
> cpumask:add_sysfs_displays_for_configured_and_disabled_cpu_maps.patch
> error: patch failed: arch/x86/kernel/smpboot.c:1293
> error: arch/x86/kernel/smpboot.c: patch does not apply

Ah, yes, it needs a prereq which I didn't include.  Mike is polishing
this at Greg's behest anyway, so I'll leave it for the moment.

(Mike, in future the x86 part of this patch, even though it's a 1-liner,
should probably be a separate patch).

Thanks,
Rusty.
