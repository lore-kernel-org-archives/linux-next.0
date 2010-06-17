From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: import failure of the rr quilt series
Date: Thu, 17 Jun 2010 11:02:26 +1000
Message-ID: <20100617110226.a507c7d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Jun_2010_11_02_26_+1000_KPW=SeKFXOzxOguV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__17_Jun_2010_11_02_26_+1000_KPW=SeKFXOzxOguV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

The import of the rr quilt series failed like this:

misc:pci_msi_off.patch
error: patch failed: drivers/pci/pci.c:2293
error: drivers/pci/pci.c: patch does not apply

I have commented out that patch for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Jun_2010_11_02_26_+1000_KPW=SeKFXOzxOguV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwZdCIACgkQjjKRsyhoI8ya4wCfafF9AZ3LxyETlsbqZpf/uBhi
Q84An0jj368GQ4uA4KYDhSb8ZqfbmKjb
=hKPW
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Jun_2010_11_02_26_+1000_KPW=SeKFXOzxOguV--
