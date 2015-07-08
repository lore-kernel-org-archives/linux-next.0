From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Wed, 8 Jul 2015 10:56:06 +1000
Message-ID: <20150708105606.301171bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ldYSNj1VI8_exUpV++ElCR0"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59433 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753671AbbGHA4P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jul 2015 20:56:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/ldYSNj1VI8_exUpV++ElCR0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/cpu.c: In function '_cpu_down':
kernel/cpu.c:398:2: error: implicit declaration of function 'irq_lock_spars=
e' [-Werror=3Dimplicit-function-declaration]
  irq_lock_sparse();
  ^
kernel/cpu.c:407:3: error: implicit declaration of function 'irq_unlock_spa=
rse' [-Werror=3Dimplicit-function-declaration]
   irq_unlock_sparse();
   ^

Caused by commit

  fc862aa8288b ("hotplug: Prevent alloc/free of irq descriptors during cpu =
up/down")

Forgot to include linux/irqdesc.h.

I have used the tip tree from next-20150707 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/ldYSNj1VI8_exUpV++ElCR0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVnHUrAAoJEMDTa8Ir7ZwVrcEP/RG43gfhmSzptyk+sI0eZ5GD
jDd0GWaXbKPi62goSyPO0q3SIGQhqrJ+kQxFfmo6N7JkcB05xA8LPBij3ku5/Pse
MLkQcrR37bOmyf1ixxd00UzByEj6GGjEYZmOp3Ggj8OuYwaZrihoMuyfcTX5aR6e
JO6CL+WcI//BEMjvNmvOjTzLQqLj18LwSquPpP+43hIEv44JrH22p0s33zYnAo7q
EaAJGQNFESR7QysYDMUrGyNITj3310W0UOo4u4N0GVcq+57QgcokeCMKL1xMr61O
m6djdynsTrB1Frf4azoK9ELoEbxhf08sdYXaKrpFMaa3DLJZ3azsP34tp3rmquPi
scyXnjhqpueXdfn/CaSnHbq/CDiv8SGNzEO5DCAMW+YS2pFOAxNfrIykc3098NP6
PWoC5PszwbCVr1SUnGak5ZjPREBsgePzGUySYLjwAm7gtgeY39I/fgqUZHikPiYn
qPebgXd+R2yBXOZoL4EhBcRLwWoDO696q/2FcRPY2t+yow3NJdNxQSHJ7LtVwWey
cWGzqI0LvPfjb8Jup+p9GKEKMQeJuiGiN2Ipw+BTOgX3dHcwHI6bEiP3Rv+iDSHO
biYqa4fYJgfha3z2viFMVIuXNjynCjfrLhTJtB11XsYLaHoCQqZSBCKcO+/tJsGR
VaI9RgZOTgbRglg89SFe
=1YSE
-----END PGP SIGNATURE-----

--Sig_/ldYSNj1VI8_exUpV++ElCR0--
