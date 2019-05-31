From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Fri, 31 May 2019 10:35:08 +1000
Message-ID: <20190531103508.1bfc06db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/W.Z4eGjR4oT3n1RNXpkMYJa"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>
List-Id: linux-next.vger.kernel.org

--Sig_/W.Z4eGjR4oT3n1RNXpkMYJa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from net/netfilter/utils.c:5:
include/linux/netfilter_ipv6.h: In function 'nf_ipv6_br_defrag':
include/linux/netfilter_ipv6.h:110:9: error: implicit declaration of functi=
on 'nf_ct_frag6_gather'; did you mean 'nf_ct_attach'? [-Werror=3Dimplicit-f=
unction-declaration]
  return nf_ct_frag6_gather(net, skb, user);
         ^~~~~~~~~~~~~~~~~~
         nf_ct_attach

Caused by commit

  764dd163ac92 ("netfilter: nf_conntrack_bridge: add support for IPv6")

CONFIG_IPV6 is not set for this build.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/W.Z4eGjR4oT3n1RNXpkMYJa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwdrwACgkQAVBC80lX
0GymwQf/d4wXf91KoGIB7ydQiSpx7yRSRdw2moG9XUV0oidKP3RZF17p9wOjQXp7
kGWuPdykRUIsJNNVzWUfQXRSKaYthcMVG3bJRoj/63GQLKfKR7rhocfihPMPc2uI
YATaDoHCz1fAy5hOgOLY4fkpuW3Pynuo8eRMhcUVsHs0Dkw/r1iPRQ7Bc8vCYOod
SUflPO3jWNMiKPd4965BkDQDMBPz75B/d9UbXSKtA9esqFW5J7VET7y27zVXPc2n
DhM8j93WERysFLRJpn3ns9ZqLi0JBBSmdn3Kn7Xg8ORP7Ul4uynPA3gDWsn3EyMJ
f0bnj9l4G7XN14FXVFzULgih62VUeA==
=a/FF
-----END PGP SIGNATURE-----

--Sig_/W.Z4eGjR4oT3n1RNXpkMYJa--
