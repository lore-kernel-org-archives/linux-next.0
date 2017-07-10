From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: Today's linux-next build fail on powerpc
Date: Mon, 10 Jul 2017 20:07:58 +0530
Message-ID: <1499697478.19784.42.camel@abdul.in.ibm.com>
References: <1499320823.19784.17.camel@abdul.in.ibm.com>
         <CAHp75VdfjatKMWXzHLr7s3CCAh_-Gd=a2K72pFDdtt1X9Kk7Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdfjatKMWXzHLr7s3CCAh_-Gd=a2K72pFDdtt1X9Kk7Rw@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel <linux-kernel@vger.kernel.org>, Luis Oliveira <Luis.Oliveira@synopsys.com>, linux-next <linux-next@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

On Fri, 2017-07-07 at 19:36 +0300, Andy Shevchenko wrote:
> On Thu, Jul 6, 2017 at 9:00 AM, Abdul Haleem
> <abdhalee@linux.vnet.ibm.com> wrote:
> > Hi Luis,
> >
> > next-20170705 fails to build on powerpc with below errors.
> 
> Hi,
> 
> I had sent a fix yesterday. Had you chance to test it?
> 
> 

Are these the one you are referring to ?

[v1,2/2] ACPI / boot: Don't define unused variables 
[v1,1/2] ACPI / boot: Correct address space of __acpi_map_table()

Applying above patches did not fix the build failure.

drivers/i2c/busses/i2c-designware-platdrv.c:331:6: error: implicit
declaration of function
‘i2c_detect_slave_mode’ [-Werror=implicit-function-declaration]
  if (i2c_detect_slave_mode(&pdev->dev))
      ^
  CC [M]  fs/jffs2/scan.o

Please point me to the correct patch you are referring to ?

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
