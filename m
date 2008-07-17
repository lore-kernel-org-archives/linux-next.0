From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 3/3] proc: make grab_header static
Date: Fri, 18 Jul 2008 00:23:28 +0100
Message-ID: <20080717232328.GO28946@ZenIV.linux.org.uk>
References: <1216329755.6029.31.camel@brick> <20080717150950.5d721d90.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:43608 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933525AbYGQXXb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 19:23:31 -0400
Content-Disposition: inline
In-Reply-To: <20080717150950.5d721d90.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Harvey Harrison <harvey.harrison@gmail.com>, linux-next@vger.kernel.org

On Thu, Jul 17, 2008 at 03:09:50PM -0700, Andrew Morton wrote:
> On Thu, 17 Jul 2008 14:22:35 -0700
> Harvey Harrison <harvey.harrison@gmail.com> wrote:
> 
> > fs/proc/proc_sysctl.c:69:25: warning: symbol 'grab_header' was not declared. Should it be static?

> urgh.  We need to do something here.
> 
> People are dumping large hunks of 2.6.28 material into linux-next
> during the merge window.  This screws me up because I haven't merged
> into 2.6.27 yet, and my patch queue is based on linux-next.  And I
> _have_ to do that, because lots of the git trees haven't merged into
> mainline yet.

FWIW, you are slightly misreading the situation - it *is* my fault, but
in a different way.  What's happening is not development going into that
branch - it's untangling a huge pile of pending patches into sequence.
And yes, it should've gone public as-is a couple of weeks ago ;-/
