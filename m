From: Stephen Warren <swarren@nvidia.com>
Subject: RE: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Tue, 4 Oct 2011 08:48:33 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173A2C6F74@HQMAIL01.nvidia.com>
References: <20111004110831.a4d6d72a9b75a38265c9d6a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate03.nvidia.com ([216.228.121.140]:1391 "EHLO
	hqemgate03.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932718Ab1JDPsn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Oct 2011 11:48:43 -0400
In-Reply-To: <20111004110831.a4d6d72a9b75a38265c9d6a1@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <rmk@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>

Stephen Rothwell wrote at Monday, October 03, 2011 6:09 PM:
> Hi Arnd,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-tegra/board-seaboard.h between commit ea5abbd215b7 ("ARM:
> 7101/1: arm/tegra: Replace <mach/gpio.h> with <mach/gpio-tegra.h>") from
> the arm tree and commit a697e694aeb8 ("ARM: Tegra: Seaboard board updates
> for audio") from the arm-soc tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Both this and the similar fixup in the other email look fine to me.

For my education, how does this get resolved; presumably neither Russell's
tree nor arm-soc can take a patch that fixes this right now, so does one of
the trees get rebased after the merge of the other but before being pulled
by Linus, or does Linus do this merge fixup when he pulls?

Thanks for cluing me in!

-- 
nvpublic
