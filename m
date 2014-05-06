From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the mvebu tree with the arm-soc tree
Date: Mon, 5 May 2014 18:13:10 -0700
Message-ID: <CAOesGMgLemvWtzN=eBwKerYxcVddx=Uc6O+5aLfL2Yg9GqPTBA@mail.gmail.com>
References: <20140506110758.9ddcae1a0fa3b9548e37bc58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f43.google.com ([209.85.216.43]:59540 "EHLO
	mail-qa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933432AbaEFBNL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 May 2014 21:13:11 -0400
Received: by mail-qa0-f43.google.com with SMTP id m5so4570189qaj.16
        for <linux-next@vger.kernel.org>; Mon, 05 May 2014 18:13:10 -0700 (PDT)
In-Reply-To: <20140506110758.9ddcae1a0fa3b9548e37bc58@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Mon, May 5, 2014 at 6:07 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the mvebu tree got a conflict in
> arch/arm/mach-mvebu/Kconfig between commit 55400f3a1f89 ("ARM: mvebu:
> clean-up unneeded kconfig selects") from the arm-soc tree and commit
> 8e6ac2033822 ("ARM: mvebu: enable the ARM SCU on Armada 375 and Armada
> 38x") from the mvebu tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks for the heads up. This will be resolved permanently once we
merge the mvebu contents into arm-soc (since that'll go on top of the
kconfig select cleanup).


-Olof
