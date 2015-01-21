From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: tidy up of trees
Date: Wed, 21 Jan 2015 08:37:39 -0500
Message-ID: <20150121083739.1b29cfca@gandalf.local.home>
References: <20150121151009.0cb88a21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0073.hostedemail.com ([216.40.44.73]:43537 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752225AbbAUNhl (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2015 08:37:41 -0500
In-Reply-To: <20150121151009.0cb88a21@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 21 Jan 2015 15:10:09 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> [affected tree contacts are bcc'd on this email]
> 

> kconfig
> Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git#for-next
> 

This is my localmodconfig repo. I only use it when someone points out
something broke or I find a better way of doing something.

It doesn't get updated much because so far, I hear localmodconfig and
localyesconfig are doing everything that people like. It may not ever
get updated again if everyone (including myself) stays happy with it :-)

But in case that changes, and I need to restructure it, this will be
needed again. Should I just let this go out of next, but I'll probably
forget that it does, and still think my for-next branch is active.

If it is any extra burden on you to keep it, then I'm fine with it
falling off the radar. But if it's just "I have X repos in next, and
I'm trying to make it Y", I'd rather keep it in.

Thanks!

-- Steve
