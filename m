From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the wireless-drivers-next tree
Date: Mon, 27 Jul 2015 08:41:49 +0300
Message-ID: <876156b1ia.fsf@kamboji.qca.qualcomm.com>
References: <20150722103239.04995fda@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44749 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750760AbbG0Fl5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2015 01:41:57 -0400
In-Reply-To: <20150722103239.04995fda@canb.auug.org.au> (Stephen Rothwell's
	message of "Wed, 22 Jul 2015 10:32:39 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> After merging the wireless-drivers-next tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
>
> ERROR: "of_default_bus_match_table" [drivers/bcma/bcma.ko] undefined!
>
> Caused by commit
>
>   cae761b5a6bd ("bcma: populate bus DT subnodes as platform_device-s")
>
> I have used the wireless-drivers-next tree from next-20150721 for today.

Yesterday I pushed the commit below which should fix this issue. Please
let me know if you still have any problems.

commit 92ff7a698badec3938edd3ba6b3e3ae035555365
Author: Hauke Mehrtens <hauke@hauke-m.de>
Date:   Sat Jul 25 21:10:27 2015 +0200

    bcma: fix build error when build as module
    
    Currently of_default_bus_match_table is not exported so we can only use
    this feature when bcma is build into the kernel. This patch removes
    support for child buses when bcma is build as a module as a temporary
    fix for a build problem introduces in this commit:
    
    commit cae761b5a6bdc597ba476a040fdcd5b4bc559b85
    Author: Rafal Milecki <zajec5@gmail.com>
    Date:   Sun Jun 28 17:17:13 2015 +0200
    
        bcma: populate bus DT subnodes as platform_device-s
    
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Fixes: cae761b5a6bd ("bcma: populate bus DT subnodes as platform_device-s")
    Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
    Signed-off-by: Kalle Valo <kvalo@codeaurora.org>


-- 
Kalle Valo
