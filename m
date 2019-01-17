From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: linux-next: Fixes tag needs work in the amlogic tree
Date: Thu, 17 Jan 2019 13:12:40 -0800
Message-ID: <7h4la7aszb.fsf@baylibre.com>
References: <20190116074510.7c7e6a4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116074510.7c7e6a4a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Carlo Caione <carlo@caione.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> [I am experimenting with checking the Fixes tags in commits in linux-next.
> Please let me know if you think I am being too strict.]
>
> Hi all,
>
> Commit
>
>   90d2bf8975cc ("ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator power failed warning")
>
> has a malformed Fixes tag:
>
>   Fixes: 5a0803bd5ae (ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes)
>
> There should be at least 12 digits of the commit SHA1 and double quotes
> around the commit subject.

Thanks, since I hadn't submitted these yet, I fixed this up and
updated the branch.

Kevin
