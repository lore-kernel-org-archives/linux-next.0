From: Sagi Grimberg <sagig@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Mon, 2 Nov 2015 12:40:05 +0200
Message-ID: <56373D85.4070408@mellanox.com>
References: <20151101184815.1c854867@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-db3on0086.outbound.protection.outlook.com ([157.55.234.86]:19097
	"EHLO emea01-db3-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751910AbbKBKzH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Nov 2015 05:55:07 -0500
In-Reply-To: <20151101184815.1c854867@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Wise <swise@opengridcomputing.com>, "J. Bruce Fields" <bfields@redhat.com>

> Hi Doug,
>
> Today's linux-next merge of the rdma tree got a conflict in:
>
>    net/sunrpc/xprtrdma/svc_rdma_recvfrom.c
>
> between commit:
>
>    c91aed989694 ("svcrdma: handle rdma read with a non-zero initial page offset")
>
> from Linus' tree and commit:
>
>    412a15c0fe53 ("svcrdma: Port to new memory registration API")
>
> from the rdma tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).
>

Hi Stephen,

The fix looks correct to me.

Cheers,
Sagi.
