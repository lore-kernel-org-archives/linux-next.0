From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH next] 8390p: fix build breakage
Date: Fri, 24 Apr 2009 04:46:12 -0700 (PDT)
Message-ID: <20090424.044612.162386250.davem@davemloft.net>
References: <20090424092550.GA10833@orion>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:55513
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751235AbZDXLqT (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Apr 2009 07:46:19 -0400
In-Reply-To: <20090424092550.GA10833@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: a.beregalov@gmail.com
Cc: ormi.linux@gmail.com, linux-next@vger.kernel.org, netdev@vger.kernel.org

From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Fri, 24 Apr 2009 13:25:50 +0400

> Fix this build error caused by 362b76edb789
> "8390p: Get rid of init_module/cleanup_module"
> 
> drivers/net/8390p.c:94:19: error: invalid suffix "p_init_module" on integer constant
> drivers/net/8390p.c:94: error: expected identifier or '(' before numeric constant
> drivers/net/8390p.c:99:20: error: invalid suffix "p_cleanup_module" on integer constant
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

This is why I usually don't apply patches that the submitter
can't even send to the correct place to begin with. :-/

Applied, thanks Alexander.
