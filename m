From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Fri, 12 Jun 2009 12:57:45 +1000
Message-ID: <20090612125745.afadf2aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Jun_2009_12_57_45_+1000_n08M6kVILlhX_Hnm"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932261AbZFLC55@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__12_Jun_2009_12_57_45_+1000_n08M6kVILlhX_Hnm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next merge of the kvm tree got conflicts in about 23
files.  This has happened because only a subset of the kvm tree that is
merged into the linux-next tree has been merged into Linus' tree *and*
that subset was rebased before the merge happened.

I have dropped the kvm tree.

Is there some other branch that I should be including in linux-next
instead of the current one i.e. something that represents what you will
actually send to Linus that doesn't need to be rebased before that
happens?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Jun_2009_12_57_45_+1000_n08M6kVILlhX_Hnm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoxxCkACgkQjjKRsyhoI8xy3gCgrOhHNTRlTT8+lKVtGViwOPSw
kkEAoI0PAIhlng/OktB9X2fZZzxXkTIF
=6ZPq
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Jun_2009_12_57_45_+1000_n08M6kVILlhX_Hnm--
