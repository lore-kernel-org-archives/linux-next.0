From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 72/79] sysdev: Pass the attribute to the low level
	sysdev show/store function
Date: Tue, 22 Jul 2008 21:22:18 -0700
Message-ID: <20080723042218.GA6784@suse.de>
References: <20080722051805.GA17373@suse.de> <1216703983-21448-72-git-send-email-gregkh@suse.de> <20080722134045.7f09ff29.akpm@linux-foundation.org> <20080722204939.GA3028@suse.de> <20080722140301.2a334f8c.akpm@linux-foundation.org> <20080722211919.GA5669@suse.de> <20080723130435.7a79f7e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.suse.de ([195.135.220.2]:44550 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752332AbYGWEdG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 00:33:06 -0400
Content-Disposition: inline
In-Reply-To: <20080723130435.7a79f7e4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, andi@firstfloor.org, ak@linux.intel.com, mingo@elte.hu, tiwai@suse.de, linux-next@vger.kernel.org

On Wed, Jul 23, 2008 at 01:04:35PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Tue, 22 Jul 2008 14:19:19 -0700 Greg KH <gregkh@suse.de> wrote:
> >
> > Andi any thoughts?
> 
> The patch
> (sysdev-pass-the-attribute-to-the-low-level-sysdev-show-store-function.patch)
> has existed in the driver-core part of linux-next since July 4, but the
> kernel/sched.c part only got added yesterday.

That came from the updated version that Andi sent me to fix the sparc64
build problems the original version had.

Stephen, thanks for diging this out.

greg k-h
