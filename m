From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Wed, 08 Apr 2009 22:40:21 -0700 (PDT)
Message-ID: <20090408.224021.72200654.davem@davemloft.net>
References: <20090409052717.GF5352@elte.hu>
	<20090408.222845.176097923.davem@davemloft.net>
	<20090409053630.GH5352@elte.hu>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:58099
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1762687AbZDIFkb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2009 01:40:31 -0400
In-Reply-To: <20090409053630.GH5352@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, hpa@zytor.com, linux-next@vger.kernel.org, dvhltc@us.ibm.com

From: Ingo Molnar <mingo@elte.hu>
Date: Thu, 9 Apr 2009 07:36:30 +0200

> Would it be possible for you to reserve the extra futex related 
> pointer right now? (or is that not possible without changing the 
> restart block in linux/thread_info.h?)

What are my real options?

No matter what, once you change the size of "struct restart_block"
the sparc64 build will fail, no matter what.

The only way around this is if you merge the thing that changes
the "struct restart_block"'s size to Linus now along with the
sparc64 change at the same time.

But then I have a merge issue I have to resolve in the sparc64
tree because I've already pushed out my dynamic per-cpu work
:-/

Grumble...
