From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Mon, 18 Jan 2016 14:22:45 +1100
Message-ID: <20160118142245.04e525ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59853 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753663AbcARDWr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jan 2016 22:22:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got lost of conflicts in:

  mm/huge_memory.c

between various commits in Linus' tree and the same or similar patches
in the akpm-current tree along with further changes to this file.

I can't possibly fix it up, so I just dropped the akpm-current tree
for today.

I do wish that you would publish your patch set for me just as you intend
to send it to Linus. :-(  I also wonder at how much exposure and testing
the subset that you have sent to Linus has had on it own given that the
version I have is from Jan 12.

Sorry, but I seem to end up in this mess almost every merge window.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
