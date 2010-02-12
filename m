From: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the trivial tree with the drm tree
Date: Fri, 12 Feb 2010 04:41:30 +0000 (GMT)
Message-ID: <alpine.DEB.2.00.1002120440510.26950@skynet.skynet.ie>
References: <20100212151223.21746bc7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gir.skynet.ie ([193.1.99.77]:39756 "EHLO gir.skynet.ie"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756035Ab0BLElo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Feb 2010 23:41:44 -0500
In-Reply-To: <20100212151223.21746bc7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adam Buchbinder <adam.buchbinder@gmail.com>, Alex Deucher <alexdeucher@gmail.com>


> Hi Jiri,

Can we drop any cleanups to atombios.h?

This file comes from AMD and we normally drop it into place, so they just 
get overwritten next time.

Dave.
