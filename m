From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] sparc64: use unsigned long long for u64
Date: Sat, 27 Dec 2008 10:24:04 +0100
Message-ID: <20081227092404.GA10375@uranus.ravnborg.org>
References: <20081222230035.GB4074@uranus.ravnborg.org> <20081222151338.3b6ef997.akpm@linux-foundation.org> <20081223131746.GA7456@uranus.ravnborg.org> <20081227.005452.261413194.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:50639 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752573AbYL0JWc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 27 Dec 2008 04:22:32 -0500
Content-Disposition: inline
In-Reply-To: <20081227.005452.261413194.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: akpm@linux-foundation.org, sparclinux@vger.kernel.org, mingo@elte.hu, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, kenchen@google.com, paulus@samba.org, tglx@linutronix.de, hpa@zytor.com, linux-next@vger.kernel.org

On Sat, Dec 27, 2008 at 12:54:52AM -0800, David Miller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Tue, 23 Dec 2008 14:17:46 +0100
>=20
> > It may take a few days before the drivers gets fixed.
> > Christmas is approaching fast by now.
>=20
> Even with this and your driver patch applied, the tree
> doesn't build successfully:
>=20
> cc1: warnings being treated as errors
> arch/sparc/kernel/psycho_common.c: In function =E2=80=98psycho_check_=
stc_error=E2=80=99:
> arch/sparc/kernel/psycho_common.c:104: warning: format =E2=80=98%016l=
x=E2=80=99 expects type =E2=80=98long unsigned int=E2=80=99, but argume=
nt 4 has type =E2=80=98long long unsigned int=E2=80=99
>=20
> Did you remove sparc's -Werror when doing test builds
> of these changes? :-)
No - it is worse than that.
My gcc does not complain about the above.

Just to check that I was not fouled by some preprocessor magic
here is the preprocessed code:

   printk("<3>" "%s: STC_TAG(%d)[PA(%016lx)VA(%08lx)"
          "V(%d)W(%d)]\n",
          pbm->name,
          i,
          ((tagval & 0x0fffffff00000000UL) >> 19UL),
          (tagval & 0x00000000ffffe000UL),
          ((tagval & 0x0000000000000002UL) ? 1 : 0),
          ((tagval & 0x0000000000000001UL) ? 1 : 0));


tagval is u64.

So it looks like my gcc does not promote:
((tagval & 0x0fffffff00000000UL) >> 19UL) to unsigned long long int
but your gcc does?

My gcc (build with Dan Kegel's crosstool):
$ /opt/crosstool/gcc-3.4.5-glibc-2.3.6/sparc64-unknown-linux-gnu/bin/sp=
arc64-unknown-linux-gnu-gcc -v
Reading specs from /opt/crosstool/gcc-3.4.5-glibc-2.3.6/sparc64-unknown=
-linux-gnu/lib/gcc/sparc64-unknown-linux-gnu/3.4.5/specs
Configured with: /home/sam/devel/crosstool-0.43/build/sparc64-unknown-l=
inux-gnu/gcc-3.4.5-glibc-2.3.6/gcc-3.4.5/configure --target=3Dsparc64-u=
nknown-linux-gnu --host=3Di686-host_pc-linux-gnu --prefix=3D/opt/crosst=
ool/gcc-3.4.5-glibc-2.3.6/sparc64-unknown-linux-gnu --disable-multilib =
--with-cpu=3Dultrasparc3 --enable-cxx-flags=3D-mcpu=3Dultrasparc3 --wit=
h-headers=3D/opt/crosstool/gcc-3.4.5-glibc-2.3.6/sparc64-unknown-linux-=
gnu/sparc64-unknown-linux-gnu/include --with-local-prefix=3D/opt/crosst=
ool/gcc-3.4.5-glibc-2.3.6/sparc64-unknown-linux-gnu/sparc64-unknown-lin=
ux-gnu --disable-nls --enable-threads=3Dposix --enable-symvers=3Dgnu --=
enable-__cxa_atexit --enable-languages=3Dc --enable-shared --enable-c99=
 --enable-long-long
Thread model: posix
gcc version 3.4.5

>=20
> Either way these need some work before they should be
> added to any tree.
>=20
> Andrew you probably want to toss these from your tree
> since at a minimum they will break the sparc64 build.
>=20
> Sam will fix them up and resubmit, and I'll apply them,
> don't worry. :)
Yup - I added Andrew on cc: only as information.

	Sam
