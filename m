From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the netfilter tree
Date: Mon, 15 Apr 2019 17:57:30 +1000
Message-ID: <20190415175657.7824ebc6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/l2K=bE5.rzDSVRQAz7EuIvz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>
List-Id: linux-next.vger.kernel.org

--Sig_/l2K=bE5.rzDSVRQAz7EuIvz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the netfilter-next tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: net/netfilter/nf_conntrack_netlink.o: in function `__crc_nf_ct_get_id':
(.rodata+0x0): multiple definition of `__crc_nf_ct_get_id'; net/netfilter/n=
f_conntrack_core.o:(.rodata+0x20): first defined here

Caused by commit

  a5dc1fb1928a ("netfilter: ctnetlink: don't use conntrack/expect object ad=
dresses as id")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/l2K=bE5.rzDSVRQAz7EuIvz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly0OWoACgkQAVBC80lX
0GwPHAf/UXwnjjoj4okJvHf5Y50ZOJZap4LopxnHSc4MSR6H6g997I22J0sBczXh
s9SEeAoaz0/asYyTSzH7GCYOupipx/uhPhI45tWqjOxnkMIvaqB6i7ZhNzp86ySF
42VhtEvbMbgrgO9tLDAUsL1YTq6R+QXY5R7MuSZ7IQz6whPlapPE3lHFi5eQZx9i
+GFAHzUTaoTQjq86/z44tyPkiXEPB1tVXjT10hSxzbBjjAfIVpVtXkRMmQKVOwvA
XFERIC7zTZINICw2zciPQcdICkaXq+rDF7R+FdBwTI180frv/mUebrSEnIqUNeq1
1KLtawiBB8kZ6MN7RWdo8I44DPxtbQ==
=EEea
-----END PGP SIGNATURE-----

--Sig_/l2K=bE5.rzDSVRQAz7EuIvz--
