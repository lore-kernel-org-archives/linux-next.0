From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the final tree (arm-soc tree related)
Date: Thu, 15 Mar 2012 16:39:38 +0000
Message-ID: <201203151639.38223.arnd@arndb.de>
References: <20120315105901.7b10c9f4de9374a613436988@canb.auug.org.au> <20120315002020.GA16189@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:61890 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031645Ab2COQju (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Mar 2012 12:39:50 -0400
In-Reply-To: <20120315002020.GA16189@titan.lakedaemon.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Michael Walle <michael@walle.cc>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 15 March 2012, Jason Cooper wrote:
> That's my mistake.  I did a pull request for the wrong branch.  Olof,
> could you please drop the offending branch and I'll submit a new pull
> request once I have a chance to test Arnd's irq patch?

I reverted this in the for-next branch for now. The two initial patches
from the kirkwood/board branch are still present.

	Arnd
