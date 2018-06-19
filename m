From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Tue, 19 Jun 2018 11:47:26 +1000
Message-ID: <20180619114726.7086cecd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ix7nnKTXVgbpsz5fTv/M.Ou"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Uma Krishnan <ukrishn@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ix7nnKTXVgbpsz5fTv/M.Ou
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/scsi/cxlflash/ocxl_hw.c:62:12: error: initialization from incompati=
ble pointer type [-Werror=3Dincompatible-pointer-types]
  .mount  =3D ocxlflash_fs_mount,
            ^~~~~~~~~~~~~~~~~~
drivers/scsi/cxlflash/ocxl_hw.c:62:12: note: (near initialization for 'ocxl=
flash_fs_type.mount')

Caused by commit

  6eebfb42b5d6 ("vfs: Require specification of size of mount data for inter=
nal mounts")

interacting with commit

  926a62f9bd53 ("scsi: cxlflash: Support adapter file descriptors for OCXL")

from Linus' tree.

I have applide the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 19 Jun 2018 11:42:15 +1000
Subject: [PATCH] scsi: cxlflash: update for fs_type->mount API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/cxlflash/ocxl_hw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_h=
w.c
index 0a95b5f25380..5ad1d5cfb0a8 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -45,12 +45,13 @@ static const struct dentry_operations ocxlflash_fs_dops=
 =3D {
  * @flags:	Flags for the filesystem.
  * @dev_name:	Device name associated with the filesystem.
  * @data:	Data pointer.
+ * @data_size:	Size of the mount data.
  *
  * Return: pointer to the directory entry structure
  */
 static struct dentry *ocxlflash_fs_mount(struct file_system_type *fs_type,
 					 int flags, const char *dev_name,
-					 void *data)
+					 void *data, size_t data_size)
 {
 	return mount_pseudo(fs_type, "ocxlflash:", NULL, &ocxlflash_fs_dops,
 			    OCXLFLASH_FS_MAGIC);
--=20
2.17.1

--=20
Cheers,
Stephen Rothwell

--Sig_/ix7nnKTXVgbpsz5fTv/M.Ou
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsoYK4ACgkQAVBC80lX
0GyqnAf9GGRtYVVCymk9WXqXNc1OqqeA+f9TkILMeDIlmXZ1nyeMGHQ2P3u4hrdo
8CEScqenE6YnlUNzFVyA++JMysWky0YqsnTVaARq1nGsVaNgJIJmSoOvwtJkxx4d
6QoXMoizXOWnBRvN8RuzcOmbNAIZpNQPLpOgAwjmnqOVXD2FWKmlCrGH3J1mlgWP
cAAe76y7whOJAxImPxDY8OXqy7ObyQO0c+pRiOY8LQUIf0ddvBeCeZ9DU3vOCbyi
QOoi46XrI6RkGgtD3M8b0JdEKfFvVavQRi+q5BuVNZWIlQ3Lva/WewRV5iA1hx+S
7ZIkPI3l4W4xcU/v2OAHY4U4h5nuQw==
=Wfa1
-----END PGP SIGNATURE-----

--Sig_/ix7nnKTXVgbpsz5fTv/M.Ou--
