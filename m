From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree
Date: Fri, 14 May 2010 15:53:12 +1000
Message-ID: <20100514155312.9684cb9d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__14_May_2010_15_53_12_+1000_h=_M5gj3.AU.T.dQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>, Don Zickus <dzickus@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__14_May_2010_15_53_12_+1000_h=_M5gj3.AU.T.dQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (sparc64 defconfig)
failed like this:

kernel/built-in.o: In function `touch_nmi_watchdog':
(.text+0x449bc): multiple definition of `touch_nmi_watchdog'
arch/sparc/kernel/built-in.o:(.text+0x11b28): first defined here

Probably caused by commit 58687acba59266735adb8ccd9b5b9aa2c7cd205b
("lockup_detector: Combine nmi_watchdog and softlockup detector").

The one in kernel/ used to only be built when CONFIG_NMI_WATCHDOG was set
which depended on CONFIG_PERF_EVENTS_NMI which was only ever set for
ARCH=3Dx86.  This probably breaks mn10300 and blackfin as well, at least.
We also have ARCH_HAS_NMI_WATCHDOG to determine this ...

I tried protecting the definition of touch_nmi_watchdog with
ARCH_HAS_NMI_WATCHDOG, but that broke the x86_64 allmodconfig build
(which defines ARCH_HAS_NMI_WATCHDOG if CONFIG_X86_LOCAL_APIC is defined
but only builds its version if CONFIG_LOCKUP_DETECTOR is not 'y').

So I have left is as it is for today.  Please see if someone can come up
with a solution.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__14_May_2010_15_53_12_+1000_h=_M5gj3.AU.T.dQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvs5UgACgkQjjKRsyhoI8wVWQCgqErzlj5IJWvw98CDLzE5/vkn
6MIAoKpFaMLdYWdT4FO/vn3kEz3k6uqg
=6RBE
-----END PGP SIGNATURE-----

--Signature=_Fri__14_May_2010_15_53_12_+1000_h=_M5gj3.AU.T.dQ--
