From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: qemu boot failures with today's linux-next
Date: Tue, 16 Oct 2018 10:52:40 +1100
Message-ID: <20181016105240.70369b98@canb.auug.org.au>
References: <20181015191859.2f600de5@canb.auug.org.au>
        <87murfz8dl.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ofMVVG.UGOBjDEohDHL+3SX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87murfz8dl.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ofMVVG.UGOBjDEohDHL+3SX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, 15 Oct 2018 23:45:10 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> > Preparing to boot Linux version 4.19.0-rc7 (sfr@ash) (gcc version 8.2.0=
 (Debian 8.2.0-4)) #2 SMP Mon Oct 15 18:53:28 AEDT 2018 =20
>                                   ^^^^^^^^^^
>                                   I assume that's wrong, this is actually=
 linux-next you're booting?

Yes, it was just before -rc8 came out and I suppress the extra version
information to save rebuilding things that depend on the version.

> > Booting Linux via __start() @ 0x0000000000400000 ...
>=20
> If you git Ctrl-a-c you should get the qemu prompt. Then you can run
> 'info registers' to print the regs and maybe see where it's stuck.
>=20
> And/or build with EARLY_DEBUG_LPAR to get early console output.

That gave one more line:

[    0.000000] printk: bootconsole [udbg0] enabled

--=20
Cheers,
Stephen Rothwell

--Sig_/ofMVVG.UGOBjDEohDHL+3SX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvFKEgACgkQAVBC80lX
0GwexAf+MFS71cjMU/23VwEAs7GbNie6yHMgHEebYSJhw86kMKxjg9+Dg6Lqr8Ui
7xsPfqKvAhX6NG9VFIL+BHZMZnR8qc3k12vcQ+Pgp37UlxfvV2z36TMVnnjn4vm9
LXAtLM2SNwLcEDUTwvgx8LFZo2pQ4T5DbdOeJJKZMHJ/z0b4lTzOmlXMN+sJ4Y7x
eIrjas6om+58MJBII554klUD2TBm/wqQE602j8ho+z2IdZqYy19WdX5Ea7n+O689
U43s6uWLUlmD4LY3+XW6IW8z0okJMJuwy2BL5EoLDgdqal0iW17K1d/hKkskCZ18
2ugto8inlzslS0vay9mBb35cE2pxnQ==
=UqkH
-----END PGP SIGNATURE-----

--Sig_/ofMVVG.UGOBjDEohDHL+3SX--
