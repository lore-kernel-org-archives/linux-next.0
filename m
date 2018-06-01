From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86 tree
Date: Fri, 1 Jun 2018 17:55:00 +0300
Message-ID: <CAHp75VcJau2Yeg8Y_fMFbTsECxOBi+OvXVN58__JvB9GfiAu9A@mail.gmail.com>
References: <20180601213639.74f49e51@canb.auug.org.au> <CAHp75VeULdbi3_V8JPffYCocmGtjC3QPdE-yPz5eDrkpONeE-A@mail.gmail.com>
 <20180601220832.73ad5b84@canb.auug.org.au> <907F14B1-A97E-46FE-BDFE-F8D4A23DF2EC@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <907F14B1-A97E-46FE-BDFE-F8D4A23DF2EC@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Haruka Kawajiri <yukx00@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 1, 2018 at 5:33 PM,  <dvhart@infradead.org> wrote:
> On June 1, 2018 5:08:32 AM PDT, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>On Fri, 1 Jun 2018 14:40:35 +0300 Andy Shevchenko
>><andy.shevchenko@gmail.com> wrote:
>>>
>>> Oops. What is the proposed fix for that? It seems we can't rebase
>>> published branches.
>>
>>It's unfixable without a rebase, so you could instead consider it an
>>opportunity to improve your processes for the future. :-)
>
> Yeah, in this case we have to do a rebase.
>
> Andy, I've been wanting to look at using some simple bots and tags for this kind of thing. GitHub makes this really easy, might be time to move. We'll continue this offline.
>
> For now, please rebase next to correct the error as this change is on top of any of my commits, we won't make things worse by you recommitting my commits.

Done.

Author has been informed.

-- 
With Best Regards,
Andy Shevchenko
