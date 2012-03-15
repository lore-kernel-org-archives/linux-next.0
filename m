From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with Linus' tree
Date: Thu, 15 Mar 2012 20:01:12 +0000
Message-ID: <201203152001.12353.arnd@arndb.de>
References: <20120315175000.897f1172c296d4a687be0537@canb.auug.org.au> <1362815.uO65s14ojU@avalon>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:59958 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1032245Ab2COUB3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Mar 2012 16:01:29 -0400
In-Reply-To: <1362815.uO65s14ojU@avalon>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <damm@opensource.se>, "Rafael J. Wysocki" <rjw@sisk.pl>, Paul Mundt <lethal@linux-sh.org>

On Thursday 15 March 2012, Laurent Pinchart wrote:
> The following patch (5d7220ec000f rebased on top of 1740d3448012) shows the
> correct conflict resolution in my opinion.
> 
> From f040ba69632a54c86767974768d68b308901061c Mon Sep 17 00:00:00 2001
> From: Magnus Damm <damm@opensource.se>
> Date: Wed, 29 Feb 2012 12:37:19 +0900
> Subject: [PATCH] ARM: mach-shmobile: sh7372 map_io and init_early update
> 
> ARM: mach-shmobile: sh7372 map_io and init_early update
> 
> Update the sh7372 SoC and the AP4EVB and Mackerel boards to make use
> of the functions sh7372_map_io() and sh7372_add_early_devices().
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>
> Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Laurent,

I've merged Paul's branch into my renesas/soc branch, because I don't
rebase the branches once they are merged into arm-soc. Thanks a lot
for the resolution you suggested, I used the same resulting code
in the merge commit.

I'm not particularly happy about how we got here. Obviously, the bug
fixes that Paul sent should have gone through the arm-soc tree to
avoid this situation, and they should have been based on a -rc release
rather than some random commit after -rc6. It's not a big issue
because the next/soc branch already contains -rc7 though.

	Arnd
