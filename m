From: Doug Anderson <dianders@chromium.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the regulator tree
Date: Wed, 21 Nov 2018 12:39:45 -0800
Message-ID: <CAD=FV=WErS73ZLVmnP1o1WYX1VfrhwhCa6yhRC4gS9B=3vPYGg@mail.gmail.com>
References: <20181122072528.11372826@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122072528.11372826@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,
On Wed, Nov 21, 2018 at 12:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   fe115f7fd44b ("regulator: core: Only count load for enabled consumers")
>
> is missing a Signed-off-by from its author.

Argh.  When I squashed two commits together I must have clobbered the
Signed-off-by.  :(  Is there a suggested way that I can fix this?

-Doug
