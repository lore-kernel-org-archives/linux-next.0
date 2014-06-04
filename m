From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: failed to fetch the aio tree
Date: Tue, 3 Jun 2014 20:43:00 -0400
Message-ID: <20140604004300.GM5097@kvack.org>
References: <20140604090846.3b4fd54c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:53075 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752307AbaFDAnC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Jun 2014 20:43:02 -0400
Content-Disposition: inline
In-Reply-To: <20140604090846.3b4fd54c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On Wed, Jun 04, 2014 at 09:08:46AM +1000, Stephen Rothwell wrote:
> Hi Benjamin,
> 
> Fetching the aio tree (git://git.kvack.org/~bcrl/aio-next.git#master)
> for the past 3 days has produced this error:
> 
> fatal: unable to connect to git.kvack.org:
> git.kvack.org[0: 205.233.56.16]: errno=Connection refused

Whoops, it looks like the system upgrade that took place on the weekend 
didn't managed to restart git-daemon.  That should be fixed now.  Thanks 
for the report.

		-ben

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



-- 
"Thought is the essence of where you are now."
