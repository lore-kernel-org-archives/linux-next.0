From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: linux-next: Fixes tag needs some work in the wireless-drivers-next
 tree
Date: Tue, 28 May 2019 07:48:13 +1000
Message-ID: <20190528074813.122bdddb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BrxpA.sp=dhLlqfhF1hlmg/"; protocol="application/pgp-signature"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Surabhi Vishnoi <svishnoi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pradeep kumar Chitrapu <pradeepc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Zhi Chen <zhichen-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

--Sig_/BrxpA.sp=dhLlqfhF1hlmg/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9280f4fc06f4 ("ath10k: Fix the wrong value of enums for wmi tlv stats id")

Fixes tag

  Fixes: f40a307eb92c ("ath10k: Fill rx duration for each peer in fw_stats =
for WCN3990)

has these problem(s):

  - Subject has leading but no trailing quotes

In commit

  93ee3d108fc7 ("ath10k: fix incorrect multicast/broadcast rate setting")

Fixes tag

  Fixes: cd93b83ad92 ("ath10k: support for multicast rate control")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/BrxpA.sp=dhLlqfhF1hlmg/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzsWx0ACgkQAVBC80lX
0Gzg+Af+Lb89BcVA/rGFGnEEurc2Q7yTKeOJdfirGZEvGWUfNG+u1Rnpvjk26PDo
+F6glbpYfjrNuNyv/9+a/DPUKndL+7eNBojV/sK2Za406DpFxkeEho+15wWByg88
h1rt/k2DlhFjV8izI/lYOpfI0NU0bhzvwdZoVQ8CTlKuRvsDNqILL+AhusOLUBrs
mW+veapxaGMJk/YKSuw082n3EgoCn3bRTxR2IpBfv+8AhM0qHzcBHZBfhaCrg5Nq
xW7Eh1HhoDLYSMr3IWG4fchRe3vrmyWiX3wD3LioCstqLWOmwg7G48hY/PzYw8AR
Yav5nf1CPxs8/NEnTif0/hG70EZvBA==
=8IXb
-----END PGP SIGNATURE-----

--Sig_/BrxpA.sp=dhLlqfhF1hlmg/--
