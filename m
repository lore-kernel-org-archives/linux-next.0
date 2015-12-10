From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20151210 build: 4 failures 43 warnings (next-20151210)
Date: Thu, 10 Dec 2015 16:55:13 +0000
Message-ID: <20151210165513.GO5727@sirena.org.uk>
References: <E1a6wEp-0000hU-7o@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X970w0TH+RQTigba"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41427 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752186AbbLJQzY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2015 11:55:24 -0500
Content-Disposition: inline
In-Reply-To: <E1a6wEp-0000hU-7o@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--X970w0TH+RQTigba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 08:06:07AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build most arm64 configs with some rather
spectacular errors below introduced by 02598e94ed5a78 (mm, printk:
introduce new format string for flags) from Andrew's tree.  These in
turn stem from the fact that we introduce an inclusion of
linux/tracepoint.h into linux/mmdebug.h which through a chain of nested
inclusions means that we end up attempting to use definitions from
headers before they have finished including.  For example:

> 	arm64-allnoconfig
> ../include/linux/wait.h:1217:2: error: implicit declaration of function '=
atomic_read' [-Werror=3Dimplicit-function-declaration]

is a result of:

In file included from include/linux/completion.h:11:0,
                 from include/linux/rcupdate.h:43,
                 from include/linux/tracepoint.h:19,
                 from include/linux/mmdebug.h:6,
                 from ./arch/arm64/include/asm/cmpxchg.h:22,
                 from ./arch/arm64/include/asm/atomic.h:41,
                 from include/linux/atomic.h:4,
                 from include/linux/spinlock.h:406,
                 from include/linux/seqlock.h:35,
                 from include/linux/time.h:5,
                 from include/uapi/linux/timex.h:56,
                 from include/linux/timex.h:56,
                 from include/linux/sched.h:19,
                 from arch/arm64/kernel/asm-offsets.c:21:
include/linux/wait.h: In function 'wait_on_atomic_t':
include/linux/wait.h:1218:2: error: implicit declaration of function 'atomi=
c_read' [-Werror=3Dimplicit-function-declaration]
  if (atomic_read(val) =3D=3D 0)

where atomic_read() will be defined in atomic.h which is part of the
inclusion chain above but hasn't yet parsed far enough to actually
define anything.  This is all a bit of a horrific mess the root cause of
which appears to be that arm64 is unusual in including linux/mmdebug.h
in asm/cmpxchg.h which triggers the mess.  There doesn't seem to be any
reason for this inclusion, I've just sent a patch removing it.  It'd be
good to get this into -next as a matter of urgency.

> ../include/linux/jiffies.h:61:39: error: division by zero in #if
> ../include/linux/jiffies.h:289:36: error: 'NSEC_PER_USEC' undeclared (fir=
st use in this function)
> ../include/linux/jiffies.h:303:33: error: division by zero in #if
> ../include/linux/jiffies.h:323:11: error: 'MSEC_PER_SEC' undeclared (firs=
t use in this function)
> ../include/linux/jiffies.h:369:15: error: 'USEC_PER_SEC' undeclared (firs=
t use in this function)
> ../include/linux/jiffies.h:417:9: error: variable 'ts' has initializer bu=
t incomplete type
> ../include/linux/jiffies.h:417:9: error: implicit declaration of function=
 'timespec_to_timespec64' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/jiffies.h:417:48: error: dereferencing pointer to incomp=
