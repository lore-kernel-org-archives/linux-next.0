From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 7 Mar 2014 11:57:44 +1100
Message-ID: <20140307115744.5c3d5475af77726dc6c5a76b@canb.auug.org.au>
References: <20140306192234.62ad3ac104a2adc16752b033@canb.auug.org.au>
	<20140306134848.7aabdc426fbad30f6e818631@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__7_Mar_2014_11_57_44_+1100_GBcKkY49P=5kz4RK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:49796 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750919AbaCGA5v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Mar 2014 19:57:51 -0500
In-Reply-To: <20140306134848.7aabdc426fbad30f6e818631@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux.com>

--Signature=_Fri__7_Mar_2014_11_57_44_+1100_GBcKkY49P=5kz4RK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, 6 Mar 2014 13:48:48 -0800 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> Yes, I've disabled the whole series for now.  Some of these errors
> appear to be caused by compiler mishandling, so it's going to be
> difficult :(

So, by "the whole series" do you mean just/all these:

percpu-add-raw_cpu_ops.patch
mm-use-raw_cpu-ops-for-determining-current-numa-node.patch
modules-use-raw_cpu_write-for-initialization-of-per-cpu-refcount.patch
net-replace-__this_cpu_inc-in-routec-with-raw_cpu_inc.patch
percpu-add-preemption-checks-to-__this_cpu-ops.patch
mm-replace-__get_cpu_var-uses-with-this_cpu_ptr.patch
tracing-replace-__get_cpu_var-uses-with-this_cpu_ptr.patch
percpu-replace-__get_cpu_var-with-this_cpu_ptr.patch
kernel-misc-replace-__get_cpu_var-uses.patch
drivers-char-random-replace-__get_cpu_var-uses.patch
drivers-cpuidle-replace-__get_cpu_var-uses-for-address-calculation.patch
drivers-oprofile-replace-__get_cpu_var-uses-for-address-calculation.patch
drivers-leds-replace-__get_cpu_var-use-through-this_cpu_ptr.patch
drivers-clocksource-replace-__get_cpu_var-used-for-address-calculation.patch
parisc-replace-__get_cpu_var-uses-for-address-calculation.patch
metag-replace-__get_cpu_var-uses-for-address-calculation.patch
drivers-net-ethernet-tile-replace-__get_cpu_var-uses-for-address-calculatio=
n.patch
drivers-net-ethernet-tile-__get_cpu_var-call-introduced-in-314.patch
tilegx-another-case-of-get_cpu_var.patch
time-replace-__get_cpu_var-uses.patch
scheduler-replace-__get_cpu_var-with-this_cpu_ptr.patch
tick-sched-fix-two-new-uses-of-__get_cpu_ptr.patch
block-replace-__this_cpu_ptr-with-raw_cpu_ptr.patch
rcu-replace-__this_cpu_ptr-uses-with-raw_cpu_ptr.patch
watchdog-replace-__raw_get_cpu_var-uses.patch
net-replace-get_cpu_var-through-this_cpu_ptr.patch
md-replace-__this_cpu_ptr-with-raw_cpu_ptr.patch
irqchips-replace-__this_cpu_ptr-uses.patch
x86-replace-__get_cpu_var-uses.patch
x86-change-__get_cpu_var-calls-introduced-in-314.patch
arm-replace-__this_cpu_ptr-with-raw_cpu_ptr.patch
mips-replace-__get_cpu_var-uses-in-fpu-emulator.patch
mips-replace-__get_cpu_var-uses.patch
s390-rename-__this_cpu_ptr-to-raw_cpu_ptr.patch
s390-replace-__get_cpu_var-uses.patch
s390-handle-new-__get_cpu_var-calls-added-in-314.patch
ia64-replace-__get_cpu_var-uses.patch
powerpc-replace-__get_cpu_var-uses.patch
powerpc-handle-new-__get_cpu_var-calls-in-314.patch
sparc-replace-__get_cpu_var-uses.patch
tile-replace-__get_cpu_var-uses.patch
blackfin-replace-__get_cpu_var-uses.patch
avr32-replace-__get_cpu_var-with-__this_cpu_write.patch
alpha-replace-__get_cpu_var.patch
alpha-replace-__get_cpu_var-fix.patch
sh-replace-__get_cpu_var-uses.patch

If so, I will remove them from my tree today (if you don't get around to
a new mmotm before then).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__7_Mar_2014_11_57_44_+1100_GBcKkY49P=5kz4RK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTGRmNAAoJEMDTa8Ir7ZwVf88P/i+w/wL0pyJcr9pHPZZtx1Fl
wckIueGKWb/nt+r1Tgv7nrNh0dHUa/UlN56fJMFPNZRE4vShVtTa40tkihi0VhbY
/cd/STaZwv9Em8EH0QsDh3rjQhS6n12W6H5HwtS+Q59ScULdRBR35gETKQ2+OLph
aPh4L2DTnITUYWE8fFD7SVRl2deeOjUJDozykY2VjlJEexGYOaqqtc0DIeMuEeAv
rKcJf0Xn+lyMTRLE9GD1wjJcUx+/awLXIZ4xWCnmhwYfyIS9f0/VkkXqPMbyxAmX
Hg8EBqKv0GFJ4y2WMakDDuURW/3OOvIAC80jy7wOaGWnJUs2TPXDtALNUxc3UgF7
wuyUhAk6/YcCjvRDHXFrNHtrgW5Bbw+ShcrTGgwvT6weArvPD+OXTuBXnf7ssqe3
i0lNn22mn+KoG4IZjojVU0HCNapsD91WIcDTIwgKSJSwH76EGzt+tYNDpRydmXIz
OO+To7qUMT8sgDvJbEaQdmGQMxRlwJAVwk29LnkvAC+6l/NbZiYytxcWKoIrN93b
DDRGpoceOoLUIvclKAQyUxfvnTc2lz+wKINoSz0cDNqqVUbng2YvPYIZgsVfvrZm
c2Ry5mP38BaP4VFIAvdszSLwfdbpunvUMGdlEGssaVPpjzkgd8nHKACVJu6pVIqQ
gY0/02o7EwZ0tJqlgOjg
=bD66
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Mar_2014_11_57_44_+1100_GBcKkY49P=5kz4RK--
