From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: linux-next: please hold off 2.6.28 stuff
Date: Sun, 20 Jul 2008 23:13:41 -0700
Message-ID: <1216620821.13328.14.camel@brick>
References: <20080721135108.d4ca4be5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.232]:53180 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803AbYGUGNl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Jul 2008 02:13:41 -0400
Received: by rv-out-0506.google.com with SMTP id k40so1229670rvb.1
        for <linux-next@vger.kernel.org>; Sun, 20 Jul 2008 23:13:41 -0700 (PDT)
In-Reply-To: <20080721135108.d4ca4be5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Mon, 2008-07-21 at 13:51 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Andrew mentioned this and I just thought I would reinforce the message:
> 
> Please do not put 2.6.28 code into linux-next until at least after -rc1.
> This will help Andrew's sanity :-)

I would say let -rc2 be the flag for putting things for the next (2.6.28) release
into -next.  That would give akpm time to get his load in as well.
Between -rc1 and -rc2, he could look at -next to see what patches were
picked up by maintainers and what he'll still have to send in himself.

But it's not me doing the work :-)

Keep up the good work Stephen/AKPM.

Harvey
