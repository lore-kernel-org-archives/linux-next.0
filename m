From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 2.6.30] RDMA/cxgb3: remove modulo math from
 build_rdma_recv().
Date: Wed, 11 Feb 2009 15:00:53 -0800 (PST)
Message-ID: <20090211.150053.02539000.davem@davemloft.net>
References: <20090211222915.19520.22647.stgit@dell3.ogc.int>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:55048
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1755320AbZBKXBA (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Feb 2009 18:01:00 -0500
In-Reply-To: <20090211222915.19520.22647.stgit@dell3.ogc.int>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: swise@opengridcomputing.com
Cc: rdreier@cisco.com, general@lists.openfabrics.org, randy.dunlap@oracle.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Steve Wise <swise@opengridcomputing.com>
Date: Wed, 11 Feb 2009 16:29:15 -0600

> From: Steve Wise <swise@opengridcomputing.com>
> 
> - remove modulo usage
> 
> Signed-off-by: Steve Wise <swise@opengridcomputing.com>

Acked-by: David S. Miller <davem@davemloft.net>
