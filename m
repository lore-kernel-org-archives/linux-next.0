From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] microcode_amd: fix shift warning
Date: Fri, 22 Aug 2008 06:55:34 +0200
Message-ID: <20080822045534.GA3686@elte.hu>
References: <20080821134351.2b19ac2d.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:33530 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751109AbYHVEz4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Aug 2008 00:55:56 -0400
Content-Disposition: inline
In-Reply-To: <20080821134351.2b19ac2d.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Peter Oruba <peter.oruba@amd.com>, x86@kernel.org, linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> microcode_amd.c uses ">> 32" on a 32-bit value, so gcc warns about that.
> The code could use something like this *untested* patch.
> 
> linux-next-20080821/arch/x86/kernel/microcode_amd.c:229: warning: right shift count >= width of type
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

applied to tip/x86/microcode - thanks Randy!

	Ingo
