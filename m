From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the bcm2835 tree with the arm-soc tree
Date: Mon, 08 Dec 2014 12:25:01 +0100
Message-ID: <2406890.FlzRjyvuXd@wuerfel>
References: <20141208120619.68287b54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141208120619.68287b54@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Matthias Klein <matthias.klein@linux.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-next.vger.kernel.org

On Monday 08 December 2014 12:06:19 Stephen Rothwell wrote:
> Hi Stephen,
> 
> Today's linux-next merge of the bcm2835 tree got a conflict in
> arch/arm/boot/dts/Makefile between commit 302a5ef29d49 ("ARM: BCM5301X:
> Add DT for Netgear R6300 V2") from the arm-soc tree and commit
> 6298ed17a404 ("ARM: bcm2835: Add device tree for Raspberry Pi model
> B+") from the bcm2835 tree.
> 
> I fixed it up (the bcm2835 tree patch is also in the arm-soc tree as
> commit ba2a1d6959ac ("ARM: bcm2835: Add device tree for Raspberry Pi
> model B+"), so I just used the arm-soc version) and can carry the fix
> as necessary (no action is required).

Thanks a lot for the notification!

Lee, do you know what is going on? Did you accidentally rebase a commit
that you already sent for inclusion in arm-soc?

	Arnd
