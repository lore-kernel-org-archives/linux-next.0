From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Date: Mon, 4 Dec 2017 08:32:56 +1100
Message-ID: <20171204083256.262c4b7c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60747 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752162AbdLCVdF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Dec 2017 16:33:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>

Hi all,

Commit

  5f56b7f4854a ("Revert "Merge tag 'scpi-updates-4.15' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into next/drivers"")

is missing a Signed-off-by from its author or committer.

Reverts are commits as well and so need an explanation of why they
are done and Signed-off-by tags.

-- 
Cheers,
Stephen Rothwell
