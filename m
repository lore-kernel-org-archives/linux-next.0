From: "Sell, Timothy C" <Timothy.Sell@unisys.com>
Subject: RE: randconfig build error with next-20151013, in
 drivers/staging/unisys/visorinput
Date: Tue, 13 Oct 2015 17:51:29 +0000
Message-ID: <52c204c03ddd4d3c8596e6ed4ebfc7f5@US-EXCH13-2.na.uis.unisys.com>
References: <CA+r1ZhjFFR2arvHeNp54qtKcSPTR=Fiws_oaFx2CZXYoPioB2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CA+r1ZhjFFR2arvHeNp54qtKcSPTR=Fiws_oaFx2CZXYoPioB2A@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Romer, Benjamin M" <Benjamin.Romer@unisys.com>, "Kershner, David A" <David.Kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, *S-Par-Maintainer <SParMaintainer@unisys.com>, devel <devel@driverdev.osuosl.org>
List-Id: linux-next.vger.kernel.org

We have a patch in the pipeline to add "INPUT" to the "depends on" in drivers/staging/unisys/visorinput/Kconfig, which will fix this problem.  Thanks Jim.

- Tim Sell

> -----Original Message-----
> From: Jim Davis [mailto:jim.epost@gmail.com]
> Sent: Tuesday, October 13, 2015 1:34 PM
> To: Stephen Rothwell; linux-next; linux-kernel; Romer, Benjamin M;
> Kershner, David A; Greg Kroah-Hartman; *S-Par-Maintainer; devel
> Subject: randconfig build error with next-20151013, in
> drivers/staging/unisys/visorinput
> 
> Building with the attached random configuration file,
> 
> ERROR: "input_free_device"
> [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
> ERROR: "input_set_capability"
> [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
> ERROR: "input_set_abs_params"
> [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
> ERROR: "input_register_device"
> [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
> ERROR: "input_allocate_device"
> [drivers/staging/unisys/visorinput/visorinput.ko]  undefined!
> ERROR: "input_unregister_device"
> [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
> ERROR: "input_event" [drivers/staging/unisys/visorinput/visorinput.ko]
> undefined!
> 
> 
> --
> Jim
