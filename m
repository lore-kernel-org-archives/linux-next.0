From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: disabling -Wstringop-truncation
Date: Thu, 30 Aug 2018 18:17:01 -0700
Message-ID: <CA+55aFyApn2d+bv_3LGwXKnLpj2zdX6HYw_9cYZoNUVPi-Bu_g@mail.gmail.com>
References: <20180831080714.4f94fba9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831080714.4f94fba9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 30, 2018 at 3:07 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I am now mainly using gcc v8.2 for my builds and -Wstringop-truncation
> causes so many warnings that I am sure to miss others, so I have
> applied the below to my fixes tree until the noise reduces.

Applied.

If people want the warning with W=xyz, then this is still the correct
patch, and we should add a line to re-enable it in
scripts/Makefile.extrawarn.

             Linus
