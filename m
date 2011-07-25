From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: linux-next: build failure after merge of the final tree
	(device-mapper tree related)
Date: Mon, 25 Jul 2011 11:57:45 +0100
Message-ID: <20110725105745.GS5632@agk-dp.fab.redhat.com>
References: <20110725155854.e2a82f7e6864ea117d9131ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:65139 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751470Ab1GYK5w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Jul 2011 06:57:52 -0400
Content-Disposition: inline
In-Reply-To: <20110725155854.e2a82f7e6864ea117d9131ab@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Thornber <thornber@redhat.com>, Mike Snitzer <snitzer@redhat.com>

On Mon, Jul 25, 2011 at 03:58:54PM +1000, Stephen Rothwell wrote:
> Casued by commit 3222df7eca25 ("The persistent-data library offers a
> re-usable framework for the storage").
> I am not quite sure how you should fix this (maybe just include
> linux/bitops.h?) so I have left this build error for today.

Indeed - there were a couple of 
  #include <asm-generic/bitops/le.h>
hidden in there!

Fixed, thanks.

Alasdair
