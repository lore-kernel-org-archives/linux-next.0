From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: linux-next: build failure after merge of the sunxi tree
Date: Wed, 1 Nov 2017 08:57:05 +0100
Message-ID: <20171101075705.GA19367@Red>
References: <20171101074345.5397cd3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:53665 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750808AbdKAH5J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Nov 2017 03:57:09 -0400
Content-Disposition: inline
In-Reply-To: <20171101074345.5397cd3f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 01, 2017 at 07:43:45AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sunxi tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dtb: ERROR (phandle_references): Reference to non-existent node or label "reg_gmac_3v3"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> 
> Caused by commit
> 
>   547a66779cbd ("ARM: dts: sunxi: Restore EMAC changes (boards)")
> 
> I have used the sunxi tree from next-20171018 for today.
> 

Sorry that's my fault.

I will send the fix soon.

Regards
