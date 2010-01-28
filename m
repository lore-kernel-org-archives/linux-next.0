From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: vfs tree build failure
Date: Thu, 28 Jan 2010 12:00:00 +1100
Message-ID: <20100128120000.cd804756.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Jan_2010_12_00_00_+1100_vNptf1sNl3cGhxO/"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755486Ab0A1BAW@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>, Eric Paris <eparis@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__28_Jan_2010_12_00_00_+1100_vNptf1sNl3cGhxO/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/namei.c: In function 'do_filp_open':
fs/namei.c:1740: error: too many arguments to function 'ima_file_check'
fs/namei.c:1800: error: too many arguments to function 'ima_file_check'

Caused by commit dbcbe631a87d21e429f156edee4ffdeb7dbd84ce ("ima: rename
ima_path_check to ima_file_check").

I have used the vfs tree from next-20100125 again today.

P.S. that commit has author Mimi Zohar <zohar@linux.vnet.ibm.com>, but is
signed off by only Eric Paris <eparis@redhat.com> and Al Viro
<viro@zeniv.linux.org.uk> (and merely acked by Zohar
<zohar@linux.vnet.ibm.com>).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_Jan_2010_12_00_00_+1100_vNptf1sNl3cGhxO/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktg4ZAACgkQjjKRsyhoI8xW2wCgt0QxJnepnZIaZdZ9I2jv6EWP
XNsAn3c81ChQNqo7y//HtHX40x+clUMT
=SApo
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Jan_2010_12_00_00_+1100_vNptf1sNl3cGhxO/--
