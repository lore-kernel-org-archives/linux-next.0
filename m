From: Mark Brown <broonie@kernel.org>
Subject: linux-next: Tree for Oct 13th
Date: Fri, 13 Oct 2017 22:06:28 +0100
Message-ID: <20171013210628.izp3bf4glwa5kq7h@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sxaszxf5o4tkjw46"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--sxaszxf5o4tkjw46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Changes since 20171012:

The rdma tree gained a conflict.

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with an arm64 defconfig, an allmodconfig (with
CONFIG_BUILD_DOCSRC=3Dn) for x86_64, a multi_v7_defconfig for arm and a
native build of tools/perf. After the final fixups (if any), I do an
x86_64 modules_install followed by builds for x86_64 allnoconfig,
and arm64 allnoconfig=20

--sxaszxf5o4tkjw46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnhKtMACgkQJNaLcl1U
h9AzrAf9HuefWIr/tR+nM22VDjQErea7zjs00eXLjuAqOZC6B6aKIrRkW65wagCR
fJUfqPbjGY8183iWfpYqaN19+BZKQy2DFFM72qigDtasnqWEpIasziffvOfS3WTi
BqOSi0IUfI2HUXnfgn+0J2svUDSi1FVn7Ry9zumEP1RZ1vyBi9GRGmcO/xA0/KZJ
zoGtLiWVxPzQtVVj+wx/mjscvq/eXna/3AOlSuTADrWoFo0HmUBh1AKGVVgbW63q
vGQuJp2OQJRaOE2yui7r3lOQ6FUBmQgzc0i8IFdshqGfD5Sluh+zYwIj12PSEBEh
W/da6Mnd6HrBu0TsuFhoJT9rCfSkOQ==
=wBC8
-----END PGP SIGNATURE-----

--sxaszxf5o4tkjw46--
