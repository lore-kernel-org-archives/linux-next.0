From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Tue, 30 Oct 2018 12:20:50 +1100
Message-ID: <20181030122050.1bd82c30@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mwwwIutqEkPptyjt=g5VmnB"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/mwwwIutqEkPptyjt=g5VmnB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/compat_ioctl.c

between commit:

  77654350306a ("take compat TIOC[SG]SERIAL treatment into tty_compat_ioctl=
()")

from Linus' tree and commit:

  69374d063be0 ("compat_ioctl: remove pointless HCI... ioctls")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/compat_ioctl.c
index 6e30949d9f77,326ceab5246a..000000000000
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@@ -429,13 -499,68 +429,6 @@@ static int mt_ioctl_trans(struct file *
 =20
  #endif /* CONFIG_BLOCK */
 =20
- /* Bluetooth ioctls */
- #define HCIUARTSETPROTO		_IOW('U', 200, int)
- #define HCIUARTGETPROTO		_IOR('U', 201, int)
- #define HCIUARTGETDEVICE	_IOR('U', 202, int)
- #define HCIUARTSETFLAGS		_IOW('U', 203, int)
- #define HCIUARTGETFLAGS		_IOR('U', 204, int)
 -struct serial_struct32 {
 -        compat_int_t    type;
 -        compat_int_t    line;
 -        compat_uint_t   port;
 -        compat_int_t    irq;
 -        compat_int_t    flags;
 -        compat_int_t    xmit_fifo_size;
 -        compat_int_t    custom_divisor;
 -        compat_int_t    baud_base;
 -        unsigned short  close_delay;
 -        char    io_type;
 -        char    reserved_char[1];
 -        compat_int_t    hub6;
 -        unsigned short  closing_wait; /* time to wait before closing */
 -        unsigned short  closing_wait2; /* no longer used... */
 -        compat_uint_t   iomem_base;
 -        unsigned short  iomem_reg_shift;
 -        unsigned int    port_high;
 -     /* compat_ulong_t  iomap_base FIXME */
 -        compat_int_t    reserved[1];
 -};
 -
 -static int serial_struct_ioctl(struct file *file,
 -		unsigned cmd, struct serial_struct32 __user *ss32)
 -{
 -        typedef struct serial_struct32 SS32;
 -        int err;
 -	struct serial_struct __user *ss =3D compat_alloc_user_space(sizeof(*ss));
 -        __u32 udata;
 -	unsigned int base;
 -	unsigned char *iomem_base;
 -
 -	if (ss =3D=3D NULL)
 -		return -EFAULT;
 -        if (cmd =3D=3D TIOCSSERIAL) {
 -		if (copy_in_user(ss, ss32, offsetof(SS32, iomem_base)) ||
 -		    get_user(udata, &ss32->iomem_base))
 -			return -EFAULT;
 -		iomem_base =3D compat_ptr(udata);
 -		if (put_user(iomem_base, &ss->iomem_base) ||
 -		    convert_in_user(&ss32->iomem_reg_shift,
 -		      &ss->iomem_reg_shift) ||
 -		    convert_in_user(&ss32->port_high, &ss->port_high) ||
 -		    put_user(0UL, &ss->iomap_base))
 -			return -EFAULT;
 -        }
 -	err =3D do_ioctl(file, cmd, (unsigned long)ss);
 -        if (cmd =3D=3D TIOCGSERIAL && err >=3D 0) {
 -		if (copy_in_user(ss32, ss, offsetof(SS32, iomem_base)) ||
 -		    get_user(iomem_base, &ss->iomem_base))
 -			return -EFAULT;
 -		base =3D (unsigned long)iomem_base  >> 32 ?
 -			0xffffffff : (unsigned)(unsigned long)iomem_base;
 -		if (put_user(base, &ss32->iomem_base) ||
 -		    convert_in_user(&ss->iomem_reg_shift,
 -		      &ss32->iomem_reg_shift) ||
 -		    convert_in_user(&ss->port_high, &ss32->port_high))
 -			return -EFAULT;
 -        }
 -        return err;
 -}
--
  #define RTC_IRQP_READ32		_IOR('p', 0x0b, compat_ulong_t)
  #define RTC_IRQP_SET32		_IOW('p', 0x0c, compat_ulong_t)
  #define RTC_EPOCH_READ32	_IOR('p', 0x0d, compat_ulong_t)

--Sig_/mwwwIutqEkPptyjt=g5VmnB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvXsfIACgkQAVBC80lX
0GyWkggAk+mGzr3YiRPXwF7N3+MwbgE4v1IyRXSBCl/CyOfHmPxjHyKZyEsBk+Fl
cV64iqSJFDLvdanIRyuivDd/AYu/9E1KcUvsmSWogkTE1ut7Sia/2fBi0+w2lbId
S0YuCUxJDwhMLRd0FR2Sk7C7yNa07EECKsS6qOsgOk7AFJvuF2twPpHnjgDCdc7S
q/xLfhgYV7J8c1QGsZhUl0tjnMtMk29XUznjcX64nCU+cfYhnei7RR/VtoYsVxbD
2s0hcZZyflLtK0cjE6r0ceEM/Mej8zwHhxyPgG4CsIU4ZFCxOLE7ST1HQvUeO8bW
wJG8UdL7jSUwS2XL4vijgcFjOT1ytQ==
=VfoC
-----END PGP SIGNATURE-----

--Sig_/mwwwIutqEkPptyjt=g5VmnB--
