From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Tue, 17 Jul 2018 16:28:39 +1000
Message-ID: <20180717162839.2f5e7053@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/G4=UAVGCdduh6QkxzOe22w3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ivan Safonov <insafonov@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/G4=UAVGCdduh6QkxzOe22w3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/rtl8188eu/core/rtw_security.c: In function 'rtw_tkip_decryp=
t':
drivers/staging/rtl8188eu/core/rtw_security.c:399:21: error: storage size o=
f 'mycontext' isn't known
  struct arc4context mycontext;
                     ^~~~~~~~~
drivers/staging/rtl8188eu/core/rtw_security.c:437:4: error: implicit declar=
ation of function 'phase1' [-Werror=3Dimplicit-function-declaration]
    phase1((u16 *)&ttkey[0], prwskey, &prxattrib->ta[0], pnh);
    ^~~~~~
drivers/staging/rtl8188eu/core/rtw_security.c:438:4: error: implicit declar=
ation of function 'phase2' [-Werror=3Dimplicit-function-declaration]
    phase2(&rc4key[0], prwskey, (unsigned short *)&ttkey[0], pnl);
    ^~~~~~
drivers/staging/rtl8188eu/core/rtw_security.c:442:4: error: implicit declar=
ation of function 'arcfour_init'; did you mean 'rcu_init'? [-Werror=3Dimpli=
cit-function-declaration]
    arcfour_init(&mycontext, rc4key, 16);
    ^~~~~~~~~~~~
    rcu_init
drivers/staging/rtl8188eu/core/rtw_security.c:443:4: error: implicit declar=
ation of function 'arcfour_encrypt'; did you mean 'rtw_wep_encrypt'? [-Werr=
or=3Dimplicit-function-declaration]
    arcfour_encrypt(&mycontext, payload, payload, length);
    ^~~~~~~~~~~~~~~
    rtw_wep_encrypt
drivers/staging/rtl8188eu/core/rtw_security.c:445:23: error: implicit decla=
ration of function 'getcrc32'; did you mean 'get_cred'? [-Werror=3Dimplicit=
-function-declaration]
    *((__le32 *)crc) =3D getcrc32(payload, length-4);
                       ^~~~~~~~
                       get_cred
drivers/staging/rtl8188eu/core/rtw_security.c:399:21: warning: unused varia=
ble 'mycontext' [-Wunused-variable]
  struct arc4context mycontext;
                     ^~~~~~~~~

Caused by commit

  0d4876f4e977 ("staging:r8188eu: Use lib80211 to encrypt (TKIP) tx frames")

interacting with commit

  69a1d98c831e ("Revert "staging:r8188eu: Use lib80211 to support TKIP"")

from the staging.current tree.

I just reverted the staging.current commit ...

--=20
Cheers,
Stephen Rothwell

--Sig_/G4=UAVGCdduh6QkxzOe22w3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltNjJcACgkQAVBC80lX
0GxBegf/c9zGNcFo+qqZh4zuePSUerglo/jeGrTWiWiHxMmz/rjM4JYbU4OISdwl
ReSeAg+0vjstdBxu9VZD6LmRZJE/QrFzKIWy12hYG8//GhcGUR9QZ+MbPOK57z+P
P8IbwWRmm5wWWPDPPbm5lC6aW28ivlWrbl1TDDX7WPRCJaKREi+oPf7+fD3yRyiH
mvEQGXzQRauYvaRGoYTETG6JZm96LdPSGRrsgJXpJmHKPY7iOejXQ74uC4nUYluZ
hKRSAKHaX0nq91YdfgGm046IPa3CUls8e9ybcZXnwuebYxtValWvxOJs98raOzij
VuuZm+Z8sVEquzEdcGA3IwvQNEoUBA==
=D/Ta
-----END PGP SIGNATURE-----

--Sig_/G4=UAVGCdduh6QkxzOe22w3--
