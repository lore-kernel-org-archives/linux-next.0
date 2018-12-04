From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Tue, 4 Dec 2018 12:09:36 +1100
Message-ID: <20181204120936.77cd82a9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YsoqOWuYK7+7TM6wmY5NxYd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Petar Penkov <ppenkov@google.com>, Vlad Dumitrescu <vladum@google.com>, Willem de Bruijn <willemb@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/YsoqOWuYK7+7TM6wmY5NxYd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  net/core/filter.c

between commit:

  b7df9ada9a77 ("bpf: fix pointer offsets in context for 32 bit")

from the bpf tree and commit:

  e3da08d05700 ("bpf: allow BPF read access to qdisc pkt_len")

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
index 8659b40172d1,3d54af4c363d..000000000000
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@@ -5771,9 -5770,10 +5771,10 @@@ static bool sk_filter_is_valid_access(i
  	case bpf_ctx_range(struct __sk_buff, data):
  	case bpf_ctx_range(struct __sk_buff, data_meta):
  	case bpf_ctx_range(struct __sk_buff, data_end):
 -	case bpf_ctx_range(struct __sk_buff, flow_keys):
 +	case bpf_ctx_range_ptr(struct __sk_buff, flow_keys):
  	case bpf_ctx_range_till(struct __sk_buff, family, local_port):
  	case bpf_ctx_range(struct __sk_buff, tstamp):
+ 	case bpf_ctx_range(struct __sk_buff, wire_len):
  		return false;
  	}
 =20
@@@ -5797,7 -5797,8 +5798,8 @@@ static bool cg_skb_is_valid_access(int=20
  	switch (off) {
  	case bpf_ctx_range(struct __sk_buff, tc_classid):
  	case bpf_ctx_range(struct __sk_buff, data_meta):
 -	case bpf_ctx_range(struct __sk_buff, flow_keys):
 +	case bpf_ctx_range_ptr(struct __sk_buff, flow_keys):
+ 	case bpf_ctx_range(struct __sk_buff, wire_len):
  		return false;
  	case bpf_ctx_range(struct __sk_buff, data):
  	case bpf_ctx_range(struct __sk_buff, data_end):
@@@ -5842,8 -5843,9 +5844,9 @@@ static bool lwt_is_valid_access(int off
  	case bpf_ctx_range(struct __sk_buff, tc_classid):
  	case bpf_ctx_range_till(struct __sk_buff, family, local_port):
  	case bpf_ctx_range(struct __sk_buff, data_meta):
 -	case bpf_ctx_range(struct __sk_buff, flow_keys):
 +	case bpf_ctx_range_ptr(struct __sk_buff, flow_keys):
  	case bpf_ctx_range(struct __sk_buff, tstamp):
+ 	case bpf_ctx_range(struct __sk_buff, wire_len):
  		return false;
  	}
 =20
@@@ -6272,8 -6274,9 +6275,9 @@@ static bool sk_skb_is_valid_access(int=20
  	switch (off) {
  	case bpf_ctx_range(struct __sk_buff, tc_classid):
  	case bpf_ctx_range(struct __sk_buff, data_meta):
 -	case bpf_ctx_range(struct __sk_buff, flow_keys):
 +	case bpf_ctx_range_ptr(struct __sk_buff, flow_keys):
  	case bpf_ctx_range(struct __sk_buff, tstamp):
+ 	case bpf_ctx_range(struct __sk_buff, wire_len):
  		return false;
  	}
 =20

--Sig_/YsoqOWuYK7+7TM6wmY5NxYd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwF09AACgkQAVBC80lX
0Gw7VAf/TZBXWKB28iHf01HrmCgOku/46/yDzrzXHdYPIYdpkmYWVZ+DZcCXJ/Pv
qsZ2/vF0AZf6KTLDHR2ok/f8XP8x2VYXnNdo1dYrBA+rXFi9D8p9QffpgixHOG5j
S2p7c8elUVs0R5auolNLfemJfe6tNM0oX3ReUtFE8hDoGHESCaAjmgEGEiKjzGnb
scqRcyRew0e07PPIR/JvitvDn5AkgpOoUYGEG82tbRTq6yOG9N7YvQnvUIU/vuBi
2EuVZeBDB0UyaaCoqNx6VWQy1E1XFLEWcuobt+8hzb6mrqbO1k1fj+AFkeMf8Hmv
uZ97OPvVO2JS/oyd9KTjZAfGWMPnbw==
=QIj7
-----END PGP SIGNATURE-----

--Sig_/YsoqOWuYK7+7TM6wmY5NxYd--
