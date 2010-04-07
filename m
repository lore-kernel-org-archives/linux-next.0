From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the wireless tree with the
 wireless-current tree
Date: Wed, 07 Apr 2010 16:19:01 -0700 (PDT)
Message-ID: <20100407.161901.43719176.davem@davemloft.net>
References: <20100407125828.d9f03281.sfr@canb.auug.org.au>
	<20100407144434.GC3146@tuxdriver.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40607
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757340Ab0DGXS7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2010 19:18:59 -0400
In-Reply-To: <20100407144434.GC3146@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linville@tuxdriver.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, yi.zhu@intel.com

From: "John W. Linville" <linville@tuxdriver.com>
Date: Wed, 7 Apr 2010 10:44:34 -0400

> On Wed, Apr 07, 2010 at 12:58:28PM +1000, Stephen Rothwell wrote:
>> Hi John,
>> 
>> Today's linux-next merge of the wireless tree got conflicts in
>> drivers/net/wireless/iwlwifi/iwl-core.c,
>> drivers/net/wireless/iwlwifi/iwl-tx.c and
>> drivers/net/wireless/iwlwifi/iwl-core.h between commit
>> de0f60ea94e132c858caa64a44b2012e1e8580b0 ("iwlwifi: avoid Tx queue memory
>> allocation in interface down") from the wireless-current tree and commit
>> 74bcdb33e99f49ef5202dd2f8109945b4570edc2 ("iwlwifi: move agn only tx
>> functions from iwlcore to iwlagn") from the wireless tree.
>> 
>> The latter moved the code modified by the former.  I couldn't see any
>> easy way to fix this up, so I effectively reverted the change in the
>> wireless-current tree.  Please do the merge fixup, thanks.
> 
> OK, I'll try to negotiate this today.

I think I took care of this when I merged net-2.6 into
net-next-2.6 last night.
