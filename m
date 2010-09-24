From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the net tree
Date: Fri, 24 Sep 2010 14:09:48 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1009241409320.26813@pobox.suse.cz>
References: <20100924121924.8fb5dfb5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42412 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754716Ab0IXMJu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Sep 2010 08:09:50 -0400
In-Reply-To: <20100924121924.8fb5dfb5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Weber <weber@corscience.de>

On Fri, 24 Sep 2010, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> drivers/net/bnx2x/bnx2x_link.c between commit
> 62b29a5dd0930e0c956b6740f32d5b3bbaf20136 ("bnx2x: Adjust alignment of
> split PHY functions") from the net tree and commit
> 0b1974de66f9ed44f1423449628f4926bf95b854 ("Fix typo: configuation =>
> configuration") from the trivial tree.
> 
> The former removes the text updated by the latter, so I used the former.
> 
> Jiri, you might like to drop that hunk from the patch in your tree.

Done now, thanks for reporting.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
