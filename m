From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the x86
	tree
Date: Wed, 3 Jun 2009 07:59:01 -0700
Message-ID: <20090603145901.GB30890@kroah.com>
References: <20090603171830.b2f80b02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:39099 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754035AbZFCP1K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2009 11:27:10 -0400
Content-Disposition: inline
In-Reply-To: <20090603171830.b2f80b02.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Jan Blunck <jblunck@suse.de>, Dmitry Adamushko <dmitry.adamushko@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Wed, Jun 03, 2009 at 05:18:30PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> arch/x86/kernel/microcode_core.c between commit
> 871b72dd1e12afc3f024479531d25a9339d2e3f9 ("x86: microcode: use
> smp_call_function_single instead of set_cpus_allowed, cleanup of
> synchronization logic") from the x86 tree and commit
> 3b5f472624ad5b54753388bb3c563a8f308eed88 ("Driver Core: misc: add
> nodename support for misc devices") from the driver-core tree.
> 
> Just white space changes overlapping an addition.  I fixed it up (see
> below) and can carry the fix as necessary.

Thanks, I'll watch for this when merging with Linus.

greg k-h
