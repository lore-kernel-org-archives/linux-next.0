From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 arm-current tree
Date: Tue, 4 Sep 2012 23:19:55 +1000
Message-ID: <20120904231955.fb82c1b44e7c4568f626c915@canb.auug.org.au>
References: <20120904160626.f1dcb67ebbb145053c49da8c@canb.auug.org.au>
	<20120904090132.GG24085@n2100.arm.linux.org.uk>
	<5045F7A0.1090400@gmail.com>
	<201209041311.02222.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__4_Sep_2012_23_19_55_+1000_Q+=43Gm3pfQvC80+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:59575 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757035Ab2IDNUE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 09:20:04 -0400
In-Reply-To: <201209041311.02222.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robherring2@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__4_Sep_2012_23_19_55_+1000_Q+=43Gm3pfQvC80+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Sep 2012 13:11:02 +0000 Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tuesday 04 September 2012, Rob Herring wrote:
> > Right. The PCI i/o reserved area has a dummy physical address of 0 and=
=20
> > needs to be skipped by ioremap searches. So we don't set=20
> > VM_ARM_STATIC_MAPPING to prevent matches by ioremap. The vm_struct sett=
ings
> > don't really matter when we do the real mapping of the i/o space.
> >=20
> > Here's my merge:
>=20
> Ok, thanks for the clarification. I've merged Russell's fixes branch
> into the cleanup/io-pci branch now to resolve the conflict.

Even better than me handling it.  Thanks guys.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__4_Sep_2012_23_19_55_+1000_Q+=43Gm3pfQvC80+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQRf/7AAoJEECxmPOUX5FEMi0P/1sYeY5l65Z0wNtwYncYBSNv
ah7IfM9c7JLRvvjmiP4FS+dJKrZm70BP+F9niNmp2I/j+vtRZ7coRuC6aypNRDMu
QuDfxw/JhB/p/FGkIiv7fJw5Tb5m0RU1pzw6zKAySPmSrm5MxrfW6WnvnM9WRnhx
ZwE4EryKtkwenimxLubW2O+VSKfNc/DqqZ9VenZnuSt2une5g8cf5Wkyc+pp9w0s
ulHY8go7LG9xOZ6JsHB7opS2x5RURZJmRhxf91JJz/q0rrV5FCK02jAXzJTIMrKz
qb55qQoOIYGrrXJUnMROJGW8XqhexUDaBrasFllcnncxu8qq0DPC8UETjUMKTvuI
yvl7/B3RHxQuKEgx7u/u+seeeYT3uGs0nrfOcQskSrJCA+/c7muzxUJkWfmhgdTy
Xs66vsKj57qjqTgTSQk57fgNg6+PeE8HwGGvZ4iMiAvYD/AKn03gAi9WjLZekEfI
+mEYQfhOMmtKjobDs4surDaledXwrZmTRXTJrMbcxbtfrL5f7a2JlABr6Ckir0qQ
PsVY7dsOEUi9aWnip9lHQ5IARN+uE678gICoQ5ji3ZopijNyNxV2qcqBMa2pnwfJ
HIRROIioqdn42yx2wmAqZX+F3ikcw5ejJZH9UGzMe5KyXmmyxJ4uMgZ3ccFBnWr+
wKo9onPOtzREblyMaRL/
=tnqQ
-----END PGP SIGNATURE-----

--Signature=_Tue__4_Sep_2012_23_19_55_+1000_Q+=43Gm3pfQvC80+--
