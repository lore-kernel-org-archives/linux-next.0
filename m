From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 1 Apr 2019 09:11:19 +1100
Message-ID: <20190401091119.3ac313e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4miz+nnpburOjOx=KhAFDFk"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Saeed Mahameed <saeedm@mellanox.com>, Huy Nguyen <huyn@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4miz+nnpburOjOx=KhAFDFk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/mellanox/mlx5/core/en/port_buffer.c

between commit:

  e28408e98bce ("net/mlx5e: Update xon formula")

from the net tree and commit:

  d3669ca9ff33 ("net/mlx5e: Fix port buffer function documentation format")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/mellanox/mlx5/core/en/port_buffer.c
index 4ab0d030b544,b0ce68feb0f3..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/port_buffer.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/port_buffer.c
@@@ -167,25 -165,25 +167,25 @@@ static int update_xoff_threshold(struc
  }
 =20
  /**
-  * update_buffer_lossy()
-  *   max_mtu: netdev's max_mtu
-  *   pfc_en: <input> current pfc configuration
-  *   buffer: <input> current prio to buffer mapping
-  *   xoff:   <input> xoff value
-  *   port_buffer: <output> port receive buffer configuration
-  *   change: <output>
+  *	update_buffer_lossy	- Update buffer configuration based on pfc
 - *	@mtu: device's MTU
++ *	@max_mtu: netdev's max_mtu
+  *	@pfc_en: <input> current pfc configuration
+  *	@buffer: <input> current prio to buffer mapping
+  *	@xoff:   <input> xoff value
+  *	@port_buffer: <output> port receive buffer configuration
+  *	@change: <output>
   *
-  *   Update buffer configuration based on pfc configuraiton and priority
-  *   to buffer mapping.
-  *   Buffer's lossy bit is changed to:
-  *     lossless if there is at least one PFC enabled priority mapped to t=
his buffer
-  *     lossy if all priorities mapped to this buffer are PFC disabled
+  *	Update buffer configuration based on pfc configuraiton and
+  *	priority to buffer mapping.
+  *	Buffer's lossy bit is changed to:
+  *		lossless if there is at least one PFC enabled priority
+  *		mapped to this buffer lossy if all priorities mapped to
+  *		this buffer are PFC disabled
   *
-  *   Return:
-  *     Return 0 if no error.
-  *     Set change to true if buffer configuration is modified.
+  *	@return: 0 if no error,
+  *	sets change to true if buffer configuration was modified.
   */
 -static int update_buffer_lossy(unsigned int mtu,
 +static int update_buffer_lossy(unsigned int max_mtu,
  			       u8 pfc_en, u8 *buffer, u32 xoff,
  			       struct mlx5e_port_buffer *port_buffer,
  			       bool *change)

--Sig_/4miz+nnpburOjOx=KhAFDFk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyhOwcACgkQAVBC80lX
0Gz2AQf8D9KE6qKJKKuXQBPLoXP6jApXBKTPQpiOiTEzuDXktBzaN9DfcrX4H/vu
OE6BaDVB5jz9AkTDlguYE7ylYW+ZWlZPUkigG7yvDHsOoNxjS/5nO29DBkzVZXyD
HouO0ch+AevEDVgVF+xWy97yCZD1+rDQ8Zq5G+pEn692VD68VWPr01W4cpMD0rz0
oPQeVhmzUNsr+t9Jz07pulHrzRCw0Y1JavTQYNzTQaG2keyImnfHSdalYx1Z1qHK
ERqX058CjoMutSQxS1KpPqOXfXWQirmRnEo3fisOLd4ZgkXnYaDkrtjmQuVBYu0J
BLW2P+FSVPJf9TuVT+qYLprsyRcCZQ==
=EsSp
-----END PGP SIGNATURE-----

--Sig_/4miz+nnpburOjOx=KhAFDFk--
