From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: error fetching the vfs-jk tree
Date: Tue, 14 Nov 2017 10:00:37 +0100
Message-ID: <20171114090037.GA7053@quack2.suse.cz>
References: <20171114094010.5601ee2c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41842 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753626AbdKNJAo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Nov 2017 04:00:44 -0500
Content-Disposition: inline
In-Reply-To: <20171114094010.5601ee2c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi,

On Tue 14-11-17 09:40:10, Stephen Rothwell wrote:
> Fetching the vfs-jk tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git#vfs)
> produces this error:
> 
> fatal: Couldn't find remote ref refs/heads/vfs
> 
> Do you want me to still fetch/merge that tree?

Sorry, I forgot you were still fetching it. No, there's no need to fetch
that branch anymore (it was a branch for one time work and I've deleted it
now since it was untouched for an year or so). Thanks!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
