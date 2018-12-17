From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the vfs tree
Date: Tue, 18 Dec 2018 10:38:10 +1100
Message-ID: <20181218103810.11687f68@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NtkgW1+nRoCK.YKjRv.S9xP"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/NtkgW1+nRoCK.YKjRv.S9xP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Commits

  c1cae12e6b4a ("vfs: Add a sample program for the new mount API")
  d101a34a2c79 ("vfs: syscall: Add fspick() to select a superblock for reco=
nfiguration")
  1fcae4c630e3 ("vfs: syscall: Add fsmount() to create a mount for a superb=
lock")
  ec4256de39c3 ("vfs: syscall: Add fsconfig() for configuring and managing =
a context")
  0cba0050bcbe ("vfs: Implement logging through fs_context")
  4552c960ff40 ("vfs: syscall: Add fsopen() to prepare for superblock creat=
ion")
  03ca430a2648 ("Make anon_inodes unconditional")
  96298884c8b4 ("vfs: syscall: Add move_mount(2) to move mounts around")
  6c606fff6c91 ("afs: Use fs_context to pass parameters over automount")
  10424811186f ("afs: Add fs_context support")
  8fa5366945d8 ("vfs: Add some logging to the core users of the fs_context =
log")
  8907f3967fbc ("vfs: Implement logging through fs_context")
  bed15a150f44 ("vfs: Provide documentation for new mount API")
  460375e70621 ("vfs: Remove kern_mount_data()")
  e88bea43b477 ("hugetlbfs: Convert to fs_context")
  d48db7fb30db ("kernfs, sysfs, cgroup, intel_rdt: Support fs_context")
  35822336b482 ("cpuset: Use fs_context")
  b97c89323b7b ("ipc: Convert mqueue fs to fs_context")
  e1f97a645981 ("proc: Add fs_context support to procfs")
  5aed868ddf7f ("procfs: Move proc_fill_super() to fs/proc/root.c")
  013c7af575e5 ("vfs: Implement a filesystem superblock creation/configurat=
ion context")
  47173883ff4d ("tomoyo: Implement security hooks for the new mount API")
  c36d02347290 ("apparmor: Implement security hooks for the new mount API")
  18ee890db905 ("vfs: Put security flags into the fs_context struct")
  18ef962eeec1 ("vfs: Add LSM hooks for the new mount API")
  1bff8b546644 ("vfs: Add configuration parser helpers")
  57fb096cd685 ("vfs: Introduce logging functions")
  23ac0033ae3c ("vfs: Introduce the basic header for the new mount API's fi=
lesystem context")
  0a8054c863b8 ("vfs: Separate changing mount flags full remount")
  e322b9267880 ("vfs: Suppress MS_* flag defs within the kernel unless expl=
icitly enabled")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/NtkgW1+nRoCK.YKjRv.S9xP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwYM2IACgkQAVBC80lX
0Gzcywf+JAGWAjUM0QAfyEBgD+a1rX97iANjWiwSWIaavUekLrNdt44yCgC1sN2M
4ExYjFWy3jU5UhKfF7IAE5sh7LC8qEyQDBuvWqCLPxUc0ISGpAgZ8O7/aB5OCnC6
OTGKBoh5FXU2fQGdcnC1STSlKIFEPtQyeNm+wNnMGqVbESQfJrLIAPJiKJfM9/Df
klfa586JUvUyH12ctU6frdqIIPtfV0lYHXSxlOJ474XfLgaP2tcbo87VFq9BeMOD
xFC+nUDaAMHLlAMilnSpWMKJ2Qc/AbCuEDdPqjtf0dX69U4LQz+XeZDpBMX1zGEg
+HtgKUz+tMpHIFPKVI3N/vXGi6Kj1Q==
=dhHA
-----END PGP SIGNATURE-----

--Sig_/NtkgW1+nRoCK.YKjRv.S9xP--
