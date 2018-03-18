From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the kvm tree
Date: Mon, 19 Mar 2018 00:44:21 +1100
Message-ID: <20180319004421.44b18d1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/doOM47Y7bOWvP_3kqrHL.9+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/doOM47Y7bOWvP_3kqrHL.9+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There is a series if commits

  e84b7119e891 ("x86/msr: Add AMD Core Perf Extension MSRs")
to
  e1de91ccab31 ("KVM: VMX: WARN on a MOV CR3 exit w/ unrestricted guest")

that are missing a Signed-off-by from their committer.  It looks like
they have been rebased?

--=20
Cheers,
Stephen Rothwell

--Sig_/doOM47Y7bOWvP_3kqrHL.9+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqubTUACgkQAVBC80lX
0GwfPwf/ZJ7WDY7gv6uE+mBG0GBcbTikuEb/BFBOIBMtLdy8MJv+UPJauFmDDvu0
u9s+0T/U6LCq91M9xThBpjIiemQdkOSMJOZh2CslG/YCdyceihKP0yy+3NMdAKj3
SeqXHfXIYm+HsXTNzIAkJIyQmIkjEBuZgCuUzrNB4aJdOZdray2EQRmTKn2jOAFG
uTVRD60iJo0xuDcRT7OQMhrWZOG1eEZnNnBSjSyOiKayWhJ3DUDn9HFMSmssrfdZ
TPVp7tynVMU2v/3zHXPQ1M/kL5mvW49AwZwREgcLw/OL+63rjJ7ukOIdfEl1SxHT
+xxG1JEB14Xire8FJle4WXuk73N0eA==
=kcaQ
-----END PGP SIGNATURE-----

--Sig_/doOM47Y7bOWvP_3kqrHL.9+--
