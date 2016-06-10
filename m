From: mhocko <mhocko@suse.de>
Subject: Re: [mmots-2016-06-09-16-49] sleeping function called from
 slab_alloc()
Date: Fri, 10 Jun 2016 11:55:54 +0200
Message-ID: <477de582bf99ba64be662a42bf023b54@suse.de>
References: <20160610061139.GA374@swordfish>
 <20160610095048.GA655@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35571 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751710AbcFJJz6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Jun 2016 05:55:58 -0400
In-Reply-To: <20160610095048.GA655@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Christoph Lameter <cl@linux.com>, Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, linux-kernel-owner@vger.kernel.org

On 2016-06-10 11:50, Sergey Senozhatsky wrote:
> Hello,
> 
> forked from http://marc.info/?l=linux-mm&m=146553910928716&w=2
> 
> new_slab()->BUG->die()->exit_signals() can be called from atomic
> context: local IRQs disabled in slab_alloc().

I have sent a patch to drop the BUG() from that path today. It
is just too aggressive way to react to a non-critical bug.
See 
http://lkml.kernel.org/r/1465548200-11384-2-git-send-email-mhocko@kernel.org
-- 
Michal Hocko
