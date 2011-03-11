From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 11 (block/mm/fs)
Date: Fri, 11 Mar 2011 09:53:25 -0800
Message-ID: <20110311095325.10ec7383.randy.dunlap@oracle.com>
References: <20110311184115.33404b77.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:35942 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019Ab1CKRyU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Mar 2011 12:54:20 -0500
In-Reply-To: <20110311184115.33404b77.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 11 Mar 2011 18:41:15 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110310:
> 
> The block tree lost its build failure but gained another for which I
> applied a patch.


When CONFIG_BLOCK is not enabled:

mm/filemap.c:1257: error: storage size of 'plug' isn't known
mm/filemap.c:2450: error: storage size of 'plug' isn't known
mm/readahead.c:112: error: storage size of 'plug' isn't known
fs/aio.c:1625: error: storage size of 'plug' isn't known


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
