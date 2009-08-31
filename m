From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the drm tree with the net tree
Date: Sun, 30 Aug 2009 21:29:18 -0700 (PDT)
Message-ID: <20090830.212918.146621489.davem@davemloft.net>
References: <20090831142105.7c05ae77.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:39798
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751319AbZHaE3E (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Aug 2009 00:29:04 -0400
In-Reply-To: <20090831142105.7c05ae77.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: airlied@linux.ie, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk, divy@chelsio.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 31 Aug 2009 14:21:05 +1000

> Hi Dave,
> 
> Today's linux-next merge of the drm tree got a conflict in
> firmware/Makefile between commit 2e8c07c35b3ffee7689406be61fd1448ee45d3cd
> ("cxgb3: use request_firmware() for the EDC registers setup") from the
> net tree and commit ece2be7993cc5e269cbf0cad6442b401a2c31915 ("drm/mga:
> Use request_firmware() to load microcode") from the drm tree.
> 
> Just context changes. I fixed it up (see below) and can carry the fix as
> necessary.

This looks fine, please carry the fix until we all merge this stuff
in during the merge window :-)
