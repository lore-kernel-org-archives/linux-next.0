From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 10 Mar 2011 08:15:43 +0100
Message-ID: <4D787A9F.80207@kernel.dk>
References: <20110310140843.15fe4e6e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:56784 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750893Ab1CJHPp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Mar 2011 02:15:45 -0500
In-Reply-To: <20110310140843.15fe4e6e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 2011-03-10 04:08, Stephen Rothwell wrote:
> Hi Jens,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/target/target_core_iblock.c: In function 'iblock_do_task':
> drivers/target/target_core_iblock.c:425: error: 'struct request_queue' has no member named 'unplug_fn'
> drivers/target/target_core_iblock.c:426: error: 'struct request_queue' has no member named 'unplug_fn'

Ah darn, recent merge. I'll fix this up.

-- 
Jens Axboe
