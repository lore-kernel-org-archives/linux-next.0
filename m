From: David Brown <davidb@codeaurora.org>
Subject: Re: linux-next: manual merge of the msm tree with the arm tree
Date: Wed, 02 Feb 2011 14:46:40 -0800
Message-ID: <8yar5bq5a27.fsf@huya.qualcomm.com>
References: <20110131131401.5d6c7646.sfr@canb.auug.org.au>
	<8ya4o8m70jp.fsf@huya.qualcomm.com> <20110202194359.GC27065@kroah.com>
	<20110202200030.GA26104@flint.arm.linux.org.uk>
	<20110202203252.GD28479@kroah.com>
	<20110202204453.GB26104@flint.arm.linux.org.uk>
	<alpine.LFD.2.00.1102021557530.8212@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251]:41281 "EHLO
	wolverine02.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753312Ab1BBWql (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Feb 2011 17:46:41 -0500
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
> Linus directly if they crave for it.  But in this case:
>
> 1) the conflict is obviously simple
>
> 2) the conflict resolution is just as obvious
>
> 3) and Stephen is able and willing to carry this conflict resolution for 
>    the foreseeable future until this all gets merged in mainline.
>
> So... WTF is the actual problem here?

I hadn't really brought this up as a problem, but was mostly wondering
if it was ok to just have Stephen carry the conflict resolution until
the next merge window.  The rest of the comments came from Greg.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
