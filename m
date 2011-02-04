From: David Brown <davidb@codeaurora.org>
Subject: Re: linux-next: manual merge of the msm tree with the arm tree
Date: Fri, 04 Feb 2011 10:02:19 -0800
Message-ID: <8yaei7n1xw4.fsf@huya.qualcomm.com>
References: <20110131131401.5d6c7646.sfr@canb.auug.org.au>
	<8ya4o8m70jp.fsf@huya.qualcomm.com> <20110202194359.GC27065@kroah.com>
	<20110202200030.GA26104@flint.arm.linux.org.uk>
	<20110202203252.GD28479@kroah.com>
	<20110202204453.GB26104@flint.arm.linux.org.uk>
	<alpine.LFD.2.00.1102021557530.8212@xanadu.home>
	<1296839855.4078.12.camel@m0nster>
	<20110204174244.GA7396@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20110204174244.GA7396@flint.arm.linux.org.uk> (Russell King's
	message of "Fri, 4 Feb 2011 17:42:44 +0000")
Sender: linux-arm-msm-owner@vger.kernel.org
To: Russell King <rmk@arm.linux.org.uk>
Cc: Daniel Walker <dwalker@codeaurora.org>, Nicolas Pitre <nico@fluxnic.net>, Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Stepan Moskovchenko <stepanm@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Feb 04 2011, Russell King wrote:

> I really don't care which - but I'll warn you that keeping changes
> hidden will result in a reduction of patch quality, and much much
> much less testing of those changes.  And I won't care at all when you
> complain that MSM's broken because of one of my patches.
>
> Exactly what would you prefer?

I'd like to get a little bit of an idea what you would prefer me to do.

I see two reasonable workflows:

  - I make a branch for the files that conflict with other changes in
    the ARM tree and submit pull requests to you (Russell) for these
    changes.  Other MSM-specific changes would be in another tree that
    goes to Linus.

  - I submit everything via pull requests to you.  This would probably
    result in one additional request to you, that contained the stuff
    that didn't conflict, since it would be nice to resolve the obvious
    conflicts earlier.

The later is more work for you, and less for Linus.

Thanks,
David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
