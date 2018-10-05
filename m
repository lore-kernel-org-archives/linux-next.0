From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nfsd tree
Date: Fri, 5 Oct 2018 10:01:33 +1000
Message-ID: <20181005100133.755de185@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jxa2=ZjHkFTVspsf9xwGDb_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Trond Myklebust <trondmy@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/jxa2=ZjHkFTVspsf9xwGDb_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfsd tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/nfs/dns_resolve.c: In function 'nfs_dns_ent_put':
fs/nfs/dns_resolve.c:119:11: error: passing argument 1 of 'call_rcu_sched' =
from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  call_rcu(item, nfs_dns_ent_free_rcu);
           ^~~~
In file included from include/linux/srcu.h:33,
                 from include/linux/notifier.h:16,
                 from include/linux/memory_hotplug.h:7,
                 from include/linux/mmzone.h:758,
                 from include/linux/gfp.h:6,
                 from include/linux/umh.h:4,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from fs/nfs/dns_resolve.c:36:
include/linux/rcupdate.h:59:38: note: expected 'struct callback_head *' but=
 argument is of type 'struct nfs_dns_ent *'
 void call_rcu_sched(struct rcu_head *head, rcu_callback_t func);
                     ~~~~~~~~~~~~~~~~~^~~~

Caused by commit

  fd497f1e40d9 ("NFS: Lockless DNS lookups")

I have used the nfsd tree from next-20181004 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/jxa2=ZjHkFTVspsf9xwGDb_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu2qd0ACgkQAVBC80lX
0Gx9oAgAkdjhijF3k9BvB4j8hdCTr3SaSvIphdH95W1zmsBTayyUkKwrmQbG5sba
rva9iMUifWqiAZ4/xBOnx9tCNqP5qGWXDyknqOdFVBE4sqwZT4IvqN6F/6iE7aNX
yBgf7hVzqWhlTdIh0kAMiLSi1KQrEiVtDBVq0Qv+bj61yWwqcuG7GmUwVZ0pILWg
UK/qBoro7cMt+nA8AGFUERwi7WLD97kcbwPC0GWyj3/fxc79F4yvRw/R4QAIvx+L
EvVsBm8tF0ta4Qln7+GfHhOgcGuiElqGu8hhtENdzYwtrMn8dKSMpJ7ELd79P31r
FjUOsefz2MhMVeQ2mCS+XrrvWqY0dw==
=kaZY
-----END PGP SIGNATURE-----

--Sig_/jxa2=ZjHkFTVspsf9xwGDb_--
