From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: unable to fetch the cpufreq-move tree
Date: Wed, 8 Jun 2011 12:05:49 +1000
Message-ID: <20110608120549.78d0b748.sfr@canb.auug.org.au>
References: <20110608112424.1147e26e.sfr@canb.auug.org.au>
	<20110608013241.GA15828@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Jun_2011_12_05_49_+1000_i8V4vAkWV2Z6wMCO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36089 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750874Ab1FHCF6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jun 2011 22:05:58 -0400
In-Reply-To: <20110608013241.GA15828@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__8_Jun_2011_12_05_49_+1000_i8V4vAkWV2Z6wMCO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 7 Jun 2011 21:32:41 -0400 Dave Jones <davej@redhat.com> wrote:
>
> On Wed, Jun 08, 2011 at 11:24:24AM +1000, Stephen Rothwell wrote:
>  >=20
>  > Fetching the cpufreq-move tree today gave this error:
>  >=20
>  > fatal: Couldn't find remote ref refs/heads/move-drivers
>  >=20
>  > I will use the version of the tree from next-20110608 for today (which
>  > was empty, anyway).
>=20
> Now that we've done the x86 move and some of the ARM drivers, I think
> I'll just continue to add future moves to the 'next' branch.
> Sorry for forgetting to give you a heads-up.

OK, I will remove the tree tomorrow.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Jun_2011_12_05_49_+1000_i8V4vAkWV2Z6wMCO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN7tj9AAoJEDMEi1NhKgbs3MQH/1rShkpuL9uPpvce0Otu6IfJ
9EEYdFXGSnmfBHNlhespLF5ksRtwztK287rYOkuZrQaViL1Rn+O5pNX84hmJAboG
dBT72Vj4EVIG7OUf5PaxDV/3LpbaZkSfy0d7AGb5y7EM91j2aH51Ap/z9S7JxIp1
qH4aB1lEdeMaaE39pz2qlaFwVm3raKnB9lJi0vB7GpVxECV44WRLoSowcZRinSl3
5kKBY0CYEp94a/tAnc6A9dVAJ/uKTgJjZ8VXjLc7JEVsNCLmknjyMk0f/uDYtv3c
+HNvAgoVKSiQ+HUpJpDFzWzugTnxbKXILmCDqiWZ9WIO9LcKwNFpLWAmbrFQnLU=
=tppE
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Jun_2011_12_05_49_+1000_i8V4vAkWV2Z6wMCO--
