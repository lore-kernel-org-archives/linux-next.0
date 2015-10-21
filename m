From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: no releases after tomorrow for 10 days (Was: Linux
 4.3-rc6)
Date: Wed, 21 Oct 2015 01:09:22 +0100
Message-ID: <20151021000922.GK22011@ZenIV.linux.org.uk>
References: <CA+55aFzxNK9_0TrVbgCfPA5dj1KY3y15S0cyVGCLWs2cOp25aQ@mail.gmail.com>
 <20151021103113.29534482@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:44571 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751855AbbJUAJ1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Oct 2015 20:09:27 -0400
Content-Disposition: inline
In-Reply-To: <20151021103113.29534482@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Wed, Oct 21, 2015 at 10:31:13AM +1100, Stephen Rothwell wrote:

> I suspect a reasonable amount of code for v4.4 is still pending as we
> only have ~8500 commits in linux-next so far (and nothing in the vfs
> tree for example).  I would expect about 10000 commits in a normal
> release.

FWIW, I'm putting together vfs queue(s) right now - probably will push
tomorrow.  Had been sick way too often lately... ;-/
