From: Alex Dubov <oakad@yahoo.com>
Subject: Re: linux-next: block tree build failure
Date: Sun, 14 Sep 2008 22:38:32 -0700 (PDT)
Message-ID: <278380.30002.qm@web37604.mail.mud.yahoo.com>
References: <20080915151844.16569141.sfr@canb.auug.org.au>
Reply-To: oakad@yahoo.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from web37604.mail.mud.yahoo.com ([209.191.87.87]:47818 "HELO
	web37604.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750833AbYIOFpO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Sep 2008 01:45:14 -0400
In-Reply-To: <20080915151844.16569141.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>




--- On Sun, 9/14/08, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Subject: linux-next: block tree build failure
> To: "Jens Axboe" <jens.axboe@oracle.com>
> Cc: linux-next@vger.kernel.org, "Alex Dubov" <oakad@yahoo.com>, "Tejun Heo" <tj@kernel.org>
> Date: Sunday, September 14, 2008, 10:18 PM
> Hi Jens,
> 
> Today's linux-next build (x86_64 allmodconfig) failed
> like this:
> 
> drivers/memstick/core/mspro_block.c: In function
> 'mspro_block_disk_release':
> drivers/memstick/core/mspro_block.c:200: error:
> 'MEMSTICK_PART_SHIFT' undeclared (first use in this
> function)
> 

That's funny. My last patch replaced all occurrences of this macro.



      
