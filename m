From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the netfilter-next tree
Date: Fri, 12 Apr 2019 16:37:20 +1000
Message-ID: <20190412163720.576c6610@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oR8njQFj0U8FUgPgAFadP=D"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
List-Id: linux-next.vger.kernel.org

--Sig_/oR8njQFj0U8FUgPgAFadP=D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the netfilter tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

In file included from /home/sfr/next/next/net/bridge/br_input.c:19:
/home/sfr/next/next/include/net/netfilter/nf_queue.h:16:23: error: field 's=
tate'
 has incomplete type
  struct nf_hook_state state;
                       ^~~~~

Caused by commit

  971502d77faa ("bridge: netfilter: unroll NF_HOOK helper in bridge input p=
ath")

This build has CONFIG_NETFILTER not set.

I have applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 12 Apr 2019 16:32:47 +1000
Subject: [PATCH] bridge: only include nf_queue.h if needed

---
 net/bridge/br_input.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bridge/br_input.c b/net/bridge/br_input.c
index e0aacfedcfe1..86dc46f6a68f 100644
--- a/net/bridge/br_input.c
+++ b/net/bridge/br_input.c
@@ -16,7 +16,9 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/netfilter_bridge.h>
+#ifdef CONFIG_NETFILTER_FAMILY_BRIDGE
 #include <net/netfilter/nf_queue.h>
+#endif
 #include <linux/neighbour.h>
 #include <net/arp.h>
 #include <linux/export.h>
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/oR8njQFj0U8FUgPgAFadP=D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlywMiAACgkQAVBC80lX
0GylpAf+MwFoGn4mG286guZxJhwHgLa4J/ZQuJonNtQPbXxNNzJXpvJkfWZUm7h5
vQAf+NtuAVoC7vG4zGubdkjXBo6nN+OEQjcoJMLgyou0EjVJDoj47+r02S0LwbZ+
Flt/9IHsM9nN3qA2Rxdi+gSRv/NFMciwJQwORU8krfWpDRS3L8tArn4vwDoFCIir
K4y5ITYJ5RhWkA6ML6TGR3dVqCz1IQKJw7W3jTF/MliWhURIRvk8oMsAazOhHc/e
/vAjvYfb+Kchfc0MgZwEEYdiTgTq8M3mINkqSXmJBxLXjTJ47v8nHXjoTHGty5++
fgwLWm/A/zhfLYSFiKUJNgqliTzMsg==
=S0en
-----END PGP SIGNATURE-----

--Sig_/oR8njQFj0U8FUgPgAFadP=D--
