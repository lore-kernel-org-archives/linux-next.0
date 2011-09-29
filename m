From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Sept 29 (kvm)
Date: Thu, 29 Sep 2011 12:50:24 -0700
Message-ID: <4E84CC00.8090702@xenotime.net>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:42667 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753157Ab1I2Tu0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2011 15:50:26 -0400
In-Reply-To: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>

On 09/28/11 23:57, Stephen Rothwell wrote:
> Hi all,
> 
> The linux-next tree is now available from
> git://github.com/sfrothwell/linux-next.git as a temporary measure while
> the kernel.org servers are unavailable.


kvm build on i386 says:

ERROR: "__udivdi3" [arch/x86/kvm/kvm.ko] undefined!

which is used in somewhere in start_apic_timer()  (probably the divide :).


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
