From: David Miller <davem@davemloft.net>
Subject: Re: [RFC PATCH net-next] packet: fix using smp_processor_id() in
 preemptible code
Date: Wed, 11 Dec 2013 16:49:46 -0500 (EST)
Message-ID: <20131211.164946.912458698857068460.davem@davemloft.net>
References: <1386828604.2584.13.camel@ThinkPad-T5421>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:59954 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750996Ab3LKVts (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Dec 2013 16:49:48 -0500
In-Reply-To: <1386828604.2584.13.camel@ThinkPad-T5421>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: zhong@linux.vnet.ibm.com
Cc: linux-next@vger.kernel.org, dborkman@redhat.com, brouer@redhat.com


Please send networking patches to netdev@vger.kernel.org, otherwise they
will get lost.
