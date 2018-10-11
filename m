From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [GIT PULL] A couple of warning fixes
Date: Fri, 12 Oct 2018 09:12:46 +1100
Message-ID: <20181012091246.05e8d4ef@canb.auug.org.au>
References: <20180824172053.20fa197294f51496dcec5605@kernel.org>
        <20180824204756.e787765461975cd1e27502dc@kernel.org>
        <20180824224211.2934d7c0@canb.auug.org.au>
        <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
        <20180828072333.36af4d5d@canb.auug.org.au>
        <20180828094341.d20d8fbcb9dca310d44df951@kernel.org>
        <f0ca0036-abe1-4252-6d30-b810dd22097d@linux.ibm.com>
        <20181011114809.5590ecb3@canb.auug.org.au>
        <d5b166d6-461c-f382-e3d2-8993b845bd5a@linux.ibm.com>
        <20181011205849.6f6645fa@canb.auug.org.au>
        <20181011103750.GA29735@kroah.com>
        <CAK8P3a3DTbcSgOEqt-zAsX9DpVSOmS6apYXXkRHK2FKc5mvW2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ctpuL9E/W36PAbp7PSlxH9+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3DTbcSgOEqt-zAsX9DpVSOmS6apYXXkRHK2FKc5mvW2Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Oberparleiter <oberpar@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ctpuL9E/W36PAbp7PSlxH9+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

[Hopefully you and others don't mind fetching these from me directly.]
[My first pull request, let me know if I did something wrong.]

The following changes since commit 0778a9f2dd924c3af41971ba40eec44793aea531:

  Merge branch 'for-4.19-fixes' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/tj/cgroup (2018-10-11 19:24:01 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sfr/next-fixes.git tags/nex=
t-fixes-20181012

for you to fetch changes up to 52c8ee5bad8f33d02c567f6609f43d69303fc48d:

  vmlinux.lds.h: Fix linker warnings about orphan .LPBX sections (2018-10-1=
2 08:55:29 +1100)

----------------------------------------------------------------
Two fixes from Peter Oberparleiter <oberpar@linux.ibm.com>:

Commit

  6b7dca401cb1 ("tracing: Allow gcov profiling on only ftrace subsystem")

uncovered linker problems when using gcov kernel profiling on some
architectures. These problems were likely introduced earlier, and are
possibly related to compiler changes.

----------------------------------------------------------------
Peter Oberparleiter (2):
      vmlinux.lds.h: Fix incomplete .text.exit discards
      vmlinux.lds.h: Fix linker warnings about orphan .LPBX sections

 arch/arm/kernel/vmlinux.lds.h     | 2 ++
 include/asm-generic/vmlinux.lds.h | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

--=20
Cheers,
Stephen Rothwell

--Sig_/ctpuL9E/W36PAbp7PSlxH9+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu/yt4ACgkQAVBC80lX
0GwGoAf+PY8Ml6XVU/yR/op0MHvnQExzUlKzKnsI29NFY0HlDhyfKZX4b+xgd+/J
opYztMYtOgPl8cT9UwSo63Q1eMJ6Lrx5VCSPZ3mwIRAGv6FxkFzZGPNt8nFUX5zl
ZhmIzQiwSZSnKI64Glqwv3UI+FSFSwlqB7V6lYqI3jLkha4rabJ0AVD/qip3qlzU
Sfy5zu8sBghhBKuCJFxBN/y+us08/eF5ziFtMVw40Z+gHhKSg6gP+ZoxCPDPI2ey
DEHiOlvR5t2T2+GLg5pzqVGw9KUH9f93UL7p1bqGHWuOMSCHt+JeYQs3kgqdT3gZ
lSm/rlIdOba2fwnulGy19goB9FYzaQ==
=W+zP
-----END PGP SIGNATURE-----

--Sig_/ctpuL9E/W36PAbp7PSlxH9+--
