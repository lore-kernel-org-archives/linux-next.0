From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree
 with the net-next tree
Date: Mon, 16 May 2016 11:09:38 -0400 (EDT)
Message-ID: <20160516.110938.1634920648361575365.davem@davemloft.net>
References: <20160516101606.751f9613@canb.auug.org.au>
	<871t529mik.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:35685 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753853AbcEPPJk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 May 2016 11:09:40 -0400
In-Reply-To: <871t529mik.fsf@kamboji.qca.qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kvalo@codeaurora.org
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, luciano.coelho@intel.com

From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 16 May 2016 16:10:27 +0300

> I wasn't expecting that skb_info variable is removed. Do we now have
> merge damage somewhere? Luca, what do you think?

It's possible I got the net --> net-next merge wrong the other day, feel
free to send me an appropriate fixup.

Thanks.
