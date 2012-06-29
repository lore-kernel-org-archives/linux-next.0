From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with Linus' tree
Date: Fri, 29 Jun 2012 14:48:33 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1206291448070.11491@pobox.suse.cz>
References: <20120629143607.5f1e97318ddfe6f027bfcc5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41243 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752710Ab2F2Msm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Jun 2012 08:48:42 -0400
In-Reply-To: <20120629143607.5f1e97318ddfe6f027bfcc5b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wanpeng Li <liwp@linux.vnet.ibm.com>, Hugh Dickins <hughd@google.com>, Konstantin Khlebnikov <khlebnikov@openvz.org>, Andrew Morton <akpm@linux-foundation.org>

On Fri, 29 Jun 2012, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> include/linux/mmzone.h between commit 89abfab133ef ("mm/memcg: move
> reclaim_stat into lruvec") from Linus' tree and commit 46028e6d10cb ("mm:
> cleanup on the comments of zone_reclaim_stat") from the trivial tree.
> 
> The former moved the code that was updated by the latter.  I applied the
> latter to the new position (see below).

I have merged Linus' tree into for-next and resolved the conflict, so it's 
gone from your POV now.

Thanks,

-- 
Jiri Kosina
SUSE Labs
