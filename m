From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the tip
 tree
Date: Thu, 31 Jul 2014 17:20:17 -0700
Message-ID: <20140801002017.GA2945@kroah.com>
References: <20140731170735.5cf2062b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37162 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751759AbaHAAUt (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2014 20:20:49 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by gateway1.nyi.internal (Postfix) with ESMTP id BDDB821DF5
	for <linux-next@vger.kernel.org>; Thu, 31 Jul 2014 20:20:46 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140731170735.5cf2062b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, David Riley <davidriley@chromium.org>, John Stultz <john.stultz@linaro.org>

On Thu, Jul 31, 2014 at 05:07:35PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> lib/Kconfig.debug between commit e704f93af5a0 ("kernel: time: Add
> udelay_test module to validate udelay") from the tip tree and commit
> 0a8adf584759 ("test: add firmware_class loader test") from the
> driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
