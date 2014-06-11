From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] drivers: Kconfig: Add HAS_IOMEM dependency for allmodconfig
 under score architecture
Date: Wed, 11 Jun 2014 10:53:35 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1406111053180.1321@pobox.suse.cz>
References: <5396F46A.30805@gmail.com> <5396F7F2.7080202@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49526 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751015AbaFKIxk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2014 04:53:40 -0400
In-Reply-To: <5396F7F2.7080202@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Cc: kishon@ti.com, linux-input@vger.kernel.org, linux-next@vger.kernel.org, liqin.linux@gmail.com, lennox.wu@gmail.com

On Tue, 10 Jun 2014, Chen Gang wrote:

> > When NO_IOMEM is enabled (e.g. score architecture), some drivers which
> > need HAS_IOMEM need notice about it, or it will report related warning:
> > 
> >   scripts/kconfig/conf --allmodconfig Kconfig
> >   kernel/time/Kconfig:162:warning: range is invalid
>     ^
> Oh, sorry, this line above need be removed, it is not for this patch, if
> still necessary to send patch v2 for it, please let me know, thanks.

I have fixed it up (together with adding a proper subject) and applied.

-- 
Jiri Kosina
SUSE Labs
