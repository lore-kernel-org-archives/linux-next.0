From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the akpm tree with the ext4 tree
Date: Wed, 19 Jun 2013 10:20:31 -0400
Message-ID: <20130619142031.GC24194@thunk.org>
References: <20130619172721.00e757acd76e1f9d362f59be@canb.auug.org.au>
 <20130619074402.GC1990@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from li9-11.members.linode.com ([67.18.176.11]:59399 "EHLO
	imap.thunk.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756669Ab3FSOUm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Jun 2013 10:20:42 -0400
Content-Disposition: inline
In-Reply-To: <20130619074402.GC1990@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Glauber Costa <glommer@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zheng Liu <wenqing.lz@taobao.com>, Dave Chinner <dchinner@redhat.com>, Glauber Costa <glommer@openvz.org>

Is there some way we can avoid this conflict during the next merge
window?  Given that this is an API change, it may not be possible.
Failing that, what's the best merge strategy; should we try to make
sure your change goes first, and then I can defer the ext4 pull
request until a little bit later in the merge window?

Thanks,

				- Ted
