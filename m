From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/1] Re: linux-next: net tree build warnings
Date: Tue, 20 Oct 2009 01:09:43 -0700 (PDT)
Message-ID: <20091020.010943.162563535.davem@davemloft.net>
References: <20091014153450.3110e34c.sfr@canb.auug.org.au>
	<20091014.151137.30359959.davem@davemloft.net>
	<20091017021024.GI25141@ghostprotocols.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:59697
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751029AbZJTIJU (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Oct 2009 04:09:20 -0400
In-Reply-To: <20091017021024.GI25141@ghostprotocols.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: acme@redhat.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Arnaldo Carvalho de Melo <acme@redhat.com>
Date: Fri, 16 Oct 2009 23:10:24 -0300

> Subject: [PATCH] net: Avoid compiler warning for mmsghdr when CONFIG_COMPAT is not selected
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>

Applied, please CC: networking patches to netdev in the future.

Thanks.
