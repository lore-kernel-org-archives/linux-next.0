From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the drm tree
Date: Fri, 12 Feb 2010 10:29:07 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1002121028520.30967@pobox.suse.cz>
References: <20100212151223.21746bc7.sfr@canb.auug.org.au> <alpine.DEB.2.00.1002120440510.26950@skynet.skynet.ie>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:51675 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751000Ab0BLJ3J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Feb 2010 04:29:09 -0500
In-Reply-To: <alpine.DEB.2.00.1002120440510.26950@skynet.skynet.ie>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adam Buchbinder <adam.buchbinder@gmail.com>, Alex Deucher <alexdeucher@gmail.com>

On Fri, 12 Feb 2010, Dave Airlie wrote:

> > Hi Jiri,
> 
> Can we drop any cleanups to atombios.h?
> 
> This file comes from AMD and we normally drop it into place, so they just 
> get overwritten next time.

Thanks for letting me know, I have reverted the hunk touching this file.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
