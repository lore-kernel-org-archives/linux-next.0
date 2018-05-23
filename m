From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pinctrl tree
Date: Wed, 23 May 2018 11:49:29 +0200
Message-ID: <CACRpkdYH5ik_TJeouGh0CfhM8Kt=p7Sr3pUceVPBBjEGS2rZ_g@mail.gmail.com>
References: <20180516072753.49dd4d88@canb.auug.org.au> <CAMuHMdVEOmrd9da8XR0_wKJw9+KygkCUTSWvQjtP2Xh9aOkSFQ@mail.gmail.com>
 <CACRpkdYgE+UWqTZPSbxBP0ucQK5xS7qCsT=5hne-LevXdU3O5A@mail.gmail.com>
 <CAMuHMdVPonsrrmEeTmBR+3YW65hSaHbVOz-8_A10cLoAd2SXyw@mail.gmail.com>
 <CACRpkdZTMqf0sFCMPaX2aAcxrJ3LXAi7-Cfx5qevvp7To0V6NA@mail.gmail.com> <CAMuHMdXhE8WZnL5fR9pvDkMDVrRXQdajL0r=113eHuK9RKoigw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXhE8WZnL5fR9pvDkMDVrRXQdajL0r=113eHuK9RKoigw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

On Wed, May 16, 2018 at 7:40 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> I guess I should base my next pull request on the new commit
> 73dacc3403436fc2 ("pinctrl: sh-pfc: Add r8a77470 PFC support") in your
> tree, instead of on my previous pull request? Else there will be some
> conflicts (I checked: so far in one file only).

Yeah that should work. I try not to rebase my tree too much,
sometimes it happens anyway. This commit should be stable
and nice.

Yours,
Linus Walleij
