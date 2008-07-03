From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Wed, 02 Jul 2008 21:14:38 -0700 (PDT)
Message-ID: <20080702.211438.48083662.davem@davemloft.net>
References: <20080703140801.301b74f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:37898
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751069AbYGCEOk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 00:14:40 -0400
In-Reply-To: <20080703140801.301b74f3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, tomas.winkler@intel.com, linville@tuxdriver.com, rickdic@hotmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 3 Jul 2008 14:08:01 +1000

> Hi Dave,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/wireless/iwlwifi/iwl-4965.c between commit
> ec04fd60fd74a9db9c63fe11d519be3642cabfdd ("iwlwifi: fix incorrect 5GHz
> rates reported in monitor mode") from the wrieless-current tree and
> commit radiotap ("iwlwifi: remove 4965 from iwl4965_rate_info") from the
> net tree.
> 
> I did the obvious fixup (iwl4965_rates -> iwl_rates).

Ok.  As John Linville posted, this was expected :)
