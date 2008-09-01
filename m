From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the sound tree
Date: Mon, 01 Sep 2008 01:28:27 -0700 (PDT)
Message-ID: <20080901.012827.193698949.davem@davemloft.net>
References: <20080901142030.513d82eb.sfr@canb.auug.org.au>
	<20080831.213607.09599119.davem@davemloft.net>
	<s5hej4476p0.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:51106
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752046AbYIAI2d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Sep 2008 04:28:33 -0400
In-Reply-To: <s5hej4476p0.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tiwai@suse.de
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org

From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 01 Sep 2008 07:53:31 +0200

> Where can I find this change?  I now looked at
>   git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-2.6.git
> but it has no such a commit

sparc-next-2.6.git is where "-next" changes for Sparc live :)

> I can either remove the affecting chunk in my patch, or merge your
> patch first to my tree and rebase.

The other option is for Stephen to just keep fixing the merge,
if we just do nothing his way of doing this is automated.
