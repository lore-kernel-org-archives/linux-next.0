From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the wireless tree with the
	wireless-current tree
Date: Tue, 24 Nov 2009 10:05:25 -0500
Message-ID: <20091124150525.GA2782@tuxdriver.com>
References: <20091124141141.5b6d3a8d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:59142 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933222AbZKXPPe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2009 10:15:34 -0500
Content-Disposition: inline
In-Reply-To: <20091124141141.5b6d3a8d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 24, 2009 at 02:11:41PM +1100, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next merge of the wireless tree got a conflict in
> drivers/net/wireless/ath/ath9k/main.c between commit
> 54ab040d24904d1fa2c0a6a27936b7c56a4efb24 ("ath9k: set ps_default as
> false") from the wireless-current tree and commit
> 18b6c9a2213d3b6e0212e8b225abf95f7564206a ("ath9k: set ps_default as
> false") from the wireless tree.
> 
> The commit message of the latter made me use just its version.

Yes, that's the correct fix. :-)

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
