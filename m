From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
Date: Fri, 2 Nov 2018 22:31:07 -0700
Message-ID: <CAOesGMjXPKE21tcVRurGKArUP8ogGBYZ6t7ZmDe2h0iyapneiw@mail.gmail.com>
References: <20181103145752.6c1d10c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181103145752.6c1d10c8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

Looks like I accidentally rebased the fixes branch locally after
merging that patch in. Will fixup, thanks for reporting.


-Olof

On Fri, Nov 2, 2018 at 8:58 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   cda58c80fe27 ("ARM: OMAP1: ams-delta: Fix impossible .irq < 0")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell
