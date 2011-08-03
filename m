From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Aug 3 (efivars/pstore)
Date: Wed, 3 Aug 2011 10:40:30 -0700
Message-ID: <20110803104030.3c6443ab.rdunlap@xenotime.net>
References: <20110803151651.687fc6f377e255eccf58301b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:56934 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752077Ab1HCRkd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Aug 2011 13:40:33 -0400
In-Reply-To: <20110803151651.687fc6f377e255eccf58301b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 3 Aug 2011 15:16:51 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Just in case anyone needs reminding:  Please do not add anything destined
> for v3.2 into linux-next included trees until after v3.1-rc1.


What is this warning about?  I don't see the problem.

The warning only happens on i386 AFAIK.  Must be some typedef glitch?

drivers/firmware/efivars.c:602: warning: initialization from incompatible pointer type


thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
