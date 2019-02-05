From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: linux-next: build warnings after merge of the staging tree
Date: Tue, 5 Feb 2019 10:24:03 +0000
Message-ID: <20190205102403.000046d6@huawei.com>
References: <20190205142217.0c9ecabf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190205142217.0c9ecabf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomasz Duszynski <tduszyns@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On Tue, 5 Feb 2019 14:22:17 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> drivers/iio/chemical/sps30.c: In function 'sps30_read_raw':
> drivers/iio/chemical/sps30.c:289:4: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     switch (chan->channel2) {
>     ^~~~~~
> drivers/iio/chemical/sps30.c:299:3: note: here
>    default:
>    ^~~~~~~
> drivers/iio/chemical/sps30.c: In function 'sps30_do_cmd':
> drivers/iio/chemical/sps30.c:120:10: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    buf[1] = (u8)SPS30_AUTO_CLEANING_PERIOD;
>           ^
> drivers/iio/chemical/sps30.c:121:2: note: here
>   case SPS30_READ_DATA_READY_FLAG:
>   ^~~~
> 
> Introduced by commits
> 
>   232e0f6ddeae ("iio: chemical: add support for Sensirion SPS30 sensor")
>   62129a0849d2 ("iio: chemical: sps30: allow changing self cleaning period")
> 
> I get this warning because I am building with -Wimplicit-fallthrough
> in attempt to catch new additions early.  The gcc warning can be turned
> off by adding a /* fall through */ comment at the point the fall through
> happens (assuming that the fall through is intentional).
> 

These both should both be marked - certainly look to be intentional.
The second one might be better handled with an additional return of the -EINVAL.

Thomasz, could you send me a patch tidying this up.

Thanks Stephen!

Jonathan
