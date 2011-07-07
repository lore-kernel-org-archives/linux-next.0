From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Fwd: Re: Today's Linux Next failed to even start building, I must
 have done something wrong
Date: Thu, 07 Jul 2011 15:44:32 +0200
Message-ID: <4E15B840.3080701@example.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Sorry, I post once again, my mailer did something wrong.

-------- Original Message --------
Subject: Re: Today's Linux Next failed to even start building, I must=20
have done something wrong
Date: Thu, 07 Jul 2011 15:28:44 +0200
=46rom: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
Organization: hosowicz.com
To: piotr@hosowicz.com

On 07.07.2011 14:47, Piotr Hosowicz wrote:
> Hello,
>
> I'm not sure - which base source tree should I take to apply the patc=
h?
> I fail for now with building witch Debian make-kpkg with messages:
>
> # ...
> make ARCH=3Dx86_64 prepare
> make[2]: Wej=C5=9Bcie do katalogu `/usr/src/linux-3.0-rc6-nx-20110707=
'
> scripts/kconfig/conf --silentoldconfig Kconfig
> make[2]: Opuszczenie katalogu `/usr/src/linux-3.0-rc6-nx-20110707'
> make[2]: Wej=C5=9Bcie do katalogu `/usr/src/linux-3.0-rc6-nx-20110707=
'
> CHK include/linux/version.h
> UPD include/linux/version.h
> CHK include/generated/utsrelease.h
> UPD include/generated/utsrelease.h
> CC kernel/bounds.s
> GEN include/generated/bounds.h
> CC arch/x86/kernel/asm-offsets.s
> In file included from include/linux/sched.h:64:0,
> from arch/x86/kernel/asm-offsets.c:9:
> include/linux/mm_types.h:74:15: error: duplicate member =E2=80=98_cou=
nt=E2=80=99
> make[3]: *** [arch/x86/kernel/asm-offsets.s] B=C5=82=C4=85d 1
> make[2]: *** [prepare0] B=C5=82=C4=85d 2
> make[2]: Opuszczenie katalogu `/usr/src/linux-3.0-rc6-nx-20110707'
> make[1]: *** [debian/stamp/conf/kernel-conf] B=C5=82=C4=85d 2
> make[1]: Opuszczenie katalogu `/usr/src/linux-3.0-rc6-nx-20110707'
> make: *** [debian/stamp/conf/minimal_debian] B=C5=82=C4=85d 2
> Failed to create a ./debian directory: Nie ma takiego pliku ani katal=
ogu
> at /usr/bin/make-kpkg line 984.
>
> Please help me.

Solved, thanks to Christoph Lameter in thread "Build issue with linux
next. duplicate member _count in mm_types.h".

--=20
"Chcemy waszego dobra!" - powiedzia=C5=82 lider
socjaldemokrat=C3=B3w. Zaniepokojeni obywatele
zaczeli ukrywa=C4=87 swoje dobra w bezpiecznych
miejscach.
NP: Nemo -
NB: 3.0.0-rc6
