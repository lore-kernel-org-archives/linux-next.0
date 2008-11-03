From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: slab tree build failure
Date: Mon, 03 Nov 2008 11:38:17 +0200
Message-ID: <1225705098.22949.11.camel@penberg-laptop>
References: <20081103154221.e68a50f0.sfr@canb.auug.org.au>
	 <20081103051433.GS19509@disturbed>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:43857 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754829AbYKCJh2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 04:37:28 -0500
In-Reply-To: <20081103051433.GS19509@disturbed>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>, Lachlan McIlroy <lachlan@sgi.com>, Christoph Hellwig <hch@infradead.org>

On Mon, 2008-11-03 at 16:14 +1100, Dave Chinner wrote:
> Yeah, that will work for the moment. It's probably best that we
> don't try to add defrag back into the XFS inode code until we've
> sorted all the niggling problems as a result of the "combine..."
> patch.

OK, I dropped the XFS defrag patch from my tree for now. Thanks guys!

		Pekka
