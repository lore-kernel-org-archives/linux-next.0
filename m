From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] x86_32: fix printk formats
Date: Fri, 13 Feb 2009 09:25:56 +0100
Message-ID: <20090213082556.GB4606@elte.hu>
References: <20090212194408.ff7489c1.sfr@canb.auug.org.au> <49946DB8.9030801@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:60389 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751465AbZBMI0Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Feb 2009 03:26:24 -0500
Content-Disposition: inline
In-Reply-To: <49946DB8.9030801@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix printk format warnings and also change 2 %ld to %lu for unsigned long
> variables.
> 
> arch/x86/mm/init_32.c:727: warning: format '%u' expects type 'unsigned int', but argument 2 has type 'long unsigned int'
> arch/x86/mm/init_32.c:735: warning: format '%u' expects type 'unsigned int', but argument 2 has type 'long unsigned int'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  arch/x86/mm/init_32.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Already fixed in the x86 tree, but thanks.

	Ingo
