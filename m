From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the  tree
Date: Tue, 9 Feb 2010 11:01:04 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1002091100480.30967@pobox.suse.cz>
References: <20100208154808.b5670cd5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59636 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751499Ab0BIKBI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Feb 2010 05:01:08 -0500
In-Reply-To: <20100208154808.b5670cd5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@caiaq.de>, Manuel Lauss <manuel.lauss@googlemail.com>, Yoichi Yuasa <yuasa@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>

On Mon, 8 Feb 2010, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> arch/mips/alchemy/common/reset.c between commit
> 139047ceae71916626ee36bea9ef35f1030aabfe ("MIPS: Alchemy: get rid of
> common/reset.c") from the  tree and commit
> ba5584a307a1166597fbbe970ffdf49c8b7ee42a ("tree-wide: Assorted spelling
> fixes") from the trivial tree.
> 
> The former removes the file updated by the latter.

Thanks, I have dropped the respective hunk from the patch in my queue.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
