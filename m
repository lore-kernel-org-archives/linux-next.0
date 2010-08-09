From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Sun, 08 Aug 2010 21:50:57 -0400
Message-ID: <4C5F5F01.2090802@kernel.dk>
References: <20100809112831.0dc41e76.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:53855 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752917Ab0HIBvD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Aug 2010 21:51:03 -0400
In-Reply-To: <20100809112831.0dc41e76.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Stodden <daniel.stodden@citrix.com>, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>

On 08/08/2010 09:28 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/block/xen-blkfront.c: In function 'blkif_release':
> drivers/block/xen-blkfront.c:1238: error: label 'out' used but not defined
> 
> Caused by commit acfca3c622a009fb62b566604452ab9fb3a11019 ("blkfront:
> Remove obsolete info->users").  I assume something went wrong in the
> rebase ...
> 
> I have used the block tree from next-20100807 for today.

Oops, fixed up.

-- 
Jens Axboe
