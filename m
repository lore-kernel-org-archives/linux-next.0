From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: linux-next: please clean up the coresight tree
Date: Wed, 1 Aug 2018 09:21:56 -0600
Message-ID: <CANLsYkyX5yT0MozSN36OR0z1vXR9ndELv9m-fb4ULu07oZHLXw@mail.gmail.com>
References: <20180801154525.79da6372@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801154525.79da6372@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On Tue, 31 Jul 2018 at 23:45, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Mathieu,
>
> All but the last 9 commits in the coresight tree have been merged into
> the char-misc tree as different commits (they were sent to Greg as a
> patch series rather than a merge request).  Can you please rebase your
> tree into commit ccff2dfaceac ("coresight: tpiu: Fix disabling timeouts")
> from the char-misc tree to avoid further conflicts (and duplication if
> you ask Greg to merge your tree rather than take a patch series).
>

Absolutely  - right away.

Mathieu

> --
> Cheers,
> Stephen Rothwell
