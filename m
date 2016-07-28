From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [BUG -next] "random: make /dev/urandom scalable for silly
 userspace programs" causes crash
Date: Thu, 28 Jul 2016 09:41:42 -0400
Message-ID: <20160728134142.GA12516@thunk.org>
References: <20160727071400.GA3912@osiris>
 <20160728034601.GC20032@thunk.org>
 <20160728055548.GA3942@osiris>
 <20160728072408.GB3942@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:52946 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757576AbcG1Nlr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Jul 2016 09:41:47 -0400
Content-Disposition: inline
In-Reply-To: <20160728072408.GB3942@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-s390@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On Thu, Jul 28, 2016 at 09:24:08AM +0200, Heiko Carstens wrote:
> 
> Oh, I just realized that Linus pulled your changes. Actually I was hoping
> we could get this fixed before the broken code would be merged.
> Could you please make sure the bug fix gets included as soon as possible?

Yes, I'll send the pull request to ASAP.

					- Ted
