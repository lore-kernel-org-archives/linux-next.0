From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] pppol2tp: stop using proc internals
Date: Mon, 26 Jan 2009 21:10:29 -0800 (PST)
Message-ID: <20090126.211029.116617007.davem@davemloft.net>
References: <20090123070955.GA8491@localhost>
	<20090124220048.GA5753@x200.localdomain>
	<20090125084718.GC8203@localhost>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:48775
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751052AbZA0FKb (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Jan 2009 00:10:31 -0500
In-Reply-To: <20090125084718.GC8203@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gorcunov@gmail.com
Cc: adobriyan@gmail.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, ebiederm@xmission.com

From: Cyrill Gorcunov <gorcunov@gmail.com>
Date: Sun, 25 Jan 2009 11:47:18 +0300

> [Alexey Dobriyan - Sun, Jan 25, 2009 at 01:00:48AM +0300]
> | [PATCH] pppol2tp: stop using proc internals
> | 
> | PDE_NET usage in driver code is a sign and, indeed, switching
> | to seq_open_net/seq_release_net saves code and fixes bogus things, like
> | user triggerabble BUG_ON(!net) after maybe_get_net, and NULLifying ->private.
> | 
> | Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
 ...
> Thanks a lot Alexey! I'll fix PPPoE too.

Applied, thanks everyone.
