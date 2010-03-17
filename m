From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] gigaset: fix build failure
Date: Wed, 17 Mar 2010 14:22:24 -0700 (PDT)
Message-ID: <20100317.142224.193700644.davem@davemloft.net>
References: <20100317211231.569B140118@xenon.ts.pxnet.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:58597
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753701Ab0CQVWE (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Mar 2010 17:22:04 -0400
In-Reply-To: <20100317211231.569B140118@xenon.ts.pxnet.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tilman@imap.cc
Cc: isdn@linux-pingi.de, randy.dunlap@oracle.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, hjlipp@web.de, isdn4linux@listserv.isdn4linux.de, i4ldeveloper@listserv.isdn4linux.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org

From: Tilman Schmidt <tilman@imap.cc>
Date: Wed, 17 Mar 2010 18:37:05 +0100

> Update the dummy LL interface to the LL interface change
> introduced by commit daab433c03c15fd642c71c94eb51bdd3f32602c8.
> This fixes the build failure occurring after that commit when
> enabling ISDN_DRV_GIGASET but neither ISDN_I4L nor ISDN_CAPI.
> 
> Impact: bugfix
> Signed-off-by: Tilman Schmidt <tilman@imap.cc>

Applied, thanks.
