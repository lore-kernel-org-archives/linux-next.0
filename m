From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warnings after merge of the staging tree
Date: Mon, 30 Jan 2012 21:14:42 -0800
Message-ID: <20120131051442.GA25054@kroah.com>
References: <20120131142521.852ecb04b07f7174c179b3c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48943 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750794Ab2AaFPn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Jan 2012 00:15:43 -0500
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 2E4D721727
	for <linux-next@vger.kernel.org>; Tue, 31 Jan 2012 00:15:43 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120131142521.852ecb04b07f7174c179b3c8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Allyn <mark.a.allyn@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alan Cox <alan@linux.intel.com>

On Tue, Jan 31, 2012 at 02:25:21PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> drivers/staging/sep/sep_main.c: In function 'sep_allocate_dmatables_region':
> drivers/staging/sep/sep_main.c:217:2: warning: format '%X' expects argument of type 'unsigned int', but argument 5 has type 'size_t' [-Wformat]
> drivers/staging/sep/sep_main.c: In function 'sep_activate_msgarea_context':
> drivers/staging/sep/sep_main.c:3348:5: warning: format '%X' expects argument of type 'unsigned int', but argument 4 has type 'size_t' [-Wformat]
> drivers/staging/sep/sep_main.c: In function 'sep_create_msgarea_context':
> drivers/staging/sep/sep_main.c:3380:5: warning: format '%X' expects argument of type 'unsigned int', but argument 4 has type 'size_t' [-Wformat]
> drivers/staging/sep/sep_main.c: In function 'sep_read':
> drivers/staging/sep/sep_main.c:3466:2: warning: format '%X' expects argument of type 'unsigned int', but argument 5 has type 'size_t' [-Wformat]
> drivers/staging/sep/sep_main.c: In function 'sep_fastcall_args_get':
> drivers/staging/sep/sep_main.c:3526:5: warning: format '%X' expects argument of type 'unsigned int', but argument 4 has type 'size_t' [-Wformat]
> drivers/staging/sep/sep_main.c:3567:5: warning: format '%X' expects argument of type 'unsigned int', but argument 4 has type 'size_t' [-Wformat]
> drivers/staging/sep/sep_main.c:3567:5: warning: format '%X' expects argument of type 'unsigned int', but argument 5 has type 'size_t' [-Wformat]
> 
> Introduced by commit ff3d9c3c90c6 ("staging: sep: SEP update").

Thanks, I've already told Alan about them, he said he would resolve them
soon.

greg k-h
