From: "Jan Beulich" <jbeulich@novell.com>
Subject: Re: linux-next: kbuild tree build failure
Date: Tue, 05 May 2009 07:35:02 +0100
Message-ID: <49FFFA36.76EA.0078.0@novell.com>
References: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vpn.id2.novell.com ([195.33.99.129]:42572 "EHLO
	vpn.id2.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754575AbZEEGyJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2009 02:54:09 -0400
In-Reply-To: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>
Cc: StevenWhitehouse <swhiteho@redhat.com>, linux-next@vger.kernel.org

>>> Stephen Rothwell <sfr@canb.auug.org.au> 05.05.09 03:17 >>>
>OK, looking at the preprocessor output, I see we have a previous variable
>(static match_table_t __initconst tokens) with __attribute__ ((__section__
>(".init.rodata"))) but it is not const ... (This came from commit
>a447c0932445f92ce6f4c1bd020f62c5097a7842 "vfs: Use const for kernel
>parser table" which changed "tokens" from __initdata to __initconst.  Not
>using "const" seems deliberate, but the changelog does not include enough
>information as to why.)
>
>So, I will revert the above commit for today to allow it to be "improved"
>by also fixing the tokens variable definition above.  Of course there may
>be other places where such mixed definitions exist.

That is the downside of not folding the 'const' modifier into the __initconst
annotation. It is *always* an error to annotate something __initconst but
not also make it const.

Jan
