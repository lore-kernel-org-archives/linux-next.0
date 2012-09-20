From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Thu, 20 Sep 2012 09:04:42 +0200
Message-ID: <CACRpkdaLr-v2CBjZsqLGx_tmthJYLscnEQhhDQrqTAQ0TVW87g@mail.gmail.com>
References: <20120920160314.b3ea668fc0766224c24bf276@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120920160314.b3ea668fc0766224c24bf276@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Thu, Sep 20, 2012 at 8:03 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-integrator/integrator_cp.c between commit 73efd53012af
> ("ARM: 7519/1: integrator: convert platform devices to Device Tree") from
> the arm tree and commit b7a3f8db07c1 ("ARM: integrator: use __iomem
> pointers for MMIO") from the arm-soc tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks correct!
Thanks.
Linus Walleij
