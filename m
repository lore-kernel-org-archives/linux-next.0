From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the netfilter tree
Date: Mon, 15 Apr 2019 08:15:11 +1000
Message-ID: <20190415081511.5bb6f079@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6W8k5es4STvbnGrzJBCubrc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>
List-Id: linux-next.vger.kernel.org

--Sig_/6W8k5es4STvbnGrzJBCubrc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the netfilter tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

WARNING: net/netfilter/nf_conntrack_netlink: 'nf_ct_get_id' exported twice.=
 Previous export was in net/netfilter/nf_conntrack.ko

Introduced by commit

  a5dc1fb1928a ("netfilter: ctnetlink: don't use conntrack/expect object ad=
dresses as id")

--=20
Cheers,
Stephen Rothwell

--Sig_/6W8k5es4STvbnGrzJBCubrc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyzsO8ACgkQAVBC80lX
0GxAhggAm6kbUw+wJycsUBKUPkB7K4HEZeMNzKdEZ2ao4OebT8vWWPE/Y/VQte8B
+wWTWdBWIFf+XTj3PhiOPjwTnRu06uEv89HREsmXwGvDs/9cUvquUQo3AW2WtoVU
LC7X2pZ/FaW+Vx13fzRSrf06zjz2a/hCGOHW0f7hrMrSgTC80PbICmqNXzoJe6Ir
chSZSvED+FZTXMSNSYETx0KVfiqtXE1UHzWA79lfA3Lc9qrCtXrnehcT0IMG4KG8
6eMyiuF6FpbI1Fn0TRT42oSY7W2UCKz1OGq2+gT5089ab/N2MnMinhtvJ3b7GkaU
hY3mQDL4A2uJFWHg0p+/Ql9IjC/vTw==
=KAAy
-----END PGP SIGNATURE-----

--Sig_/6W8k5es4STvbnGrzJBCubrc--
