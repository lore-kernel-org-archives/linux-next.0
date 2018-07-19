From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the amlogic tree
Date: Thu, 19 Jul 2018 14:26:47 -0500
Message-ID: <7h4lgvm3go.fsf@baylibre.com>
References: <20180716080014.75c9016b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716080014.75c9016b@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 16 Jul 2018 08:00:14 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, Olof Johansson <olof@lixom.net>
Cc: Carlo Caione <carlo@caione.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Commits
>
>   3f1ad8c53b29 ("ARM64: dts: meson: enable the saradc node in meson-gx-p23x-q20x.dtsi")
>   4dabd157d48e ("ARM64: dts: meson-gx-p23x-q20x: move the wifi node to each board's .dts")
>
> are missing a Signed-off-by from their committer.

Oops.  I missed these.

Olof, these were just merged by you in my PR[1].  How do you want me to
handle this?

I could respin the PR, or just send another with them reverted then
re-applied with signoff?

Or, since these branches don't need to be static (yet), I suppose you
could just edit the commits and add my signoff.  

I'm OK with any of the above, let me know your preferene.

Kevin

[1] https://marc.info/?l=linux-arm-kernel&m=153184268320170
