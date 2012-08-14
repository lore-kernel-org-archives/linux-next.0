From: Simon Budig <simon.budig@kernelconcepts.de>
Subject: Re: linux-next: Tree for Aug 14 (drivers/input/touchscreen/edt-ft5x06.c)
Date: Wed, 15 Aug 2012 01:15:58 +0200
Message-ID: <502ADC2E.5070003@kernelconcepts.de>
References: <20120814135506.b6b86e3c8cb9da1eefb7bbd6@canb.auug.org.au> <502A9200.1020606@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <502A9200.1020606@xenotime.net>
Sender: linux-input-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: linux-next.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/14/2012 07:59 PM, Randy Dunlap wrote:
> on x86_64, when CONFIG_DEBUG_FS is not enabled:
> 
> drivers/input/touchscreen/edt-ft5x06.c: In function
> 'edt_ft5x06_ts_remove': 
> drivers/input/touchscreen/edt-ft5x06.c:846:14: error: 'struct
> edt_ft5x06_ts_data' has no member named 'raw_buffer'

Yeah, unfortunate oversight on my part.

Guenter Roeck provided a patch for this issue which looks good to me.
(Aug 7th, linux-input mailinglist)

Dmitry: Can you upstream this? Is there any action required on my part?

Thanks,
        Simon
- -- 
       Simon Budig                        kernel concepts GmbH
       simon.budig@kernelconcepts.de      Sieghuetter Hauptweg 48
       +49-271-771091-17                  D-57072 Siegen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlAq3C4ACgkQO2O/RXesiHAofACgsPG5EcF3fn0me1STCIK5nYwm
4QkAoL+Q30zA0NLNbUSPJIRt6CmR4o91
=y99v
-----END PGP SIGNATURE-----
