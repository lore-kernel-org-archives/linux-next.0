From: "Sell, Timothy C" <Timothy.Sell@unisys.com>
Subject: RE: randconfig build error with next-20150923, in
 drivers/staging/unisys/visorhid
Date: Wed, 23 Sep 2015 17:33:46 +0000
Message-ID: <498ac36b8eb640fdb31e4123f745c116@US-EXCH13-2.na.uis.unisys.com>
References: <CA+r1Zhg3z3BmX9F0pv83P3QA1mpZUPANCt1=uEM8BXyOVzjzKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CA+r1Zhg3z3BmX9F0pv83P3QA1mpZUPANCt1=uEM8BXyOVzjzKw@mail.gmail.com>
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
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Romer, Benjamin M" <Benjamin.Romer@unisys.com>, "Kershner, David A" <David.Kershner@unisys.com>, *S-Par-Maintainer <SParMaintainer@unisys.com>, devel <devel@driverdev.osuosl.org>
List-Id: linux-next.vger.kernel.org

> -----Original Message-----
> From: Jim Davis [mailto:jim.epost@gmail.com]
> Sent: Wednesday, September 23, 2015 1:29 PM
> To: Stephen Rothwell; linux-next; linux-kernel; Greg Kroah-Hartman;
> Romer, Benjamin M; Kershner, David A; *S-Par-Maintainer; devel
> Subject: randconfig build error with next-20150923, in
> drivers/staging/unisys/visorhid
> 
> Building with the attached random configuration file,
> 
> ERROR: "input_free_device"
> [drivers/staging/unisys/visorhid/visorhid.ko] undefined!
> ERROR: "input_set_capability"
> [drivers/staging/unisys/visorhid/visorhid.ko] undefined!
> ERROR: "input_set_abs_params"
> [drivers/staging/unisys/visorhid/visorhid.ko] undefined!
> ERROR: "input_register_device"
> [drivers/staging/unisys/visorhid/visorhid.ko] undefined!
> ERROR: "input_allocate_device"
> [drivers/staging/unisys/visorhid/visorhid.ko] undefined!
> ERROR: "input_unregister_device"
> [drivers/staging/unisys/visorhid/visorhid.ko] undefined!
> ERROR: "input_event" [drivers/staging/unisys/visorhid/visorhid.ko]
> undefined!
> 
> 
> --
> Jim

We have a patch that we will be submitting up soon that adds
"INPUT" to the "depends on" list in our Kconfig that should fix this.
Thanks.

- Tim Sell
