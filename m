From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the pinctrl tree
Date: Mon, 16 Jul 2018 09:47:44 +0200
Message-ID: <CACRpkdaw5s4=-6Pfko9SoCScwBYHVuMJzPk7jr6mrqhPp6b02Q@mail.gmail.com>
References: <20180716081018.21bfe495@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716081018.21bfe495@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 16, 2018 at 12:10 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>   bc319333c156 ("pinctrl: sh-pfc: r8a77965: Add HSCIF pins, groups, and functions")
>   99500c6a4836 ("pinctrl: sh-pfc: r8a77990: Revise USB ID pin name")
>   3d3c62d3458a ("pinctrl: sh-pfc: r8a77990: Add USB2.0 pins, groups and functions")
>   1e0f13198edf ("pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and functions")
>
> are missing a Signed-off-by from their committer.

Oh initially it was just one of them, I rebased and fixed the one I thought
was the offender.

Oh well. I go back and fix all.

Yours,
Linus Walleij
