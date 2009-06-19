From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: linux-next: origin tree build warning
Date: Fri, 19 Jun 2009 10:45:31 +0200
Message-ID: <20090619104531.98e9058c.kristoffer.ericson@gmail.com>
References: <20090619111359.b317a533.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f213.google.com ([209.85.218.213]:37707 "EHLO
	mail-bw0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752656AbZFSIoj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Jun 2009 04:44:39 -0400
In-Reply-To: <20090619111359.b317a533.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Greetings,

Hmm, this would be true if you are using the s1d13xxxfb driver without having supported 2D accel (essentially everything not 13506). Atleast
for bltbit_wait_bitset. The bltbit_fifo_status on the other hand is needed later on
for image blitting, which is coming.

The point is basicly this, all s1d13xxxfb cards should get their 2D acceleration
going so until then this is just an annoying but harmless warning.

Hope that answers your comment.

Best wishes
Kristoffer

On Fri, 19 Jun 2009 11:13:59 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> drivers/video/s1d13xxxfb.c:420: warning: 'bltbit_wait_bitset' defined but not used
> drivers/video/s1d13xxxfb.c:463: warning: 'bltbit_fifo_status' defined but not used
> 
> Introduced by commit 3ed167af96ed098187ea41353fe02d1af20d38a1 ("fbdev:
> s1d13xxxfb: add accelerated bitblt functions").
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 


-- 
Kristoffer Ericson <kristoffer.ericson@gmail.com>
