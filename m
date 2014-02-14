From: Michal Hocko <mhocko@suse.cz>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 cgroup tree
Date: Fri, 14 Feb 2014 09:57:05 +0100
Message-ID: <20140214085705.GB29814@dhcp22.suse.cz>
References: <20140214153414.b15e54bf5aa61d0e75bacc90@canb.auug.org.au>
 <20140214083345.GA29814@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50896 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752569AbaBNI5H (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Feb 2014 03:57:07 -0500
Content-Disposition: inline
In-Reply-To: <20140214083345.GA29814@dhcp22.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri 14-02-14 09:33:45, Michal Hocko wrote:
[...]
> I do not see spin_unlock -> mutex_unlock at the very end of this function.

Scratch that. That part apparently didn't conflict so it wasn't in the
merge commit. Sorry about the noise
-- 
Michal Hocko
SUSE Labs
