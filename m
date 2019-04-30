From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: linux-next: manual merge of the wireless-drivers-next tree with the
 wireless-drivers tree
Date: Tue, 30 Apr 2019 14:08:31 +1000
Message-ID: <20190430140831.6095243c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.r+ego657j0+ULOk+yG7gms"; protocol="application/pgp-signature"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Luca Coelho <luciano.coelho-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Shahar S Matityahu <shahar.s.matityahu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

--Sig_/.r+ego657j0+ULOk+yG7gms
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the wireless-drivers-next tree got a
conflict in:

  drivers/net/wireless/intel/iwlwifi/fw/file.h

between commit:

  b35f63972c5c ("iwlwifi: dbg_ini: check debug TLV type explicitly")

from the wireless-drivers tree and commit:

  aee1b6385e29 ("iwlwifi: support fseq tlv and print fseq version")

from the wireless-drivers-next tree.

I fixed it up (the latter is a superset of the former) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/.r+ego657j0+ULOk+yG7gms
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzHyj8ACgkQAVBC80lX
0GxKWQgAl7k/YiZbxsRuQX2dYBCZrZKieidNaLZ/YIpqGxPQB6gF2RnfD28Qrf7x
cZ2CdxmwsBKyuD/2RdmmJrNzer8c9LNfv9OLimwgL8dFKnMbVhLpUZ48Qioeu8Sc
+SSLKIxn4dquOJzaYmgxplgsAt7exD6D1GApfeykCbx1fyl+GyMpaQ1yafJ0ApKR
EZxq9kx/w8908rDBxH1hiUw2C0xLxd0XmYubWn52zCcUxe0/sOkQzGpfkUqiv9pu
Wwi9SzaEC71Gi8l9bGNEK4A89EKbJjYBA8zrqEVFi1wm20oBlPeGJQXNag5jsVtu
eRpWSe10j9zbezv79+txwKs2POctyg==
=799w
-----END PGP SIGNATURE-----

--Sig_/.r+ego657j0+ULOk+yG7gms--
