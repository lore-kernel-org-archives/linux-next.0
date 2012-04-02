From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 00/11] Fix up more asm/system.h fallout
Date: Mon, 02 Apr 2012 06:30:30 +0100
Message-ID: <29666.1333344630@redhat.com>
References: <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:12497 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750911Ab2DBFag (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Apr 2012 01:30:36 -0400
In-Reply-To: <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: dhowells@redhat.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org


Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> Like others, I was surprised it didn't get a soak in linux-next
> before being merged

I don't think that would've helped - unless Linus took all of linux-next into
his tree.  The problem is that there were a substantial number of differences
between Linus-vanilla and linux-next (obviously), even mid-window.

To be fair, Linus had to fix up my patch set to apply to his vanilla tree, but
I did ask him to to pull the patches later in the merge window and hopefully
give me a chance to fix them up again before he did so.  But I suppose arch
tree breakage was to be expected anyway in some arches.

However, I think the better way to have done this would've been to have the
arch-specific patches go through the arch trees first (and, indeed, Blackfin
did this and I was able to drop their patch from my set) - and then have the
generic patches go at the end.

Even better might've been to add a #warning into each asm/system.h in this
merge window and defer the final deletion to the next merge window.

David
