From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Wed, 08 Apr 2009 22:28:45 -0700 (PDT)
Message-ID: <20090408.222845.176097923.davem@davemloft.net>
References: <20090409151722.c8eabb56.sfr@canb.auug.org.au>
	<20090409052717.GF5352@elte.hu>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:46863
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754758AbZDIF2z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2009 01:28:55 -0400
In-Reply-To: <20090409052717.GF5352@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, hpa@zytor.com, linux-next@vger.kernel.org, dvhltc@us.ibm.com

From: Ingo Molnar <mingo@elte.hu>
Date: Thu, 9 Apr 2009 07:27:17 +0200

> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi all,
>> 
>> Today's linux-next build (sparc64 defconfig) failed like this:
>> 
>> arch/sparc/kernel/built-in.o: In function `trap_init':
>> (.init.text+0x4): undefined reference to `thread_info_offsets_are_bolixed_dave'
>> 
>> Caused by commit 52400ba946759af28442dee6265c5c0180ac7122 ("futex: add
>> requeue_pi functionality") (from the tip-core tree) which changed the
>> size of struct restart_block.
>> 
>> Dave, this might be a good time to suggest that sparc64 create its TI_
>> offsets automatically via asm-offsets ...
>> 
>> I applied the following patch for today.
> 
> David, would it be appropriate for us to queue up Stephen's fix in 
> the futex tree, so that any rewrite can be decoupled from these 
> changes and the Sparc tree would still work as well?

Yes, but it's going to conflict with the dynamic per-cpu work
I'm doing in the sparc-next tree right now.
