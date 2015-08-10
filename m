From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the regulator
 tree
Date: Mon, 10 Aug 2015 12:37:29 +1000
Message-ID: <20150810123729.58c74531@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36720 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752362AbbHJChd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Aug 2015 22:37:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in:

  drivers/regulator/max77843.c

between commit:

  2a32b401a11f ("regulator: Remove the max77843 driver")

from the regulator tree and commit:

  971bd8fa369a ("treewide: Fix typo in printk")

from the trivial tree.

I fixed it up (the former removed the file, so I did that) and can carry
the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
