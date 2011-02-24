From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the omap_dss2 tree with the omap
 tree
Date: Thu, 24 Feb 2011 13:23:39 -0800
Message-ID: <20110224212339.GM20560@atomide.com>
References: <20110221141650.71b433b7.sfr@canb.auug.org.au>
 <1298278062.4931.19.camel@deskari>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-01-ewr.mailhop.org ([204.13.248.71]:20106 "EHLO
	mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932139Ab1BXVXp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Feb 2011 16:23:45 -0500
Content-Disposition: inline
In-Reply-To: <1298278062.4931.19.camel@deskari>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "Guruswamy, Senthilvadivu" <svadivu@ti.com>

Hi,

* Tomi Valkeinen <tomi.valkeinen@ti.com> [110221 00:46]:
> 
> Tony, do you have such a semi-stable branch I could use as a base? Or
> any other ideas?

I guess you already figured this out.. The omap-for-linus branch should
have immutable commits. So you can merge with the earliest commit that
does the job for you from there.

Regards,

Tony
