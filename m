From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next:  rr series import failure
Date: Thu, 18 Dec 2008 11:19:16 +1030
Message-ID: <200812181119.16550.rusty@rustcorp.com.au>
References: <20081218105019.6f564a38.sfr@canb.auug.org.au> <494998ED.6080206@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:54370 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752558AbYLRAtT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 19:49:19 -0500
In-Reply-To: <494998ED.6080206@sgi.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Greg KH <gregkh@suse.de>

On Thursday 18 December 2008 10:57:25 Mike Travis wrote:
> > cpumask:add_sysfs_displays_for_configured_and_disabled_cpu_maps.patch
> Rusty - do you want to do this in your rr queue?

Once Greg's happy and Ack'ed, and we've run it through normal tests, I'll
put it in the cpumask git tree and Ingo can simply merge it from there.

Thanks,
Rusty.
