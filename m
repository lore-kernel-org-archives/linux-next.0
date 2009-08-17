From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -next] trace_skb: fix build when CONFIG_NET is not
 enabled
Date: Mon, 17 Aug 2009 15:59:42 -0700 (PDT)
Message-ID: <20090817.155942.143261709.davem@davemloft.net>
References: <20090817215808.GB15016@elte.hu>
	<20090817.153326.69833512.davem@davemloft.net>
	<20090817224727.GA13795@elte.hu>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:58314
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750991AbZHQW7b (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2009 18:59:31 -0400
In-Reply-To: <20090817224727.GA13795@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu
Cc: randy.dunlap@oracle.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, akpm@linux-foundation.org, nhorman@tuxdriver.com, rostedt@goodmis.org

From: Ingo Molnar <mingo@elte.hu>
Date: Tue, 18 Aug 2009 00:47:27 +0200

> Also, has the review feedback from the tracing folks been 
> addressed? Please separate these patches out and lets do this 
> properly, this approach is not acceptable.

Fine, will keep you guys in the loop next time :-)
