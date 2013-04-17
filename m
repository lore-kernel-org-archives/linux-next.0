From: Alexandre Courbot <gnurou@gmail.com>
Subject: Removal of GENERIC_GPIO breaks -next
Date: Wed, 17 Apr 2013 19:37:33 +0900
Message-ID: <CAAVeFu+fM=fJ2zp-gX4T07COMB31yvs74dXUqrw1LH09M7MXLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ia0-f176.google.com ([209.85.210.176]:56874 "EHLO
	mail-ia0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753090Ab3DQKhy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Apr 2013 06:37:54 -0400
Received: by mail-ia0-f176.google.com with SMTP id i9so1258908iad.7
        for <linux-next@vger.kernel.org>; Wed, 17 Apr 2013 03:37:53 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shaveta Leekha <shaveta@freescale.com>, Christian Ruppert <christian.ruppert@abilis.com>
Cc: linux-next <linux-next@vger.kernel.org>

Hi Stephen,

It seems like the last few patches I pushed to my branch are going to
break powerpc/85xx due to a merge issue. I have tried to warn you by
email today but maybe you haven't read it yet.

arch/powerpc/platforms/85xx/Kconfig has a "select GENERIC_GPIO" which
will cause compilation breakage because I removed the GENERIC_GPIO
config option for all platforms. This line should be removed by my
"Convert selectors of GENERIC_GPIO to GPIOLIB" patch, but this line
slipped in between and is thus still here.

Also arch/arc/plat-tb10x/Kconfig now defines GENERIC_GPIO, this will
not cause breakage but should not be here anymore (ideally removed by
the "Remove GENERIC_GPIO config option" patch)

Apart from these two issues, things seem to have gone fine, but I'm
not sure how they should be addressed and by who?

Thanks,
Alex.
