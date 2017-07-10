From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: Today's linux-next build fail on powerpc
Date: Mon, 10 Jul 2017 23:21:57 +0530
Message-ID: <1499709117.19784.44.camel@abdul.in.ibm.com>
References: <1499320823.19784.17.camel@abdul.in.ibm.com>
         <CAHp75VdfjatKMWXzHLr7s3CCAh_-Gd=a2K72pFDdtt1X9Kk7Rw@mail.gmail.com>
         <1499697478.19784.42.camel@abdul.in.ibm.com>
         <CAHp75VdSgpviH9U1nh7HVL-t9kHHQeAdDSnAGjsXtFaXXTNnXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdSgpviH9U1nh7HVL-t9kHHQeAdDSnAGjsXtFaXXTNnXQ@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel <linux-kernel@vger.kernel.org>, Luis Oliveira <Luis.Oliveira@synopsys.com>, linux-next <linux-next@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2017-07-10 at 18:17 +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2017 at 5:37 PM, Abdul Haleem
> <abdhalee@linux.vnet.ibm.com> wrote:
> > On Fri, 2017-07-07 at 19:36 +0300, Andy Shevchenko wrote:
> >> On Thu, Jul 6, 2017 at 9:00 AM, Abdul Haleem
> >> <abdhalee@linux.vnet.ibm.com> wrote:
> >> > next-20170705 fails to build on powerpc with below errors.
> >> I had sent a fix yesterday. Had you chance to test it?
> 
> > drivers/i2c/busses/i2c-designware-platdrv.c:331:6: error: implicit
> > declaration of function
> > ‘i2c_detect_slave_mode’ [-Werror=implicit-function-declaration]
> >   if (i2c_detect_slave_mode(&pdev->dev))
> >       ^
> >   CC [M]  fs/jffs2/scan.o
> >
> > Please point me to the correct patch you are referring to ?
> 
> commit 8f1a357d41a22009150cf404b5aa5876efdb59b1
> 
>    i2c: Provide a stub for i2c_detect_slave_mode()
> 

Thanks Andy for the fix, the patch fixes the build errors.

Machine booted with no issues.

Reported-and-tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
