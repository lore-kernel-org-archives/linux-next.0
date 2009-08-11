From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build warning
Date: Tue, 11 Aug 2009 13:22:58 +1000
Message-ID: <20090811132258.8e899735.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__11_Aug_2009_13_22_58_+1000_bCJionCgwSzc=xqC"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753740AbZHKMSk@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__11_Aug_2009_13_22_58_+1000_bCJionCgwSzc=xqC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

sound/usb/usbaudio.c: In function 'init_substream_urbs':
sound/usb/usbaudio.c:1087: warning: comparison of distinct pointer types la=
cks a cast

Introduced by commit 765e8db078e63fdc076fcf6024c15d3b7b955746 ("sound:
usb-audio: do not make URBs longer than sync packet interval").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__11_Aug_2009_13_22_58_+1000_bCJionCgwSzc=xqC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqA5BMACgkQjjKRsyhoI8w8egCeKqsPQx5c5z+Ga41Rw43H+LUO
QEYAn2oUxVdWjNhPB9WmE2OH9skM1Vup
=RZ8E
-----END PGP SIGNATURE-----

--Signature=_Tue__11_Aug_2009_13_22_58_+1000_bCJionCgwSzc=xqC--
