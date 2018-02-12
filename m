From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: lots of merges in the sound-asoc tree
Date: Tue, 13 Feb 2018 09:38:57 +1100
Message-ID: <20180213093857.2fe78090@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46129 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932628AbeBLWjA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Feb 2018 17:39:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi all,

I know that you usually like to keep one topic branch per soc and then
merge them all, but currently your tree seems to only contain a couple
logical changes (platform to component and codec to component), so
surely that could have been done in (maybe) 2 topic branches and saved
large number of very small branches (often a single commit) and a large
number of merges.

-- 
Cheers,
Stephen Rothwell
