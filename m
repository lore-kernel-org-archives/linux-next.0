From: Paul Mundt <lethal@linux-sh.org>
Subject: genesis-2.6 tree addition request
Date: Mon, 8 Feb 2010 13:32:09 +0900
Message-ID: <20100208043209.GA7674@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:58989 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754248Ab0BHEcZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 7 Feb 2010 23:32:25 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

I'd like to get the genesis-2.6 tree rolled in to -next. This is
primarily for supporting ARM-based SH-Mobile G-series CPUs, which were
previously discussed on the ARM lists.

There shouldn't be any ordering issues, but it would be ideal to place
this after both the sh and arm trees in the merge order to avoid any
future issues.

The tree is at:

	git://git.kernel.org/pub/scm/linux/kernel/git/lethal/genesis-2.6.git

and also contains the following defconfigs:

	ap4evb_defconfig
	g3evm_defconfig
	g4evm_defconfig

which would be nice to have added to the ARM defconfig builds. Any issues
that pop up with these configs are likely to be SH-related and ideally
should come to me directly, rather than having to bother Russell with
them.
