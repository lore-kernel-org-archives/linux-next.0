From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the tip tree
Date: Mon, 17 Mar 2014 11:30:43 -0700
Message-ID: <20140317183043.GC10565@kroah.com>
References: <20140317183419.f0ac20789cdfca0ad7d93c48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:32935 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932592AbaCQS2n (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Mar 2014 14:28:43 -0400
Content-Disposition: inline
In-Reply-To: <20140317183419.f0ac20789cdfca0ad7d93c48@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Magnus Damm <damm@opensource.se>, Daniel Lezcano <daniel.lezcano@linaro.org>, Wolfram Sang <wsa@sang-engineering.com>

On Mon, Mar 17, 2014 at 06:34:19PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> arch/sh/Kconfig between commit fbfa893458ed ("sh: Remove Kconfig entries
> for TMU, CMT and MTU2") from the tip tree and commit f6723b569a67 ("usb:
> host: remove selects of USB_ARCH_HAS_?HCI") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
