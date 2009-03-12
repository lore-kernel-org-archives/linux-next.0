From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the  tree
Date: Thu, 12 Mar 2009 11:27:08 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0903121124550.11733@jikos.suse.cz>
References: <20090312154327.70d7271b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60415 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756190AbZCLK1L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 06:27:11 -0400
In-Reply-To: <20090312154327.70d7271b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Matt LaPlante <kernel1@cyberdogtech.com>

On Thu, 12 Mar 2009, Stephen Rothwell wrote:

> Today's linux-next merge of the trivial tree got a conflict in
> init/Kconfig between commit b943c460ff8556a193b28e2145b513f8b978e869
> ("menu: fix embedded menu snafu") from Linus' tree and commit
> 2622b54dff6e30d114828648e96777739b764063 ("trivial: fix typos/grammar
> errors in Kconfig texts") from the trivial tree.

Hi,

the trivial tree is now based on current Linus' tree (ebdcc81c). Strangely 
enough, I didn't encounter any conflict while doing rebase ...

-- 
Jiri Kosina
SUSE Labs
