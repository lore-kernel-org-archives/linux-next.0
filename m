From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Wed, 08 Apr 2009 22:59:34 -0700 (PDT)
Message-ID: <20090408.225934.22946534.davem@davemloft.net>
References: <20090409053630.GH5352@elte.hu>
	<20090408.224021.72200654.davem@davemloft.net>
	<20090409055356.GJ5352@elte.hu>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:48702
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1755933AbZDIF7o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2009 01:59:44 -0400
In-Reply-To: <20090409055356.GJ5352@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, hpa@zytor.com, linux-next@vger.kernel.org, dvhltc@us.ibm.com

From: Ingo Molnar <mingo@elte.hu>
Date: Thu, 9 Apr 2009 07:53:56 +0200

> We could create a standalone, .30-rc1 based topic for the 
> linux/thread_info.h change only, and push it to Linus, and/or you 
> could pull it into the Sparc tree?

Actually, it turns out I'm changing different structure offsets in the
sparc64 dynamic per-cpu changes.  There shouldn't be any thread_info.h
conflicts, therefore.

So you can take the sparc64 build fix patch in your tree, that's fine.

Thanks!
