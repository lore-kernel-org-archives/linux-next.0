From: David Miller <davem@davemloft.net>
Subject: Re: Subject: [PATCH] Sort out syscall_restart name clash.
Date: Wed, 20 May 2009 15:52:48 -0700 (PDT)
Message-ID: <20090520.155248.03355490.davem@davemloft.net>
References: <m1d4a3keqm.fsf@fess.ebiederm.org>
	<20090520.124403.159818618.davem@davemloft.net>
	<m1k54bie6j.fsf_-_@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:33608
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754836AbZETWwu (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2009 18:52:50 -0400
In-Reply-To: <m1k54bie6j.fsf_-_@fess.ebiederm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ebiederm@xmission.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rmk@arm.linux.org.uk, hskinnemoen@atmel.com

From: ebiederm@xmission.com (Eric W. Biederman)
Date: Wed, 20 May 2009 15:48:20 -0700

> 
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
>> Today's linux-next build of at least some av32 and arm configs failed like this:
>>
>> arch/avr32/kernel/signal.c:216: error: conflicting types for 'restart_syscall'
>> include/linux/sched.h:2184: error: previous definition of 'restart_syscall' was here
>>
>> Caused by commit 690cc3ffe33ac4a2857583c22d4c6244ae11684d ("syscall:
>> Implement a convinience function restart_syscall") from the net tree.
> 
> Grrr. Some days it feels like all of the good names are already taken.
> 
> Let's just rename the two static users in arm and avr32 to get this
> sorted out.
> 
> Signed-off-by: Eric W. Biederman <ebiederm@aristanetworks.com>

Applied, thanks Eric.
