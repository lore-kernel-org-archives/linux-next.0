From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH linux-next] ipv6: fix missing braces in
 ip6_tnl_add_linklocal
Date: Wed, 21 Aug 2013 20:05:33 -0700 (PDT)
Message-ID: <20130821.200533.2282704635493963288.davem@davemloft.net>
References: <1377123597-26515-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:40349 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752647Ab3HVDFe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Aug 2013 23:05:34 -0400
In-Reply-To: <1377123597-26515-1-git-send-email-vincent.stehle@laposte.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: vincent.stehle@laposte.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, dingtianhong@huawei.com


I already reverted the change in question.
