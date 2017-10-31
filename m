From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sunxi tree
Date: Wed, 1 Nov 2017 07:43:45 +1100
Message-ID: <20171101074345.5397cd3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47539 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753855AbdJaUns (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Oct 2017 16:43:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>

Hi all,

After merging the sunxi tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dtb: ERROR (phandle_references): Reference to non-existent node or label "reg_gmac_3v3"

ERROR: Input tree has errors, aborting (use -f to force output)

Caused by commit

  547a66779cbd ("ARM: dts: sunxi: Restore EMAC changes (boards)")

I have used the sunxi tree from next-20171018 for today.

-- 
Cheers,
Stephen Rothwell
