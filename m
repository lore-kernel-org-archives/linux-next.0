From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ceph tree
Date: Mon, 29 Oct 2018 12:16:39 +1100
Message-ID: <20181029121639.738ab89c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4LK0Sc4kxDH7alXOXPPpFP_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Sage Weil <sage@newdream.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Yan, Zheng" <zyan@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4LK0Sc4kxDH7alXOXPPpFP_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/ceph/file.c

between commit:

  fce7a9744bdf ("ceph: refactor ceph_sync_read()")

from the ceph tree and commit:

  00e23707442a ("iov_iter: Use accessor function")

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

diff --cc fs/ceph/file.c
index f788496fafcc,5dd433aa9b23..000000000000
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@@ -594,103 -658,48 +594,103 @@@ static ssize_t ceph_sync_read(struct ki
  	if (ret < 0)
  		return ret;
 =20
 -	if (unlikely(iov_iter_is_pipe(to))) {
 +	ret =3D 0;
 +	while ((len =3D iov_iter_count(to)) > 0) {
 +		struct ceph_osd_request *req;
 +		struct page **pages;
 +		int num_pages;
  		size_t page_off;
 -		ret =3D iov_iter_get_pages_alloc(to, &pages, len,
 -					       &page_off);
 -		if (ret <=3D 0)
 -			return -ENOMEM;
 -		num_pages =3D DIV_ROUND_UP(ret + page_off, PAGE_SIZE);
 +		u64 i_size;
 +		bool more;
 +
 +		req =3D ceph_osdc_new_request(osdc, &ci->i_layout,
 +					ci->i_vino, off, &len, 0, 1,
 +					CEPH_OSD_OP_READ, CEPH_OSD_FLAG_READ,
 +					NULL, ci->i_truncate_seq,
 +					ci->i_truncate_size, false);
 +		if (IS_ERR(req)) {
 +			ret =3D PTR_ERR(req);
 +			break;
 +		}
 +
 +		more =3D len < iov_iter_count(to);
 =20
- 		if (unlikely(to->type & ITER_PIPE)) {
 -		ret =3D striped_read(inode, off, ret, pages, num_pages,
 -				   page_off, checkeof);
 -		if (ret > 0) {
 -			iov_iter_advance(to, ret);
 -			off +=3D ret;
++		if (unlikely(iov_iter_is_pipe(to))) {
 +			ret =3D iov_iter_get_pages_alloc(to, &pages, len,
 +						       &page_off);
 +			if (ret <=3D 0) {
 +				ceph_osdc_put_request(req);
 +				ret =3D -ENOMEM;
 +				break;
 +			}
 +			num_pages =3D DIV_ROUND_UP(ret + page_off, PAGE_SIZE);
 +			if (ret < len) {
 +				len =3D ret;
 +				osd_req_op_extent_update(req, 0, len);
 +				more =3D false;
 +			}
  		} else {
 -			iov_iter_advance(to, 0);
 +			num_pages =3D calc_pages_for(off, len);
 +			page_off =3D off & ~PAGE_MASK;
 +			pages =3D ceph_alloc_page_vector(num_pages, GFP_KERNEL);
 +			if (IS_ERR(pages)) {
 +				ceph_osdc_put_request(req);
 +				ret =3D PTR_ERR(pages);
 +				break;
 +			}
  		}
 -		ceph_put_page_vector(pages, num_pages, false);
 -	} else {
 -		num_pages =3D calc_pages_for(off, len);
 -		pages =3D ceph_alloc_page_vector(num_pages, GFP_KERNEL);
 -		if (IS_ERR(pages))
 -			return PTR_ERR(pages);
 -
 -		ret =3D striped_read(inode, off, len, pages, num_pages,
 -				   (off & ~PAGE_MASK), checkeof);
 -		if (ret > 0) {
 -			int l, k =3D 0;
 -			size_t left =3D ret;
 -
 -			while (left) {
 -				size_t page_off =3D off & ~PAGE_MASK;
 -				size_t copy =3D min_t(size_t, left,
 -						    PAGE_SIZE - page_off);
 -				l =3D copy_page_to_iter(pages[k++], page_off,
 -						      copy, to);
 -				off +=3D l;
 -				left -=3D l;
 -				if (l < copy)
 +
 +		osd_req_op_extent_osd_data_pages(req, 0, pages, len, page_off,
 +						 false, false);
 +		ret =3D ceph_osdc_start_request(osdc, req, false);
 +		if (!ret)
 +			ret =3D ceph_osdc_wait_request(osdc, req);
 +		ceph_osdc_put_request(req);
 +
 +		i_size =3D i_size_read(inode);
 +		dout("sync_read %llu~%llu got %zd i_size %llu%s\n",
 +		     off, len, ret, i_size, (more ? " MORE" : ""));
 +
 +		if (ret =3D=3D -ENOENT)
 +			ret =3D 0;
 +		if (ret >=3D 0 && ret < len && (off + ret < i_size)) {
 +			int zlen =3D min(len - ret, i_size - off - ret);
 +			int zoff =3D page_off + ret;
 +			dout("sync_read zero gap %llu~%llu\n",
 +                             off + ret, off + ret + zlen);
 +			ceph_zero_page_vector_range(zoff, zlen, pages);
 +			ret +=3D zlen;
 +		}
 +
- 		if (unlikely(to->type & ITER_PIPE)) {
++		if (unlikely(iov_iter_is_pipe(to))) {
 +			if (ret > 0) {
 +				iov_iter_advance(to, ret);
 +				off +=3D ret;
 +			} else {
 +				iov_iter_advance(to, 0);
 +			}
 +			ceph_put_page_vector(pages, num_pages, false);
 +		} else {
 +			int idx =3D 0;
 +			size_t left =3D ret > 0 ? ret : 0;
 +			while (left > 0) {
 +				size_t len, copied;
 +				page_off =3D off & ~PAGE_MASK;
 +				len =3D min_t(size_t, left, PAGE_SIZE - page_off);
 +				copied =3D copy_page_to_iter(pages[idx++],
 +							   page_off, len, to);
 +				off +=3D copied;
 +				left -=3D copied;
 +				if (copied < len) {
 +					ret =3D -EFAULT;
  					break;
 +				}
  			}
 +			ceph_release_page_vector(pages, num_pages);
  		}
 -		ceph_release_page_vector(pages, num_pages);
 +
 +		if (ret <=3D 0 || off >=3D i_size || !more)
 +			break;
  	}
 =20
  	if (off > iocb->ki_pos) {

--Sig_/4LK0Sc4kxDH7alXOXPPpFP_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWX3cACgkQAVBC80lX
0GzSDAgAggmOC9bz+ffXKkALC+f5kNx0MXl0IlnkXM7vC+QE5ucoLna4Zy3Kmc8a
SuQuDE1lF7y95e1tWvMQT0N3eSsRYHuNB+4wLpyaD5DlD+A0fUbNszWOyEebaIwH
TGTTd4i2hkUoqfqnqtnnQdfTWHEyAMFBFMW+c/L4qsXpPYvCC0pxzsNtRnoeyiJN
Gdg2iL/nCyTVdPCFG7qhiOjoEHjnMplX3X6p51rJxFK8gTgJBGt9FOstuxp+ahCG
xtwdjB4pZ2BLQLfbTGgOcmXPoBeVMls4HcgxX1EURMQtRNqu/F0I1GdmSY5g8D1x
o7K0KfbbKOn4AevJH4qKoyMB4FwJlA==
=U/Hs
-----END PGP SIGNATURE-----

--Sig_/4LK0Sc4kxDH7alXOXPPpFP_--
