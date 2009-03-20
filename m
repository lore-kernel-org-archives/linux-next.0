From: Neil Brown <neilb@suse.de>
Subject: Re: linux-next:  tree build warning
Date: Fri, 20 Mar 2009 11:22:00 +1100
Message-ID: <18882.57768.769278.285421@notabene.brown>
References: <20090316191434.47e98665.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:35273 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751383AbZCTAWE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 20:22:04 -0400
In-Reply-To: message from Stephen Rothwell on Monday March 16
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Monday March 16, sfr@canb.auug.org.au wrote:
> Hi Neil,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> drivers/md/raid5.c: In function 'ops_run_compute6_1':
> drivers/md/raid5.c:737: warning: 'target' may be used uninitialized in this function
> 
> Introduced by commit 5b3de0be4eb1545f4425118620cf065e703fa731 ("raid6 bug
> fixes").

Thanks.
I think we are going to drop the last part of that series for 2.6.30
and target 2.6.31.  I currently corrupts raid6 arrays, so it isn't
quite there yet.

NeilBrown