lete type
> ../include/linux/jiffies.h:417:20: error: storage size of 'ts' isn't known
> ../include/linux/jiffies.h:425:20: error: storage size of 'ts' isn't known
> ../include/linux/jiffies.h:428:2: error: dereferencing pointer to incompl=
ete type
> ../include/linux/jiffies.h:428:2: error: implicit declaration of function=
 'timespec64_to_timespec' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/ktime.h:52:23: error: 'KTIME_SEC_MAX' undeclared (first =
use in this function)
> ../include/linux/ktime.h:53:29: error: 'KTIME_MAX' undeclared (first use =
in this function)
> ../include/linux/ktime.h:55:36: error: 'NSEC_PER_SEC' undeclared (first u=
se in this function)
> ../include/linux/ktime.h:81:57: error: parameter 1 ('ts') has incomplete =
type
> ../include/linux/ktime.h:81:23: error: function declaration isn't a proto=
type [-Werror=3Dstrict-prototypes]
> ../include/linux/ktime.h:87:61: error: parameter 1 ('ts') has incomplete =
type
> ../include/linux/ktime.h:87:23: error: function declaration isn't a proto=
type [-Werror=3Dstrict-prototypes]
> ../include/linux/ktime.h:93:55: error: parameter 1 ('tv') has incomplete =
type
> ../include/linux/ktime.h:93:23: error: function declaration isn't a proto=
type [-Werror=3Dstrict-prototypes]
> ../include/linux/ktime.h:95:43: error: 'NSEC_PER_USEC' undeclared (first =
use in this function)
> ../include/linux/ktime.h:201:25: error: 'NSEC_PER_USEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:206:25: error: 'NSEC_PER_MSEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:221:33: error: 'NSEC_PER_USEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:226:33: error: 'NSEC_PER_MSEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:231:33: error: 'NSEC_PER_USEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:248:3: error: dereferencing pointer to incomplet=
e type
> ../include/linux/ktime.h:248:3: error: implicit declaration of function '=
ns_to_timespec' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/ktime.h:267:3: error: dereferencing pointer to incomplet=
e type
> ../include/linux/ktime.h:267:3: error: implicit declaration of function '=
ns_to_timespec64' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/timekeeping.h:25:31: error: return type is an incomplete=
 type
> ../include/linux/timekeeping.h:27:9: error: variable 'now' has initialize=
r but incomplete type
> ../include/linux/timekeeping.h:27:9: error: invalid use of undefined type=
 'struct timespec64'
> ../include/linux/timekeeping.h:27:20: error: storage size of 'now' isn't =
known
> ../include/linux/timekeeping.h:38:8: error: unknown type name 'time64_t'
> ../include/linux/timekeeping.h:39:8: error: unknown type name 'time64_t'
> ../include/linux/timekeeping.h:79:31: error: return type is an incomplete=
 type
> ../include/linux/timekeeping.h:81:2: error: invalid use of undefined type=
 'struct timespec64'
> ../include/linux/timekeeping.h:242:2: error: dereferencing pointer to inc=
omplete type
> ../include/linux/timekeeping.h:247:2: error: dereferencing pointer to inc=
omplete type
> ../include/linux/timekeeping.h:252:2: error: dereferencing pointer to inc=
omplete type
> ../include/linux/jump_label.h:187:2: error: implicit declaration of funct=
ion 'atomic_inc' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/jump_label.h:193:2: error: implicit declaration of funct=
ion 'atomic_dec' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/time64.h:45:31: error: conflicting types for 'timespec64=
_to_timespec'
> ../include/linux/time64.h:50:33: error: conflicting types for 'timespec_t=
o_timespec64'
> ../include/linux/time.h:215:24: error: conflicting types for 'ns_to_times=
pec'
>=20
> 	arm64-allmodconfig
> ../include/linux/wait.h:40:2: error: unknown type name 'spinlock_t'
> ../include/linux/wait.h:1217:2: error: implicit declaration of function '=
atomic_read' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/wait.h:76:32: error: storage size of '__key' isn't known
> ../include/linux/jiffies.h:61:39: error: division by zero in #if
> ../include/linux/jiffies.h:289:36: error: 'NSEC_PER_USEC' undeclared (fir=
st use in this function)
> ../include/linux/jiffies.h:303:33: error: division by zero in #if
> ../include/linux/jiffies.h:323:11: error: 'MSEC_PER_SEC' undeclared (firs=
t use in this function)
> ../include/linux/jiffies.h:369:15: error: 'USEC_PER_SEC' undeclared (firs=
t use in this function)
> ../include/linux/jiffies.h:417:9: error: variable 'ts' has initializer bu=
t incomplete type
> ../include/linux/jiffies.h:417:9: error: implicit declaration of function=
 'timespec_to_timespec64' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/jiffies.h:417:48: error: dereferencing pointer to incomp=
