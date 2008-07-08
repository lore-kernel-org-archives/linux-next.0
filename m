From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the net tree
Date: Tue, 8 Jul 2008 08:22:27 -0400
Message-ID: <20080708122227.GA4239@tuxdriver.com>
References: <20080708141607.404681a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ra.tuxdriver.com ([70.61.120.52]:4261 "EHLO ra.tuxdriver.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752350AbYGHMiS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 08:38:18 -0400
Content-Disposition: inline
In-Reply-To: <20080708141607.404681a4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Darren Jenkins <darrenrjenkins@gmail.com>, Harvey Harrison <harvey.harrison@gmail.com>

On Tue, Jul 08, 2008 at 02:16:07PM +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/wireless/iwlwifi/iwl-3945.c between commit
> 0ff1cca0e272045b9c11a2ff94bd3e6893c9308c
> ("drivers/net/wireless/iwlwifi/iwl-3945.c Fix type issue on 64bit") from
> the wireless-current tree and commit
> fd7c8a40b2a63863f749e4d17f0d94d2e5ab1331 ("mac80211: add helpers for
> frame control testing") from the net tree.
> 
> I applied the former change to the latter's code and can carry the fixup
> while necessary.

Yes, that sounds like the right fix.  I'm sorry I didn't get you a
merge-test in advance this time!

John
-- 
John W. Linville
linville@tuxdriver.com
