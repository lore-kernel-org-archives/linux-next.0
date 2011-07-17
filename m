From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Sun, 17 Jul 2011 23:44:35 +0200
Message-ID: <201107172344.35422.arnd@arndb.de>
References: <20110716150741.a2ed85a4f7addcfccedf16e7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:54028 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543Ab1GQVpY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 17 Jul 2011 17:45:24 -0400
In-Reply-To: <20110716150741.a2ed85a4f7addcfccedf16e7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

On Saturday 16 July 2011 07:07:41 Stephen Rothwell wrote:
> Hi Arnd,
> 
> Today's linux-next merge of the arm-soc tree got conflicts in lots of
> files due to commit 7712eeac230b ("arm-soc: remove rmk/for-next merge")
> from the arm-soc tree (and maybe some others).
> 
> Arnd, is there some way that you can rebuild (rebase) your tree without
> the merge of Russell's tree and the consequent revert of that merge?  It
> is likely to revert a whole swath of changes from Russell's tree :-(
> 
> I have dropped the arm-soc tree for today.

I've done a new branch 'for-next' now to replace the 'master' branch, and
it does not contain the broken merge any more. Please change your list
of branches accordingly.

There are three other conflicts that I found when test-merging the arm-soc
tree with the current linux-next tree. I've already written about the
omap_dss2 mismerge, which is a huge mess and I've resolved that conflict
on my end for now. There is a simpler conflict with the gpio tree, which
I've also resolved in a similar way by adding a dependency here.

The third conflict in arch/arm/mach-imx/mach-mx27_3ds.c is much simpler, so
I assume you will do the obvious hand-merge.

Thanks,

	Arnd
