From: dvhart@infradead.org
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86 tree
Date: Fri, 01 Jun 2018 07:33:41 -0700
Message-ID: <907F14B1-A97E-46FE-BDFE-F8D4A23DF2EC@infradead.org>
References: <20180601213639.74f49e51@canb.auug.org.au> <CAHp75VeULdbi3_V8JPffYCocmGtjC3QPdE-yPz5eDrkpONeE-A@mail.gmail.com> <20180601220832.73ad5b84@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180601220832.73ad5b84@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Haruka Kawajiri <yukx00@gmail.com>
List-Id: linux-next.vger.kernel.org



On June 1, 2018 5:08:32 AM PDT, Stephen Rothwell <sfr@canb=2Eauug=2Eorg=2E=
au> wrote:
>Hi Andy,
>
>On Fri, 1 Jun 2018 14:40:35 +0300 Andy Shevchenko
><andy=2Eshevchenko@gmail=2Ecom> wrote:
>>
>> Oops=2E What is the proposed fix for that? It seems we can't rebase
>> published branches=2E
>
>It's unfixable without a rebase, so you could instead consider it an
>opportunity to improve your processes for the future=2E :-)

Yeah, in this case we have to do a rebase=2E

Andy, I've been wanting to look at using some simple bots and tags for thi=
s kind of thing=2E GitHub makes this really easy, might be time to move=2E =
We'll continue this offline=2E

For now, please rebase next to correct the error as this change is on top =
of any of my commits, we won't make things worse by you recommitting my com=
mits=2E

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
