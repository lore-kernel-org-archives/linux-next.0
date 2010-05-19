From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 19 (mm/page-writeback)
Date: Wed, 19 May 2010 10:48:00 -0700
Message-ID: <20100519104800.5a43346f.randy.dunlap@oracle.com>
References: <20100519163554.80c7fcd3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:39760 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753647Ab0ESRsb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2010 13:48:31 -0400
In-Reply-To: <20100519163554.80c7fcd3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, jens.axboe@oracle.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 19 May 2010 16:35:54 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> We are in the merge window again.  I remind you all not to add stuff for
> 2.6.36 to your linux-next trees until after 2.6.35-rc1.
> 
> Changes since 20100518:


When CONFIG_BLOCK is not enabled:

mm/page-writeback.c: In function 'laptop_mode_timer_fn':
mm/page-writeback.c:708: error: dereferencing pointer to incomplete type
mm/page-writeback.c:709: error: dereferencing pointer to incomplete type

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
