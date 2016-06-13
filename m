From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [mmots-2016-06-09-16-49] sleeping function called from
 slab_alloc()
Date: Mon, 13 Jun 2016 12:47:34 +0200
Message-ID: <20160613104733.GA6518@dhcp22.suse.cz>
References: <20160610061139.GA374@swordfish>
 <20160610095048.GA655@swordfish>
 <477de582bf99ba64be662a42bf023b54@suse.de>
 <20160610145916.d071635d6462e4d837959e45@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34735 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965363AbcFMKrh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Jun 2016 06:47:37 -0400
Content-Disposition: inline
In-Reply-To: <20160610145916.d071635d6462e4d837959e45@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Christoph Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, linux-kernel-owner@vger.kernel.org

On Fri 10-06-16 14:59:16, Andrew Morton wrote:
> On Fri, 10 Jun 2016 11:55:54 +0200 mhocko <mhocko@suse.de> wrote:
> 
> > On 2016-06-10 11:50, Sergey Senozhatsky wrote:
> > > Hello,
> > > 
> > > forked from http://marc.info/?l=linux-mm&m=146553910928716&w=2
> > > 
> > > new_slab()->BUG->die()->exit_signals() can be called from atomic
> > > context: local IRQs disabled in slab_alloc().
> > 
> > I have sent a patch to drop the BUG() from that path today. It
> > is just too aggressive way to react to a non-critical bug.
> > See 
> > http://lkml.kernel.org/r/1465548200-11384-2-git-send-email-mhocko@kernel.org
> 
> Doesn't this simply mean that Sergey's workload will blurt a pr_warn()
> rather than a BUG()?  That still needs fixing.  Confused.

Yes that should be fixed by
http://lkml.kernel.org/r/20160610074223.GC32285@dhcp22.suse.cz

which prevents from using a wrong GFP...

-- 
Michal Hocko
SUSE Labs
