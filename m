From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: Tree for Jun 23
Date: Tue, 23 Jun 2015 05:53:58 -0500
Message-ID: <87twty66gp.fsf@x220.int.ebiederm.org>
References: <20150623181828.1269d960@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:53738 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753437AbbFWK7W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2015 06:59:22 -0400
In-Reply-To: <20150623181828.1269d960@canb.auug.org.au> (Stephen Rothwell's
	message of "Tue, 23 Jun 2015 18:18:28 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Stephen could you please drop the kdbus tree?

There was some significant work that was identified last merge window
that has not yet been done, and who knows when it will be done.
Certainly the recent sd-bus API announcement strongly suggests that
there are no plans to perform such work.

Having the kdbus tree in linux-next with the implicit suggestion that a
pull request will be sent to Linus this merge window before the problems
are addressed and we will have to repeat the mess from last merge window
keeps me up at night.

So to avoid the appearance that the kdbus folks are continuing to
ignoring feedback can we please keep the kdbus tree out of linux-next
until it is ready to be merged?

Thank you,
Eric
