From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2012-12-14-17-51 uploaded (staging/sb105x)
Date: Fri, 14 Dec 2012 21:29:40 -0800
Message-ID: <50CC0AC4.3080206@infradead.org>
References: <20121215015227.144C820004E@hpza10.eem.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:49641 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750783Ab2LOF2J (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 15 Dec 2012 00:28:09 -0500
In-Reply-To: <20121215015227.144C820004E@hpza10.eem.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

On 12/14/12 17:52, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2012-12-14-17-51 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.
> 


(not from mmotm patches)

When CONFIG_PARPORT is not enabled:

drivers/built-in.o: In function `multi_init':
sb_pci_mp.c:(.init.text+0x162ac): undefined reference to `parport_pc_probe_port'



-- 
~Randy
