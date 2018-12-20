From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the vfs tree
Date: Fri, 21 Dec 2018 07:45:22 +1100
Message-ID: <20181221074522.0b0c986c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p6HwAU_tfq9f5bddGFFOrnS"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/p6HwAU_tfq9f5bddGFFOrnS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Commits

  e6cf4b0ddae8 ("teach vfs_get_tree() to handle subtype, switch do_new_moun=
t() to it")
  a5df92eef26f ("new helper: vfs_create_mount()")
  84b9446c0cb2 ("mount_fs: suppress MAC on MS_SUBMOUNT as well as MS_KERNMO=
UNT")
  6df9e604628d ("smack: rewrite smack_sb_eat_lsm_opts()")
  a4fdf6490284 ("smack: get rid of match_token()")
  b2130173efae ("smack: take the guts of smack_parse_opts_str() into a new =
helper")
  324240b27f48 ("LSM: new method: ->sb_add_mnt_opt()")
  8a2bfb0f835a ("selinux: rewrite selinux_sb_eat_lsm_opts()")
  3cec2907c913 ("selinux: regularize Opt_... names a bit")
  b0ab2db616c0 ("selinux: switch away from match_token()")
  cbe9d96f42ba ("selinux: new helper - selinux_add_opt()")
  2790a639b456 ("LSM: bury struct security_mnt_opts")
  205b9b7a392a ("smack: switch to private smack_mnt_opts")
  179a64d445e2 ("selinux: switch to private struct selinux_mnt_opts")
  cb662518822e ("LSM: hide struct security_mnt_opts from any generic code")
  6c63bb2d5323 ("selinux: kill selinux_sb_get_mnt_opts()")
  e03db7f5411c ("LSM: turn sb_eat_lsm_opts() into a method")
  dc0dadb3c3d7 ("nfs_remount(): don't leak, don't ignore LSM options quietl=
y")
  363540f775fb ("btrfs: sanitize security_mnt_opts use")
  8f08fcb05ba6 ("selinux; don't open-code a loop in sb_finish_set_opts()")
  144da0858c5e ("LSM: split ->sb_set_mnt_opts() out of ->sb_kern_mount()")
  be917e5b8736 ("new helper: security_sb_eat_lsm_opts()")
  580a8bcb268b ("LSM: lift extracting and parsing LSM options into the call=
er of ->sb_remount()")
  cf891373b60a ("LSM: lift parsing LSM options into the caller of ->sb_kern=
_mount()")
  d02fc3452738 ("smack: make smack_parse_opts_str() clean up on failure")
  17f3b556a3e3 ("selinux: expand superblock_doinit() calls")

are missing a Signed-off-by from their committers.



--=20
Cheers,
Stephen Rothwell

--Sig_/p6HwAU_tfq9f5bddGFFOrnS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwb/2IACgkQAVBC80lX
0GxLzgf+K7/8UPnOL5DR52WMIUS8B65SD37helBcAb9H1BZJfCJVb8jD27HLSL9N
Ro/V04nGOxtUuXAQQgI3jhEyRSqKRe4aaXCEmzFyEufLGkUp/i8aR0LZlS2P5lL1
pl1ZW9q4qKQwMpPMhOsoDLtfpUdnNlIY2X26SmzKYMbRBuBtiVLMySO/9J+3Cili
6x3oZf6OR3DrynMQ30F6B+EsGxjZlXl/opi/HaPG4hr65Rx02MeIvMZ7f53IztU5
K7PZNSu+1j5JNH+NSFQIp1cIV9lTztjsz5qcAz0ij73uNJusFEPJ0gLU2XrBpWNO
mh7q6PDIavE55TKz0pzoYF4/F988JQ==
=reGn
-----END PGP SIGNATURE-----

--Sig_/p6HwAU_tfq9f5bddGFFOrnS--
