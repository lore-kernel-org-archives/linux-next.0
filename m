From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Move berlin/for-next from github to infradead
Date: Thu, 11 Sep 2014 23:36:16 +0200
Message-ID: <541215D0.2020104@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:56865 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208AbaIKVgZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Sep 2014 17:36:25 -0400
Received: by mail-wg0-f49.google.com with SMTP id m15so6642587wgh.20
        for <linux-next@vger.kernel.org>; Thu, 11 Sep 2014 14:36:23 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Stephen,

I moved mach-berlin repositories from github over to infradead
a while ago. To save me the extra git push to github,

can you please change berlin's URL from

git://github.com/shesselba/linux-berlin.git#berlin/for-next

to

git://git.infradead.org/users/hesselba/linux-berlin.git#berlin/for-next

Thanks!

Sebastian
