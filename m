From: Neil Brown <neilb@suse.de>
Subject: Re: linux-next: md tree build failure
Date: Fri, 13 Mar 2009 11:45:59 +1100
Message-ID: <18873.44231.864323.344008@notabene.brown>
References: <20090311162718.36292b71.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56445 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757307AbZCMAqE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 20:46:04 -0400
In-Reply-To: message from Stephen Rothwell on Wednesday March 11
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>

On Wednesday March 11, sfr@canb.auug.org.au wrote:
> Hi Neil,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "raid6_empty_zero_page" [drivers/md/raid456.ko] undefined!
> ERROR: "raid6_empty_zero_page" [crypto/async_tx/async_pq.ko] undefined!
> 
> Maybe caused by commit 4739d067d35c26093f4ba29a716ce9d60c36dc53
> ("md/raid5: move raid6 data processing to raid6_pq.ko")?
> 
> I have merged the version of the md tree from next-20090306 for today.

Thanks.
I've export raid6_empty_zero_page.  I think that is the correct fix.
So Monday should be a winner :-)

NeilBrown
