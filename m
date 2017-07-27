From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Signed-off-by missing in commit in the arm-soc tree
Date: Thu, 27 Jul 2017 22:59:49 +0200
Message-ID: <CAK8P3a3kY=i-TB__yY_ELAGq_GG=10JzgXGPRbTeAtcz8qHo=A@mail.gmail.com>
References: <20170728012134.39de1c48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170728012134.39de1c48@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jul 27, 2017 at 5:21 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> I noticed that commit
>
>   2cb68e9b44f7 ("ARM: ep93xx: normalize clk API")
>
> has no Signed-off-by from its committer.

Thanks, my mistake. I initially cherry-picked this one and added my S-o-B,
but then had to do it again and forgot to add it when I picked it the
second time.

I uploaded the new head now. Alexander, when you rebase your other patches
on top of the fixes branch, please make sure you have the version I
just uploaded,
not the one from earlier today.  I usually don't rebase that branch,
but it seemed
otherwise harmless enough.

      Arnd
