From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Sun, 11 Sep 2011 19:18:53 -0700
Message-ID: <4E6D6C0D.60100@codeaurora.org>
References: <20110912120501.764336af05069fa23a371b5e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110912120501.764336af05069fa23a371b5e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <davidb@codeaurora.org>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On 09/11/11 19:05, Stephen Rothwell wrote:
> Hi Arnd,
>
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-msm/board-msm8x60.c between commit 9e775ad19f52 ("ARM:
> 7012/1: Set proper TEXT_OFFSET for newer MSMs") from the arm tree and
> commit 56e2d8a68803 ("ARM: msm: Add devicetree support for msm8660-surf")
> from the arm-soc tree.
>
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.

The device tree machine description also needs to have the .fixup and
.reserve callbacks added to it so that the device tree machines boot
properly. Perhaps the soc tree needs to pull in Russell's tree at some
point to resolve this subtle logical conflict or when the trees are
merged together someone will need to do an evil merge and add the
callbacks in the merge commit.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
