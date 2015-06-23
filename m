From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Jun 23
Date: Tue, 23 Jun 2015 06:59:43 -0700
Message-ID: <20150623135943.GB9454@kroah.com>
References: <20150623181828.1269d960@canb.auug.org.au>
 <87twty66gp.fsf@x220.int.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51427 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933481AbbFWN7p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2015 09:59:45 -0400
Content-Disposition: inline
In-Reply-To: <87twty66gp.fsf@x220.int.ebiederm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 23, 2015 at 05:53:58AM -0500, Eric W. Biederman wrote:
> 
> Stephen could you please drop the kdbus tree?

What?  No, that's not how this works.  That's not how any of this works.

> There was some significant work that was identified last merge window
> that has not yet been done, and who knows when it will be done.
> Certainly the recent sd-bus API announcement strongly suggests that
> there are no plans to perform such work.
> 
> Having the kdbus tree in linux-next with the implicit suggestion that a
> pull request will be sent to Linus this merge window before the problems
> are addressed and we will have to repeat the mess from last merge window
> keeps me up at night.

Code sitting in linux-next keeps you awake?  I think you need to
exercise more so that you can sleep better :)

> So to avoid the appearance that the kdbus folks are continuing to
> ignoring feedback can we please keep the kdbus tree out of linux-next
> until it is ready to be merged?

We are not ignoring _constructive_ feedback, please realize the
difference.

First Andy does a preemptive NAK of a pull request that was never sent,
and now you want to kick it out of linux-next for no valid reason.  If I
was an insecure person, I'd think that there are some people in the
kernel community who don't like me at the moment.

This is just getting ridiculous.

greg k-h
