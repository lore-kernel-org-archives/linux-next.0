From: Linus Walleij <linus.walleij@stericsson.com>
Subject: Re: linux-next: build failure after merge of the rr tree
Date: Wed, 19 Jan 2011 11:04:25 +0100
Message-ID: <4D36B729.4040609@stericsson.com>
References: <20110119154210.435453e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110119154210.435453e4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 01/19/2011 05:42 AM, Stephen Rothwell wrote:
> Presumably caused by commit b64781e8e2b0f480affb170460cbfb3b11fa9e5d
> ("param: add null statement to compiled-in module params").  I wonder how
> many more build errors this change may provoke.  Please try to find them
> and fix them before adding this change, thanks.
>    

It can provoke if I'm not mistaken, one more error. So two in total.

grep -r -E '^MODULE_.*\(.*\) *[^;]* *$' .
Yields a lot of false positives (enhancements welcome) that sifts down
to these two:

./net/dsa/dsa.c:MODULE_AUTHOR("Lennert Buytenhek <buytenh@wantstofly.org>")
./drivers/net/arm/ks8695net.c:MODULE_AUTHOR("Simtec Electronics")

I'll send patches for these two, so Rusty can apply them on
top of his next branch and be done with it.

> I used the version of the rr tree from next-20110118 for today.
>    

Couldn't find any more violators in the next tree.

There shouldn't be many: any file that is built as modules with
allmod will result in compile error even without this patch, the two above
must already be broken with allmodconfig, presumably they are
used in archs that do not enable loadable modules, so they don't
see the problem.

Yours,
Linus Walleij
