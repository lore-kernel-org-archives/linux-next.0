From: "Nori, Sekhar" <nsekhar@ti.com>
Subject: Change in DaVinci tree for linux-next
Date: Mon, 25 Apr 2011 22:51:15 +0530
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB593024CAE3412@dbde02.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:47508 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758672Ab1DYRVx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Apr 2011 13:21:53 -0400
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Hilman, Kevin" <khilman@ti.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Stephen,

Can you please change the davinci tree in linux-next from:

git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-davinci.git davinci-next

to:

git://gitorious.org/linux-davinci/linux-davinci.git davinci-next

Kevin recently added me as the co-maintainer for TI DaVinci support
and I would be taking over the job of actively collecting the patches
to be merged from the next merge window onward.

I have made sure the new tree/branch is an exact mirror of Kevin's
current tree so the switch by itself should not change anything.

Thanks,
Sekhar
