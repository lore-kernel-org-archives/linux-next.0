From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Thu, 30 Jul 2015 11:28:07 +1000
Message-ID: <1438219687.2374.1.camel@ellerman.id.au>
References: <20150729161912.GF18685@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150729161912.GF18685@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: dh.herrmann@googlemail.com, gregkh@linuxfoundation.org, daniel@zonque.org, tixxdz@opendz.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2015-07-29 at 12:19 -0400, Paul Gortmaker wrote:
> Hi David,
>=20
> Does it make sense to build this sample when cross compiling?
>=20
> The reason I ask is that it has been breaking the linux-next build of
> allmodconfig for a while now, with:
>=20
>   HOSTCC  samples/kdbus/kdbus-workers
> samples/kdbus/kdbus-workers.c: In function =E2=80=98prime_new=E2=80=99=
:
> samples/kdbus/kdbus-workers.c:934:18: error: =E2=80=98__NR_memfd_crea=
te=E2=80=99 undeclared (first use in this function)
>   p->fd =3D syscall(__NR_memfd_create, "prime-area", MFD_CLOEXEC);
>                   ^
> samples/kdbus/kdbus-workers.c:934:18: note: each undeclared identifie=
r is reported only once for each function it appears in
> scripts/Makefile.host:91: recipe for target 'samples/kdbus/kdbus-work=
ers' failed
> make[2]: *** [samples/kdbus/kdbus-workers] Error 1
>=20
> http://kisskb.ellerman.id.au/kisskb/buildresult/12473453/
>=20
> We recently made some changes to skip other sample/test programs when
> cross compiling in mainline 65f6f092a6987 and f59514b6a8c5ca6dd and
> 6a407a81a9abcf.  Maybe it makes sense to do the same here?

Hi Paul,

We also can configure kisskb to not build samples for all_modconfig, wh=
ich
avoids these sort of issues with a slight decrease in code coverage. We=
 already
disable samples for several other arch all_modconfigs.

cheers
