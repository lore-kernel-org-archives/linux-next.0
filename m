From: Doug Anderson <dianders@chromium.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the regulator tree
Date: Wed, 21 Nov 2018 12:50:56 -0800
Message-ID: <CAD=FV=X4JjQYnuqR_tKcu8t5mAGFnLt1x+u_F9XB+G=7iPXhWA@mail.gmail.com>
References: <20181122072528.11372826@canb.auug.org.au> <CAD=FV=WErS73ZLVmnP1o1WYX1VfrhwhCa6yhRC4gS9B=3vPYGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=WErS73ZLVmnP1o1WYX1VfrhwhCa6yhRC4gS9B=3vPYGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Wed, Nov 21, 2018 at 12:39 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
> On Wed, Nov 21, 2018 at 12:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Commit
> >
> >   fe115f7fd44b ("regulator: core: Only count load for enabled consumers")
> >
> > is missing a Signed-off-by from its author.
>
> Argh.  When I squashed two commits together I must have clobbered the
> Signed-off-by.  :(  Is there a suggested way that I can fix this?

Oh.  Actually it looks like my dumb commit message is to blame.  :(  I
used two dashes ("--") to separate parts of my patch description.
"git am" seems to think this means it's after the cut.  Thus my
"Signed-off-by" got cut off...

-Doug
