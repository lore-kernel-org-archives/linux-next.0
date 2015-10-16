From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Fri, 16 Oct 2015 12:10:45 +0200
Message-ID: <4536236.o1KfIdZ0yO@wuerfel>
References: <20151015132602.7816b658@canb.auug.org.au> <5895082.5iDhc8pylg@wuerfel> <20151016122704.4320da9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151016122704.4320da9e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Friday 16 October 2015 12:27:04 Stephen Rothwell wrote:
> Hi Arnd,
> 
> On Thu, 15 Oct 2015 14:28:20 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > diff --git a/include/asm-generic/io-64-nonatomic-hi-lo.h b/include/asm-generic/io-64-nonatomic-hi-lo.h
> > new file mode 100644
> > index 000000000000..32b73abce1b0
> > --- /dev/null
> > +++ b/include/asm-generic/io-64-nonatomic-hi-lo.h
> > @@ -0,0 +1,2 @@
> > +/* XXX: delete asm-generic/io-64-nonatomic-hi-lo.h after converting new users */
> > +#include <linux/io-64-nonatomic-hi-lo.h>
> 
> Turns out you need the same for io-64-nonatomic-lo-hi.h as well ...
> 
> 


D'oh!

fixed now, thanks for your patience.

	Arnd
