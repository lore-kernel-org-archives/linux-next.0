From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Thu, 8 Oct 2015 21:21:12 +1100
Message-ID: <20151008212112.2b09d418@canb.auug.org.au>
References: <20150929114531.2d611a2a@canb.auug.org.au>
	<20151002114932.043376ca@canb.auug.org.au>
	<20151008120424.6813920f@canb.auug.org.au>
	<CAAfyv37Jox-SK9gVORhGUnK5+x=p5SkXy_VeLtWMUePHxnCBFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAfyv37Jox-SK9gVORhGUnK5+x=p5SkXy_VeLtWMUePHxnCBFg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Belisko Marek <marek.belisko@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Belisko,

On Thu, 8 Oct 2015 08:12:06 +0200 Belisko Marek <marek.belisko@gmail.com> wrote:
>
> I did test it and it builds fine (multi_v7_defconfig). My HEAD is on
> dad463bdcbb41dfd17c799a5653bb57f185f2c76

That is next-20151002 which does not contain the broken commit.  I am
using the battery tree that was included in next-20150925 which is the
last time it worked for me.  The head of the battery tree them was
3636859b280ca595da4556274a509223f47e9a39 ("power_supply: Add support
for tps65217-charger."), it is now
6169588f69f864c39f04e6d65cc620e58822aec5 ("Documentation: power:
bq24257: Document exported sysfs entries") (and has been for some
time).  The bad commit is af19161aaed7 ("ARM: dts: twl4030: Add iio
properties for bci subnode").

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
