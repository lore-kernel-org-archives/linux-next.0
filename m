From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mvebu tree with the arm-soc tree
Date: Sun, 1 Nov 2015 10:35:55 +1100
Message-ID: <20151101103555.2464c0ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46681 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060AbbJaXgA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 31 Oct 2015 19:36:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>, andrew@lunn.ch, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>

Hi all,

Today's linux-next merge of the mvebu tree got a conflict in:

  arch/arm/mach-mvebu/pmsu.c

between commit:

  9d2ea95a599a ("ARM: mvebu: add broken-idle option")

from the arm-soc tree and commit:

  da6ee32a42c0 ("ARM: mvebu: add broken-idle option")

from the mvebu tree.

I fixed it up (looks like 2 version of the same thing (though different)
so I just used the version from the arm-doc tree) and can carry the fix
as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