lete type
> ../include/linux/jiffies.h:417:20: error: storage size of 'ts' isn't known
> ../include/linux/jiffies.h:425:20: error: storage size of 'ts' isn't known
> ../include/linux/jiffies.h:428:2: error: dereferencing pointer to incompl=
ete type
> ../include/linux/jiffies.h:428:2: error: implicit declaration of function=
 'timespec64_to_timespec' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/ktime.h:52:23: error: 'KTIME_SEC_MAX' undeclared (first =
use in this function)
> ../include/linux/ktime.h:53:29: error: 'KTIME_MAX' undeclared (first use =
in this function)
> ../include/linux/ktime.h:55:36: error: 'NSEC_PER_SEC' undeclared (first u=
se in this function)
> ../include/linux/ktime.h:81:57: error: parameter 1 ('ts') has incomplete =
type
> ../include/linux/ktime.h:81:23: error: function declaration isn't a proto=
type [-Werror=3Dstrict-prototypes]
> ../include/linux/ktime.h:87:61: error: parameter 1 ('ts') has incomplete =
type
> ../include/linux/ktime.h:87:23: error: function declaration isn't a proto=
type [-Werror=3Dstrict-prototypes]
> ../include/linux/ktime.h:93:55: error: parameter 1 ('tv') has incomplete =
type
> ../include/linux/ktime.h:93:23: error: function declaration isn't a proto=
type [-Werror=3Dstrict-prototypes]
> ../include/linux/ktime.h:95:43: error: 'NSEC_PER_USEC' undeclared (first =
use in this function)
> ../include/linux/ktime.h:201:25: error: 'NSEC_PER_USEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:206:25: error: 'NSEC_PER_MSEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:221:33: error: 'NSEC_PER_USEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:226:33: error: 'NSEC_PER_MSEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:231:33: error: 'NSEC_PER_USEC' undeclared (first=
 use in this function)
> ../include/linux/ktime.h:248:3: error: dereferencing pointer to incomplet=
e type
> ../include/linux/ktime.h:248:3: error: implicit declaration of function '=
ns_to_timespec' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/ktime.h:267:3: error: dereferencing pointer to incomplet=
e type
> ../include/linux/ktime.h:267:3: error: implicit declaration of function '=
ns_to_timespec64' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/timekeeping.h:25:31: error: return type is an incomplete=
 type
> ../include/linux/timekeeping.h:27:9: error: variable 'now' has initialize=
r but incomplete type
> ../include/linux/timekeeping.h:27:9: error: invalid use of undefined type=
 'struct timespec64'
> ../include/linux/timekeeping.h:27:20: error: storage size of 'now' isn't =
known
> ../include/linux/timekeeping.h:38:8: error: unknown type name 'time64_t'
> ../include/linux/timekeeping.h:39:8: error: unknown type name 'time64_t'
> ../include/linux/timekeeping.h:79:31: error: return type is an incomplete=
 type
> ../include/linux/timekeeping.h:81:2: error: invalid use of undefined type=
 'struct timespec64'
> ../include/linux/timekeeping.h:242:2: error: dereferencing pointer to inc=
omplete type
> ../include/linux/timekeeping.h:247:2: error: dereferencing pointer to inc=
omplete type
> ../include/linux/timekeeping.h:252:2: error: dereferencing pointer to inc=
omplete type
> ../include/linux/rcupdate.h:490:2: error: implicit declaration of functio=
n 'lock_acquire' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/rcupdate.h:495:2: error: implicit declaration of functio=
n 'lock_release' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/rcupdate.h:572:2: error: implicit declaration of functio=
n 'lock_is_held' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/rcupdate.h:572:2: error: implicit declaration of functio=
n 'lockdep_rcu_suspicious' [-Werror=3Dimplicit-function-declaration]
> ../include/linux/time64.h:45:31: error: conflicting types for 'timespec64=
_to_timespec'
> ../include/linux/time64.h:50:33: error: conflicting types for 'timespec_t=
o_timespec64'
> ../include/linux/time.h:215:24: error: conflicting types for 'ns_to_times=
pec'

--X970w0TH+RQTigba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWaa5wAAoJECTWi3JdVIfQEMwH/inOSYq9+MRt+dYD1tOF6Tov
hAtX/i71nY1I+mPoh8eitf3KP2BSSbOG4RE25iG+0GQnmYxPoaYdG7GqrGi1pq+G
4eOhU9XGudzOhIppjwzR1rB9D3U+o9fbWiLpHI7deMIz/tINXqS8NrmHcWnGBop9
au3MDymqlYwLeiG1z5Zx6Vgfv+iVd9m7/g/U+oHAGpTrmF/8a7nNBo1oDcBgIIwV
6LubZIwli5g8bnjoAWy5L4RiSgcf+FQdin4qYUg+/BV5RXCUOdWzSyF3BmFa3R3Z
mAUOw1dXWcjI17tXT6rT3GImeM9C+KXch1AswoW029AO4YxltCcI4ar0LXSoDUA=
=YwfR
-----END PGP SIGNATURE-----

--X970w0TH+RQTigba--
