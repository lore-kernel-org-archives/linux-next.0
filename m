From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the v9fs tree
Date: Tue, 7 Apr 2015 14:05:06 +1000
Message-ID: <20150407140506.387fedcb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.G6fZPb4pFLeAkh/3kYCCvY"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58241 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750950AbbDGEFN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2015 00:05:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Eric Van Hensbergen <ericvh@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

--Sig_/.G6fZPb4pFLeAkh/3kYCCvY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
net/9p/protocol.c between commit 6250a8badb31 ("9p: use unsigned
integers for nwqid/count") from the v9fs tree and commit 3f39ef33084b
("net/9p: switch the guts of p9_client_{read,write}() to iov_iter")
from the vfs tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc net/9p/protocol.c
index 305e4789f2cc,e9d0f0c1a048..000000000000
--- a/net/9p/protocol.c
+++ b/net/9p/protocol.c
@@@ -437,23 -439,13 +439,13 @@@ p9pdu_vwritef(struct p9_fcall *pdu, in
  						 stbuf->extension, stbuf->n_uid,
  						 stbuf->n_gid, stbuf->n_muid);
  			} break;
- 		case 'D':{
- 				uint32_t count =3D va_arg(ap, uint32_t);
- 				const void *data =3D va_arg(ap, const void *);
-=20
- 				errcode =3D p9pdu_writef(pdu, proto_version, "d",
- 									count);
- 				if (!errcode && pdu_write(pdu, data, count))
- 					errcode =3D -EFAULT;
- 			}
- 			break;
- 		case 'U':{
+ 		case 'V':{
 -				int32_t count =3D va_arg(ap, int32_t);
 +				uint32_t count =3D va_arg(ap, uint32_t);
- 				const char __user *udata =3D
- 						va_arg(ap, const void __user *);
+ 				struct iov_iter *from =3D
+ 						va_arg(ap, struct iov_iter *);
  				errcode =3D p9pdu_writef(pdu, proto_version, "d",
  									count);
- 				if (!errcode && pdu_write_u(pdu, udata, count))
+ 				if (!errcode && pdu_write_u(pdu, from, count))
  					errcode =3D -EFAULT;
  			}
  			break;

--Sig_/.G6fZPb4pFLeAkh/3kYCCvY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI1d3AAoJEMDTa8Ir7ZwVLEUP/jGVNwbXQHKvLOiFIe3hMcVt
2jVEAeIKsD+TYcK9TPZGzpT39ItUERrI5NOSsKUWB6YO/MXgNRHtR+TCApVv4T6S
oseLKDm5Muq5PrwHCCeVkFMt41q2KMXJV28BeUO4iajI1BgF24VGGU1VDdyVnKFs
dUQpP5L2sJTqjIsK0/43UXsGLHTDTgtpSOPcjbi5Lv8bOGtZHdXXUp8AqDtgnoNB
7yLnmcPy+iBuEcRP11cRLYCYR67ThUg85kHIqVnKNrGAhscDB49dhRDU7LkCgzcO
mwBLV2gRmjD7hEHCEAG7nPSzD9BUBuOq3U4crFzx6oCMNKYCu8zY9Vlg7pAvQ55k
cPv8IWz9HsjEeXGxfeT31VRJaCpSeWRvUGbB2Wjwr+qhlyFv/FUaleR+K50vb9os
pBrPzGLByJ76dokuWT6kjI3mHOG98g/L09ZolcMDPcxd8TYER8AFxB9Z3mu5zqbc
1W/YUxX8Gfi03Xi24JBfK9+c1IQ9ZwhjRLniXY7TQFgKBQfJbBg+F2Ac+Lev4Duf
+3uLtmHkRFhMkUe0H9WEDp+SzebenSKhuttjGxkkWTjrGD9pl8WARRAoX5rRLnvA
cW7ucI09q2t8FNhDXYC+M6eOgvGHX3dvnuA26qrG5OTu40Ycnbu4fMgv5ewVyS/O
qHYdaLsKPw/Ia/BOn1lE
=XUxw
-----END PGP SIGNATURE-----

--Sig_/.G6fZPb4pFLeAkh/3kYCCvY--
