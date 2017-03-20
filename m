From: "Challa, Mahipal" <Mahipal.Challa@cavium.com>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Date: Mon, 20 Mar 2017 17:06:55 +0000
Message-ID: <CY4PR07MB314387E2D6660777FD163AA7E53A0@CY4PR07MB3143.namprd07.prod.outlook.com>
References: <20170320162226.47c6e3ed@canb.auug.org.au>
 <CACT4Y+b-dQYkeDg127hqRfVhTyxrDEP5vR07cH6=ei+9jtTNyg@mail.gmail.com>,<20170320123053.GB11825@hardcore>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170320123053.GB11825@hardcore>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Glauber <Jan.Glauber@cavium.com>, Dmitry Vyukov <dvyukov@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



From: Jan Glauber
Sent: Monday, March 20, 2017 6:00 PM
To: Dmitry Vyukov
Cc: Stephen Rothwell; Andrew Morton; Herbert Xu; linux-next@vger.kernel.org=
; LKML; Challa, Mahipal
Subject: Re: linux-next: build warnings after merge of the akpm-current tre=
e
=A0  =20
On Mon, Mar 20, 2017 at 10:05:54AM +0100, Dmitry Vyukov wrote:
> On Mon, Mar 20, 2017 at 6:22 AM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> > Hi Andrew,
> >
> > After merging the akpm-current tree, today's linux-next build (x86_64
> > allmodconfig) produced these warnings:
> >
> > drivers/crypto/cavium/zip/zip_main.c: In function 'zip_show_stats':
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 4 has type 'long long int' [-=
Wformat=3D]
> >=A0=A0=A0=A0 seq_printf(s, "=A0=A0=A0=A0=A0=A0=A0 ZIP Device %d Stats\n"
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 5 has type 'long long int' [-=
Wformat=3D]
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 6 has type 'long long int' [-=
Wformat=3D]
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 7 has type 'long long int' [-=
Wformat=3D]
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 10 has type 'long long int' [=
-Wformat=3D]
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 11 has type 'long long int' [=
-Wformat=3D]
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 12 has type 'long long int' [=
-Wformat=3D]
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 13 has type 'long long int' [=
-Wformat=3D]
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 14 has type 'long long int' [=
-Wformat=3D]
> > drivers/crypto/cavium/zip/zip_main.c:489:18: warning: format '%ld' expe=
cts argument of type 'long int', but argument 15 has type 'long long int' [=
-Wformat=3D]
> >
> > Introduced by commit
> >
> >=A0=A0 09ae5d37e093 ("crypto: zip - Add Compression/Decompression statis=
tics")
> >
> > from the crypto tree interacting with commit
> >
> >=A0=A0 3f4ca3d25e1a ("asm-generic, x86: wrap atomic operations")
> >
> > from the akpm-current tree.
> >
> > This latter commit changed atomic64read() from "long" to "long long"
> > on x86_64.
>=20
> Hi,
>=20
> Previously atomic operations returned different types on 32/64 bits. I
> think that was pretty unfortunate and could actually lead to lots of
> such warnings (as there were no single format specifier that one could
> use portably), and was difficult to wrap. So I used "unsigned long
> long" for all operations.
> I actually suspect that the new zip_main.c code would cause a similar
> warning on 32 bits even without my change, because atomic ops already
> returned unsigned long long there.

>The driver depends on 64BIT (HW is 64 bit only).

>> So I think we need to fix zip_main.c.

>I'm not entirely sure, all drivers that are available for x86_64 and
>arm64 and use atomic64_read will show such warnings.

>One possible solution would be to disable COMPILE_TEST for the zip
>driver, but that would just hide the issue.

We found a decent solution to this issue and sent the patch to Herbert.
Solution:
Changing the format specifiers to %llu and adding a cast to u64 solves the
problem on all the architectures.

Thanks,
Mahipal


     =
