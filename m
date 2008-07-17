From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/3] proc: make grab_header static
Date: Thu, 17 Jul 2008 15:38:32 -0700
Message-ID: <20080717153832.64928d89.akpm@linux-foundation.org>
References: <1216329755.6029.31.camel@brick>
	<20080717150950.5d721d90.akpm@linux-foundation.org>
	<1216332937.6029.40.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:52600 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754520AbYGQWjD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 18:39:03 -0400
In-Reply-To: <1216332937.6029.40.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: viro@ZenIV.linux.org.uk, linux-next@vger.kernel.org

On Thu, 17 Jul 2008 15:15:37 -0700
Harvey Harrison <harvey.harrison@gmail.com> wrote:

> On Thu, 2008-07-17 at 15:09 -0700, Andrew Morton wrote:
> > urgh.  We need to do something here.
> > 
> > People are dumping large hunks of 2.6.28 material into linux-next
> > during the merge window.  This screws me up because I haven't merged
> > into 2.6.27 yet, and my patch queue is based on linux-next.  And I
> > _have_ to do that, because lots of the git trees haven't merged into
> > mainline yet.
> 
> Good luck.
> 
> I'll keep plugging away with my daily allyesconfig of each -next snapshot
> to try and keep new warnings from going in....and over time hopefully get
> the number to decrease.
> 
> Should I CC: you on on those fix patches, or try to get them directly through
> the tree they came in from?

Both, I suggest.  Fixes are important, and subsystem maintainers lose
stuff distressingly often.
