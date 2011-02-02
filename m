From: David Brown <davidb@codeaurora.org>
Subject: Re: linux-next: manual merge of the msm tree with the arm tree
Date: Wed, 02 Feb 2011 14:59:16 -0800
Message-ID: <8yaipx259h7.fsf@huya.qualcomm.com>
References: <20110131131401.5d6c7646.sfr@canb.auug.org.au>
	<8ya4o8m70jp.fsf@huya.qualcomm.com> <20110202194359.GC27065@kroah.com>
	<20110202200030.GA26104@flint.arm.linux.org.uk>
	<20110202203252.GD28479@kroah.com>
	<20110202204453.GB26104@flint.arm.linux.org.uk>
	<alpine.LFD.2.00.1102021557530.8212@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251]:33260 "EHLO
	wolverine02.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755268Ab1BBW7R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Feb 2011 17:59:17 -0500
In-Reply-To: <alpine.LFD.2.00.1102021557530.8212@xanadu.home> (Nicolas Pitre's
	message of "Wed, 02 Feb 2011 16:47:12 -0500 (EST)")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Greg KH <greg@kroah.com>, Russell King <rmk@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Stepan Moskovchenko <stepanm@codeaurora.org>

On Wed, Feb 02 2011, Nicolas Pitre wrote:

> The actual problem here is that some people, notably the msm folks, are 
> bypassing the maintainer hierarchy and going straight to Linus for their 
> pull requests instead of asking RMK to pull.  We once debated this at 
> some point and it was agreed that completely independent SOC specific 
> code with no dependencies on the common ARM code _could_ go straight to 
> Linus directly if they crave for it.

I also have no real problem sending pull requests to RMK instead of
Linus, as long as it isn't a pain.  Linus gives clear directions as to
how his tree works, and when he expects what kinds of pull requests.
Weird web-based patch tracking systems are a pain.  Pull requests from
git with a fairly easy way to know when they've been pulled are not.

I also find that http://ftp.arm.linux.org.uk/ is frequently
inaccessable, and usually slow.

As it stands, so far, it's been a lot less work for me to send directly
to Linus, and resolve the issues that come up when they do.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
