From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: linux-next: error while fetching the spi-nor tree
Date: Wed, 13 Dec 2017 00:48:57 +0100
Message-ID: <680c59fd-7a1b-87e9-c0f5-aba07a41e045@wedev4u.fr>
References: <20171213075845.5923cc80@canb.auug.org.au>
 <12d92a91-bacc-38ae-9906-ac83ed32a0f6@wedev4u.fr>
 <CA+55aFynbxKc9TgUvcDkMHUn1bnG8pf1MfYgxnHo88LCaVpFqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFynbxKc9TgUvcDkMHUn1bnG8pf1MfYgxnHo88LCaVpFqg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

+ MTD maintainers

Le 12/12/2017 à 23:53, Linus Torvalds a écrit :
> On Tue, Dec 12, 2017 at 1:24 PM, Cyrille Pitchen
> <cyrille.pitchen@wedev4u.fr> wrote:
>>
>> I don't see anything wrong when fetching the tree or when browsing the
>> web server:
>> http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/spi-nor/next
> 
> There's definitely something funky there.
> 
>   http://git.infradead.org/l2-mtd.git/commitdiff/f3203415105860e811f4ee9508efd009c9e6525e
>   http://git.infradead.org/l2-mtd.git/commitdiff/7a6843af9089b01eab266bbee0ed19f98f09a94a
> 
> both show "no differences found". I suspect that's because of git diff
> failing due to missing objects.
> 
> Most likely reason? Something like an unsafe garbage collect / prune
> operation at infradead.org at the same time as you pushed. I don't
> know what infradead.org does, but you can definitely do bad things
> maintaining a git tree.
> 
> I would suggest doing a force-push back to some known-good state, and
> then pushing it out again.
> 
> Ie, something like
> 
>     git push --force infradead.org:l2-mtd.git v4.15-rc1:master
> 
> to reset the master branch to v4.15-rc1, and then pushing out again.
> And then asking whoever maintains the infradead git trees if something
> odd happened..
>

I think I've fixed the issue following your advice.
However I don't know what happened to these old commits.
I've added MTD in Cc if they have some idea.

Anyway, sorry for this mess and thanks for your help!

Best regards,

Cyrille

 
>               Linus
> 
