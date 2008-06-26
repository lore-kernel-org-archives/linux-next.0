From: Zhu Yi <yi.zhu@intel.com>
Subject: Re: linux-next: pending wireless/wireless-current merge conflict
Date: Thu, 26 Jun 2008 10:01:59 +0800
Message-ID: <1214445720.14590.285.camel@debian.sh.intel.com>
References: <20080613215601.GA8345@tuxdriver.com>
	 <20080625180430.GA13730@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:26194 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752203AbYFZCDN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 22:03:13 -0400
In-Reply-To: <20080625180430.GA13730@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-wireless@vger.kernel.org

On Wed, 2008-06-25 at 14:04 -0400, John W. Linville wrote:
> I just sent a pull request for Dave that will result in nasty-looking
> conflict in iwl4965-base.c.  I have a sample merge available here:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next-2.6 merge-test
> 
> The overview of the resolution is to ignore any changes in
> iwl4965-base.c and take drivers/net/wireless/iwlwifi/iwl-scan.c from
> the URL above.
> 
> Just a heads-up... :-)
> 
> John
> 
> P.S.  Hopefully the iwlwifi guys will double check the accuracy of
> my fix-up...

I checked the patch on the tip of wireless-testing is good. I think
wireless-next-2.6:merge-test should also be OK.

Thanks,
-yi
