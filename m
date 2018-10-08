From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ext4 tree
Date: Tue, 9 Oct 2018 10:51:02 +1100
Message-ID: <20181009105102.752dd9ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VE.6rR8QIzaC+fBcZYboxmY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/VE.6rR8QIzaC+fBcZYboxmY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ted,

After merging the ext4 tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/srcu.h:33,
                 from include/linux/notifier.h:16,
                 from include/linux/memory_hotplug.h:7,
                 from include/linux/mmzone.h:752,
                 from include/linux/gfp.h:6,
                 from include/linux/umh.h:4,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from fs/ext4/super.c:20:
fs/ext4/super.c: In function 'get_qf_name':
fs/ext4/super.c:931:40: error: 'struct ext4_sb_info' has no member named 's=
_qf_names'; did you mean 's_mb_maxs'?
  return rcu_dereference_protected(sbi->s_qf_names[type],
                                        ^~~~~~~~~~
include/linux/rcupdate.h:358:12: note: in definition of macro '__rcu_derefe=
rence_protected'
  ((typeof(*p) __force __kernel *)(p)); \
            ^
fs/ext4/super.c:931:9: note: in expansion of macro 'rcu_dereference_protect=
ed'
  return rcu_dereference_protected(sbi->s_qf_names[type],
         ^~~~~~~~~~~~~~~~~~~~~~~~~
fs/ext4/super.c:931:40: error: 'struct ext4_sb_info' has no member named 's=
_qf_names'; did you mean 's_mb_maxs'?
  return rcu_dereference_protected(sbi->s_qf_names[type],
                                        ^~~~~~~~~~
include/linux/rcupdate.h:358:35: note: in definition of macro '__rcu_derefe=
rence_protected'
  ((typeof(*p) __force __kernel *)(p)); \
                                   ^
fs/ext4/super.c:931:9: note: in expansion of macro 'rcu_dereference_protect=
ed'
  return rcu_dereference_protected(sbi->s_qf_names[type],
         ^~~~~~~~~~~~~~~~~~~~~~~~~
fs/ext4/super.c: In function 'parse_options':
fs/ext4/super.c:1976:26: warning: unused variable 'grp_qf_name' [-Wunused-v=
ariable]
  char *p, *usr_qf_name, *grp_qf_name;
                          ^~~~~~~~~~~
fs/ext4/super.c:1976:12: warning: unused variable 'usr_qf_name' [-Wunused-v=
ariable]
  char *p, *usr_qf_name, *grp_qf_name;
            ^~~~~~~~~~~

Caused by commit

  cc1ee227e890 ("ext4: fix use-after-free race in ext4_remount()'s error pa=
th")

# CONFIG_QUOTA is not set

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/VE.6rR8QIzaC+fBcZYboxmY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu77WYACgkQAVBC80lX
0GwFfQf/beYY8Rb0CwovvRZExqfioGpQdO4p2FILzHIpV/k+wJ4W+5po5o8knv9v
0Ll/4hepLCQ/yISS7Ry3LTOcZ1ZLraLOxRGUuMlId5IsGsWDjY7Qd8n0XbYMNwNU
GsHSmg4zgPFiAYDYcRv/40YVVqRboC1/FbDUhvhJZ5t32q8Q00eawm4KYdX/nB6m
lze0Bu+cGJ/3FazoUxPFh2R3U3iUXy1WxpyLnYTpySf7l+TqRGpTG72Vt0jqsY5u
81MZkflb9uvt8pgbEOWJXD6H7haFhflJzgQ+QXLYeXqOWzluEpc9mem2oDABGD2h
ydrNCFLEgd8rde/mdGqkIxZXgO+yAQ==
=AbQd
-----END PGP SIGNATURE-----

--Sig_/VE.6rR8QIzaC+fBcZYboxmY--
