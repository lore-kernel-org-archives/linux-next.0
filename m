From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [mmots-2016-06-09-16-49] sleeping function called from
 slab_alloc()
Date: Fri, 10 Jun 2016 14:59:16 -0700
Message-ID: <20160610145916.d071635d6462e4d837959e45@linux-foundation.org>
References: <20160610061139.GA374@swordfish>
	<20160610095048.GA655@swordfish>
	<477de582bf99ba64be662a42bf023b54@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:53866 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752116AbcFJV7S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Jun 2016 17:59:18 -0400
In-Reply-To: <477de582bf99ba64be662a42bf023b54@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mhocko <mhocko@suse.de>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Christoph Lameter <cl@linux.com>, Michal Hocko <mhocko@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, linux-kernel-owner@vger.kernel.org

On Fri, 10 Jun 2016 11:55:54 +0200 mhocko <mhocko@suse.de> wrote:

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

Doesn't this simply mean that Sergey's workload will blurt a pr_warn()
rather than a BUG()?  That still needs fixing.  Confused.
