From: Thomas Meyer <thomas@m3y3r.de>
Subject: Re: linux-next: Tree for May 30
Date: Mon, 02 Jun 2008 19:40:04 +0200
Message-ID: <1212428404.484430742e07d@213.133.104.17>
References: <20080530181901.8268f317.sfr@canb.auug.org.au> <1212316424.3253.8.camel@dhcppc1> <20080601150710.GB27843@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:33346 "EHLO
	www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758174AbYFBRkL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jun 2008 13:40:11 -0400
In-Reply-To: <20080601150710.GB27843@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Yinghai Lu <yhlu.kernel@gmail.com>

Zitat von Ingo Molnar <mingo@elte.hu>:

> hm, that commit is gone in latest tip - does tip/master boot fine for 
> you? It's:
> 
>    http://people.redhat.com/mingo/tip.git/README
> 
> that commit was an interim fix that got removed meanwhile and replaced 
> with the real fixes.

I just booted next-20080602 successfully, and the latest commit on file
arch/x86/kernel/setup_32.c is:

4efc5450e19128e0c77fbfdf4a14804f5a4a1d95 (Merge branch 'x86/numa' into
auto-x86-next).

So yes, the original commit causing the error for me is gone.

Thanks and greets.
thomas

