From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [mmots-2016-06-09-16-49] sleeping function called from
 slab_alloc()
Date: Fri, 10 Jun 2016 18:58:08 +0900
Message-ID: <20160610095808.GB655@swordfish>
References: <20160610061139.GA374@swordfish>
 <20160610095048.GA655@swordfish>
 <477de582bf99ba64be662a42bf023b54@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33066 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710AbcFJJ6O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Jun 2016 05:58:14 -0400
Content-Disposition: inline
In-Reply-To: <477de582bf99ba64be662a42bf023b54@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mhocko <mhocko@suse.de>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Christoph Lameter <cl@linux.com>, Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, linux-kernel-owner@vger.kernel.org

On (06/10/16 11:55), mhocko wrote:
> On 2016-06-10 11:50, Sergey Senozhatsky wrote:
> > Hello,
> > 
> > forked from http://marc.info/?l=linux-mm&m=146553910928716&w=2
> > 
> > new_slab()->BUG->die()->exit_signals() can be called from atomic
> > context: local IRQs disabled in slab_alloc().
> 
> I have sent a patch to drop the BUG() from that path today. It
> is just too aggressive way to react to a non-critical bug.
> See
> http://lkml.kernel.org/r/1465548200-11384-2-git-send-email-mhocko@kernel.org

ah, ok. didn't see that one.
thanks.

	-ss
