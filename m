From: Mike Rapoport <mike@compulab.co.il>
Subject: Re: linux-next: voltage tree build failure
Date: Thu, 30 Apr 2009 14:06:34 +0300
Message-ID: <49F9863A.6010306@compulab.co.il>
References: <20090428162444.f7ee93f3.sfr@canb.auug.org.au>	<1240916917.14165.117.camel@vega.slimlogic.co.uk> <20090428214207.4a27d391.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cathcart.site5.com ([74.54.107.137]:53609 "EHLO
	cathcart.site5.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762850AbZD3LcG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Apr 2009 07:32:06 -0400
In-Reply-To: <20090428214207.4a27d391.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org



Stephen Rothwell wrote:
> Hi Liam,
> 
> On Tue, 28 Apr 2009 12:08:37 +0100 Liam Girdwood <lrg@slimlogic.co.uk> wrote:
>> On Tue, 2009-04-28 at 16:24 +1000, Stephen Rothwell wrote:
>>> Hi Liam,
>>>
>>> Today's linux-next build (powerpc allyesconfig) failed like this:
>>>
>>> drivers/regulator/userspace-consumer.c:43: error: conflicting types for 'show_state'
>>> include/linux/sched.h:273: note: previous definition of 'show_state' was here
>>>
>>> Caused by commit 5defa2bce704ca4151cfe24e4297aa7797cafd22 ("regulator:
>>> add userspace-consumer driver") which I have reverted for today.
>> Sorry about this. I've now fixed in voltage next by renaming with a reg_
>> prefix. Fwiw - I did test build for ARM and all was OK yesterday. I
>> guess I need to build allyesconfig too.

It's rather my fault...
BTW, the drivers/regulator/virtual.c has show_mode which may trigger similar
error later, probably it's worth adding reg_ prefix there as well...

> More likely, sched.h is indirectly included on some platforms and not
> others.  This is partly what linux-next is for: to find cross platform
> and subsystem interactions.
> 
> Thanks for the fix.

-- 
Sincerely yours,
Mike.
