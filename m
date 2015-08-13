From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the tip tree
Date: Thu, 13 Aug 2015 14:55:35 +1000
Message-ID: <20150813145535.6db96f9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37092 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751460AbbHMEzg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Aug 2015 00:55:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/ozwpan/ozproto.c

between commit:

  5a447f09a8df ("staging: ozwpan: Fix hrtimer wreckage")

from the tip tree and commit:

  a73e99cb67e7 ("staging: ozwpan: Remove from tree")

from the staging tree.

I fixed it up (I just removed the file) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
