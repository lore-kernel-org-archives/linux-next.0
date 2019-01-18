From: Fabio Estevam <festevam@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
Date: Fri, 18 Jan 2019 10:49:32 -0200
Message-ID: <CAOMZO5BiDiOmEn=ZEtADrzoVE1g17Tq24N=cUQbtdaOnSvbkog@mail.gmail.com>
References: <20190116083440.11b6839c@canb.auug.org.au> <154767815973.169631.1738587342757192096@swboyd.mtv.corp.google.com>
 <CAOMZO5DSbVpha=1_s5K+-vodD+N1fGnj41_UKmvqxDOPhxXwfg@mail.gmail.com>
 <154775054438.169631.5111867106558251203@swboyd.mtv.corp.google.com> <878szi3zp6.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <878szi3zp6.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

Hi Michael,

On Fri, Jan 18, 2019 at 10:41 AM Michael Ellerman <mpe@ellerman.id.au> wrote:

> Yeah "one line summary" is referring to the subject of the commit.
>
> So it doesn't explicitly say not to split it across lines, it probably
> should.
>
> eg: ?
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 30dc00a364e8..12a283ba3929 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -186,6 +186,8 @@ If your patch fixes a bug in a specific commit, e.g. you found an issue using
>
>         Fixes: e21d2170f366 ("video: remove unnecessary platform_set_drvdata()")
>
> +To ease parsing of the 'Fixes:' tag please don't split it across multiple lines.
> +
>  The following ``git config`` settings can be used to add a pretty format for
>  outputting the above style in the ``git log`` or ``git show`` commands::

Yes, I think this make it clearer. Thanks
