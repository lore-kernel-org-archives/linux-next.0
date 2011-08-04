From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH -next] tpm_tis: fix build when ACPI is not enabled
Date: Thu, 4 Aug 2011 11:34:10 +1000 (EST)
Message-ID: <alpine.LRH.2.00.1108041133260.25037@tundra.namei.org>
References: <20110727141151.d31e3da6a8d21a255473293c@canb.auug.org.au> <20110727114211.18be47cf.rdunlap@xenotime.net> <20110803185634.GA16988@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:39519 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756004Ab1HDBe4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Aug 2011 21:34:56 -0400
In-Reply-To: <20110803185634.GA16988@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Leendert van Doorn <leendert@watson.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tpmdd-devel@lists.sourceforge.net, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

On Wed, 3 Aug 2011, Ingo Molnar wrote:

> This fix was sent 5+ days ago (with still no reply to it), a day 
> after this fix the security tree pull request was sent with this 
> known build breakage included, so the bug is still unfixed upstream 
> and no fix is in the pipeline AFAICS. Got lost?

I thought it was already fixed in another patch.

Andrew just sent it to Linus, so it should be upstream soon.


- James
-- 
James Morris
<jmorris@namei.org>
