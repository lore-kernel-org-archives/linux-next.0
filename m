From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: build warning after merge of the hid tree
Date: Mon, 30 Apr 2012 10:42:39 +0200 (CEST)
Message-ID: <alpine.LRH.2.00.1204301042090.4912@twin.jikos.cz>
References: <20120430140523.bdb69a1c0e7d23522a5759d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53172 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754968Ab2D3Imn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Apr 2012 04:42:43 -0400
In-Reply-To: <20120430140523.bdb69a1c0e7d23522a5759d7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 30 Apr 2012, Stephen Rothwell wrote:

> Hi Jiri,
> 
> After merging the hid tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> In file included from drivers/hid/hid-core.c:37:0:
> include/linux/hidraw.h: In function 'hidraw_report_event':
> include/linux/hidraw.h:85:46: warning: no return statement in function returning non-void [-Wreturn-type]
> 
> Introduced by commit b6787242f327 ("HID: hidraw: add proper error
> handling to raw event reporting").

Now fixed by d6d7c87352, thanks a lot for the report.

-- 
Jiri Kosina
SUSE Labs
