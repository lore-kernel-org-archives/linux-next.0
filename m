From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the bpf-next tree
Date: Mon, 25 Mar 2019 09:28:04 +1100
Message-ID: <20190325092804.650ebdb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YNsqztMGNElbYCVRa5A4DFZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Willem de Bruijn <willemb@google.com>, David Miller <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Sig_/YNsqztMGNElbYCVRa5A4DFZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bpf-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

net/core/filter.c: In function 'bpf_skb_adjust_room':
net/core/filter.c:3022:31: warning: 'inner_trans' may be used uninitialized=
 in this function [-Wmaybe-uninitialized]
   skb->inner_transport_header =3D inner_trans;
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
net/core/filter.c:2979:26: note: 'inner_trans' was declared here
  u16 mac_len, inner_net, inner_trans;
                          ^~~~~~~~~~~
net/core/filter.c:3021:29: warning: 'inner_net' may be used uninitialized i=
n this function [-Wmaybe-uninitialized]
   skb->inner_network_header =3D inner_net;
   ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
net/core/filter.c:2979:15: note: 'inner_net' was declared here
  u16 mac_len, inner_net, inner_trans;
               ^~~~~~~~~
net/core/filter.c:3026:3: warning: 'mac_len' may be used uninitialized in t=
his function [-Wmaybe-uninitialized]
   skb_set_network_header(skb, mac_len);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
net/core/filter.c:2979:6: note: 'mac_len' was declared here
  u16 mac_len, inner_net, inner_trans;
      ^~~~~~~

Introduced by commit

  868d523535c2 ("bpf: add bpf_skb_adjust_room encap flags")


This looks like a false positive, it seems that they are only set and
used when encap is true.

--=20
Cheers,
Stephen Rothwell

--Sig_/YNsqztMGNElbYCVRa5A4DFZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyYBHQACgkQAVBC80lX
0Gz5oQf/bqDuspc7rew3DSlB8gTjirNsI/I6Kr7rvSxha9KkS2dPYyc7PovVNLSL
plCz3k3qAIvfOuu/ZthW6/NHTSrgfyKSoYqMXpztU8O2v1886BFsnW3eGhxbWrAi
1fu4cFsTQ6VeYzVwSoKExwAKIR1/MYG6VAZzMGj91lsAmlaZtvkw4kzzKRRY6WKl
WVKYwau53lLuQTs4HFGWZ8GiCdYLhbrp4RN5GjjyflAOZJPe6RHf9Z7fXOvvufAD
+s8LlSnpxYaYIOj1uffM1ev+Vr1fzKjKUuwk7tvNYm+QW6FeqmGMRoxa+ntaHc04
+pXcOofMZUn+discynRTAN/Xkf2V9Q==
=0Joz
-----END PGP SIGNATURE-----

--Sig_/YNsqztMGNElbYCVRa5A4DFZ--
