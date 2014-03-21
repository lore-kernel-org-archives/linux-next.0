From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [next]  da8xx_omapl_defconfig has been removed.
Date: Fri, 21 Mar 2014 11:56:53 -0400
Message-ID: <532C6145.6070107@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:62968 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755353AbaCUP4s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Mar 2014 11:56:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Stephen,

This target build:

http://kisskb.ellerman.id.au/kisskb/target/7977/

is no longer valid as of this commit:

commit 4b9e44f8d7c9cd166d8304b8f619741c1d59b836
Author: Sekhar Nori <nsekhar@ti.com>
Date:   Wed Feb 26 10:41:24 2014 +0530

    ARM: davinci: remove da8xx_omapl_defconfig
    
    Remove da8xx_omapl_defconfig. Use davinci_all_defconfig
    for da830 and da850 as well.
    
    Signed-off-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Paul.
