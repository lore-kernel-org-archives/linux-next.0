From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Fix "attempt to move .org backwards" error
Date: Tue, 10 Dec 2013 10:26:10 +1100
Message-ID: <1386631570.32037.40.camel@pasglop>
References: <20131209191015.22974.31604.stgit@mars>
	 <20131210101031.82b02468d32ddb89481b24b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:34094 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707Ab3LIX0a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Dec 2013 18:26:30 -0500
In-Reply-To: <20131210101031.82b02468d32ddb89481b24b9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Tue, 2013-12-10 at 10:10 +1100, Stephen Rothwell wrote:
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Works for me.  Thanks.  I will add this to linux-next today if Ben
> doesn't add it to his tree.

I will but probably not soon enough for your cut today

Cheers,
Ben.
