From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: build warning after merge of the trivial tree
Date: Tue, 10 Mar 2015 10:47:54 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1503101047090.26925@pobox.suse.cz>
References: <20150310163417.505f0da8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56458 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750892AbbCJJr4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 05:47:56 -0400
In-Reply-To: <20150310163417.505f0da8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan <gnomes@lxorguk.ukuu.org.uk>, Alan Cox <alan@linux.intel.com>

On Tue, 10 Mar 2015, Stephen Rothwell wrote:

> Hi Jiri,
> 
> After merging the trivial tree, today's linux-next build ()
> produced this warning:
> 
> drivers/tty/goldfish.c: In function 'goldfish_tty_probe':
> drivers/tty/goldfish.c:232:6: warning: unused variable 'i' [-Wunused-variable]
>   int i;
>       ^
> 
> Introduced by commit 2a2483685a9d ("goldfish: remove unreachable line
> of code").

Thanks for the report Stephen, now fixed via 0e4f93e501 in 
trivial.git#for-next.

-- 
Jiri Kosina
SUSE Labs
