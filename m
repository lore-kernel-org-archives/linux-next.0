From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bpf tree
Date: Mon, 16 Apr 2018 12:30:00 +1000
Message-ID: <20180416123000.30fd8a04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/z/+uyHLVn+3.ksDUOgyPIfK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/z/+uyHLVn+3.ksDUOgyPIfK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bpf tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/bpf/core.o: In function `sock_map_release':
core.c:(.text+0xd04): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here
kernel/events/core.o: In function `sock_map_release':
core.c:(.text+0x85cc): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here
block/blk-core.o: In function `sock_map_release':
blk-core.c:(.text+0x58e8): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here
drivers/net/virtio_net.o: In function `sock_map_release':
virtio_net.c:(.text+0x53ec): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here
net/core/dev.o: In function `sock_map_release':
dev.c:(.text+0x6c68): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here
net/core/rtnetlink.o: In function `sock_map_release':
rtnetlink.c:(.text+0x63e0): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here
net/core/filter.o: In function `sock_map_release':
filter.c:(.text+0x8c8c): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here
net/core/sock_reuseport.o: In function `sock_map_release':
sock_reuseport.c:(.text+0x398): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here
net/bpf/test_run.o: In function `sock_map_release':
test_run.c:(.text+0x3dc): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here
net/packet/af_packet.o: In function `sock_map_release':
af_packet.c:(.text+0x6958): multiple definition of `sock_map_release'
kernel/sysctl.o:sysctl.c:(.text+0x1a50): first defined here

Caused by commit

  9b2e8bbc4e7a ("bpf: sockmap, map_release does not hold refcnt for pinned =
maps")

I applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 16 Apr 2018 12:27:24 +1000
Subject: [PATCH] fix for "bpf: sockmap, map_release does not hold refcnt for
 pinned maps"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/bpf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index f46561de5154..3b6c2b66f414 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -660,7 +660,7 @@ static inline int sock_map_prog(struct bpf_map *map,
 	return -EOPNOTSUPP;
 }
=20
-void sock_map_release(struct bpf_map *map) {}
+static inline void sock_map_release(struct bpf_map *map) {}
 #endif
=20
 /* verifier prototypes for helper functions called from eBPF programs */
--=20
2.16.3

--=20
Cheers,
Stephen Rothwell

--Sig_/z/+uyHLVn+3.ksDUOgyPIfK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrUCqgACgkQAVBC80lX
0GwJSQf/bE61HpqdcNVK65k6QMq+KhnOJrII8d0UqpvUZsM2zKJ9H2VOzqokvwxs
HYvbSwIYJ/fTXgDBpb+hMP+ghlCzhAprdHobVeplffsQPV5LVMTbcwpdqpg8nC3U
vdXW2LUZoJPKGW9iPaC56ULf/QE8mDdeXr4sO6cDQ0e1Rpplmz+T43PPfgjUAKle
ktP/3Xw/DQEvoDIhkh64zCBTFQoE35Mr1sC6uXpBIp6ccEJ9NscCQU3cXKDALUH0
piD8kbgQCXD6F4gxJFVUtQ2HEqPnAbgv1pxDfkTKV+xjpYZETSdL0kAVNENitQrH
PKpOhCihtTgGdDZWOxTwMicV9EeZXg==
=IQvX
-----END PGP SIGNATURE-----

--Sig_/z/+uyHLVn+3.ksDUOgyPIfK--
