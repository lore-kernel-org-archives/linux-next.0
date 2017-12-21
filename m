From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Thu, 21 Dec 2017 17:49:36 +0100
Message-ID: <20171221164936.GN3553@suse.cz>
References: <20171220092010.36825688@canb.auug.org.au>
 <686908b0-29d9-b7af-18c3-619bebbcd87e@suse.com>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56776 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754187AbdLUQvk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Dec 2017 11:51:40 -0500
Content-Disposition: inline
In-Reply-To: <686908b0-29d9-b7af-18c3-619bebbcd87e@suse.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Qu Wenruo <wqu@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arnd@arndb.de

On Wed, Dec 20, 2017 at 08:12:11AM +0800, Qu Wenruo wrote:
> On 2017年12月20日 06:20, Stephen Rothwell wrote:
> > After merging the btrfs-kdave tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> > 
> > fs/btrfs/qgroup.c: In function 'qgroup_reserve':
> > fs/btrfs/qgroup.c:2432:1: warning: label 'retry' defined but not used [-Wunused-label]
> >  retry:
> >  ^
> > 
> > Introduced by commit
> > 
> >   b283738ab0ad ("Revert "btrfs: qgroups: Retry after commit on getting EDQUOT"")
> > 
> Sorry, I forgot to clean it up.
> 
> I'll update the patchset along with new patches to handle qgroup limit
> better.

Meanwhile I've applied the fix from Arnd to silence the warning in
linux-next builds.
