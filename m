From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Mon, 12 Nov 2018 11:54:00 +1100
Message-ID: <20181112115400.46bdc84b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iAnKRWPNKIlT9TOuqgclQHH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Ignatov <rdna@fb.com>, Nitin Hande <nitin.hande@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iAnKRWPNKIlT9TOuqgclQHH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  net/core/filter.c

between commit:

  b13b8787c95c ("bpf: Fix IPv6 dport byte order in bpf_sk_lookup_udp")

from the bpf tree and commit:

  c8123ead13a5 ("bpf: Extend the sk_lookup() helper to XDP hookpoint.")

from the bpf-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/core/filter.c
index 9a1327eb25fa,53d50fb75ea1..000000000000
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@@ -4852,19 -4867,19 +4867,18 @@@ static struct sock *sk_lookup(struct ne
  	} else {
  		struct in6_addr *src6 =3D (struct in6_addr *)&tuple->ipv6.saddr;
  		struct in6_addr *dst6 =3D (struct in6_addr *)&tuple->ipv6.daddr;
- 		int sdif =3D inet6_sdif(skb);
 -		u16 hnum =3D ntohs(tuple->ipv6.dport);
 =20
  		if (proto =3D=3D IPPROTO_TCP)
- 			sk =3D __inet6_lookup(net, &tcp_hashinfo, skb, 0,
+ 			sk =3D __inet6_lookup(net, &tcp_hashinfo, NULL, 0,
  					    src6, tuple->ipv6.sport,
 -					    dst6, hnum,
 +					    dst6, ntohs(tuple->ipv6.dport),
  					    dif, sdif, &refcounted);
  		else if (likely(ipv6_bpf_stub))
  			sk =3D ipv6_bpf_stub->udp6_lib_lookup(net,
  							    src6, tuple->ipv6.sport,
 -							    dst6, hnum,
 +							    dst6, tuple->ipv6.dport,
  							    dif, sdif,
- 							    &udp_table, skb);
+ 							    &udp_table, NULL);
  #endif
  	}
 =20

--Sig_/iAnKRWPNKIlT9TOuqgclQHH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvozygACgkQAVBC80lX
0GzeKgf9Hkh5jfduCO5Pp8IQA+ZasnRv99RzoszuLhSr94PRHUWTOrajDpv7y/+r
V2DBu2ndRKqqVFx2q69ViMON2dXWOBHZVTRRwNzl3WCacIOlQDGkZ1199N0XBqr7
bTr4UCSk0eAdtnHQmVwiQdDtaruE37EwulxKgOoPw3ce/aRA5RW1owhnMRutFkbi
M65EMdj/4zIBx4dBccLUQAR3Z15Y5dtycApvIAzI2UkE6kUC8coqto5fCqwE5Fpt
XhVJByBsp4rB5l5066t20CClHAOPBn/Do/W9yn77R4Sc5a+LkPO6H668/MeOh9D/
UOHI/q2GrMQqnYuUVfFIdmMLTV40rQ==
=8kmV
-----END PGP SIGNATURE-----

--Sig_/iAnKRWPNKIlT9TOuqgclQHH--
