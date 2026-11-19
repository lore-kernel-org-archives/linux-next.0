Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103159;
	b=V40H9BGnQmFFoGfzENDFJQje4GzAdp8fJpl7OFz0AL+7OIkibjWD7Wfpm7Hg35PvpTFD
	 gIvm3+U5IhlpnRCJ1AwQLpyGYwKmhuZNgPS/CzWO767uStjX2pTyvqMlVDk2biDEPUvG2
	 pyOUa7h3UPciE/xgxUhmZJ//814z8ZEzpDKdEOuXuOoVT0w+cEEeFoltg3wh0/eEoNi/H
	 EuTiW76wzqTaRNKZNH80Cc9JIjWJPas6z+CUwIpPrBN9oE/FJ88f0jSQfJMdTlZ4NAbvz
	 dew8IvguleHDxnO8t1cyDqB/ixS9N3iwXUWE8zqP2jTp8vxegvxKcUc4Yf0KTucUkpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103159;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=E3GsbOm3z4AqroqV/zkAUbLMtislNxnWZm+gFTPcy8U=;
	b=kTbtFXJN9vhghzZp+gGLlk3n3v8Oij722BYGKNWuFvXHPvPMxElmj9MAwrGl/tSj52CD
	 3Zn4M3BWuZ3O7SGvftWYkNqKeARSI7GEkJckzutYwft3noNhHOH86UvUHRKP2/s9MLF0V
	 /pgURCdhYaU9WmOyirKuVrz8IEBxDq+Kgwikj+3Z9aYnfmX80V15kCnI2apcbNklEEdmZ
	 sduG/ntp6as0OMHFnQjHlBECgdpnQJTtbh5qblwWl8pb4Tu4t4/5NypX0t3m9gtQitN9h
	 gz1zEjJBxQaf+7j2z/a0/oo/cDyWbKNNGJ33l5rUXPxhG9hSAI+EG/aC6+xmstfKKgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEw95DQu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDAB606A325;
	Thu, 19 Nov 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEw95DQu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA931F000C4;
	Thu, 19 Nov 2026 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103159;
	bh=E3GsbOm3z4AqroqV/zkAUbLMtislNxnWZm+gFTPcy8U=;
	h=Date:From:To:Cc:Subject;
	b=GEw95DQu3bEX/X85OCiUVTBahkFXwasaMKlFZ/ftBd1gP/976tiq8vA8+qDgTFs63
	 ary8+5WllR7B/PhH6XOcP4ZbSMPNtmjv6obXSYf5NSXIVT+RflhzGcYDnSP1tp4o+q
	 6fMsq8HtY5X58vfBVbprZHbNSYm+afz3lEiZftUuyqgvvF+nZm1i+Yu/W1/p0p6hBF
	 kbYqR4jIXZFmle05+I314zg5i+WQU+OvzyNk5H0gPAnVhoOto6oOhljRNkKej+5Evc
	 E3ZLT29xKezRwQs49U1fECqfgT63xOKgbjnVOxMGE56e+xyn+xpffrczcndYYFtzqz
	 NNvc5YIlrl/LQ==
Date: Thu, 19 Nov 2026 15:45:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	Yong Liu <pkfxxxing@gmail.com>
Subject: linux-next: manual merge of the rdma tree with the rdma-fixes tree
Message-ID: <av8ZsxX4IWmJDOPG@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L0gJCgPgHGacupCD"
Content-Disposition: inline


--L0gJCgPgHGacupCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got conflicts in:

  drivers/infiniband/ulp/srpt/ib_srpt.h
  drivers/infiniband/ulp/srpt/ib_srpt.c

between commits:

  82d46dedf750a ("RDMA/srpt: bound the indirect descriptor table to the IU")
  013eb66a8ef25 ("RDMA/srpt: widen the indirect RDMA context counters")

=66rom the rdma-fixes tree and commit:

  317128ea4f21c ("RDMA/srpt: Prevent uninitialized read buffer disclosure")

=66rom the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/infiniband/ulp/srpt/ib_srpt.c
index a2af0882eff5a,fc530ddf489ce..0000000000000
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@@ -1121,9 -1115,10 +1121,11 @@@ static int srpt_get_desc_tbl(struct srp
  	} else if (((srp_cmd->buf_fmt & 0xf) =3D=3D SRP_DATA_DESC_INDIRECT) ||
  		   ((srp_cmd->buf_fmt >> 4) =3D=3D SRP_DATA_DESC_INDIRECT)) {
  		struct srp_indirect_buf *idb =3D srpt_get_desc_buf(srp_cmd);
+ 		u64 total_len =3D 0;
  		int nbufs =3D be32_to_cpu(idb->table_desc.len) /
  				sizeof(struct srp_direct_buf);
 +		size_t desc_off =3D (uintptr_t)idb - (uintptr_t)srp_cmd;
+ 		int i;
 =20
  		if (nbufs >
  		    (srp_cmd->data_out_desc_cnt + srp_cmd->data_in_desc_cnt)) {
@@@ -1135,18 -1130,14 +1137,26 @@@
  			return -EINVAL;
  		}
 =20
 +		if (nbufs =3D=3D 0) {
 +			pr_err("received SRP_CMD with an empty indirect descriptor table\n");
 +			return -EINVAL;
 +		}
 +
 +		if (desc_off + struct_size(idb, desc_list, nbufs) >
 +		    recv_ioctx->byte_len) {
 +			pr_err("received SRP_CMD indirect table (%d descriptors) that does not=
 fit the %d-byte IU\n",
 +			       nbufs, recv_ioctx->byte_len);
 +			return -EINVAL;
 +		}
 +
+ 		for (i =3D 0; i < nbufs; i++)
+ 			total_len +=3D be32_to_cpu(idb->desc_list[i].len);
+ 		if (total_len !=3D be32_to_cpu(idb->len)) {
+ 			pr_err("SRP descriptor lengths total %llu does not match advertised le=
ngth %u\n",
+ 			       total_len, be32_to_cpu(idb->len));
+ 			return -EINVAL;
+ 		}
+=20
  		*data_len =3D be32_to_cpu(idb->len);
  		return srpt_alloc_rw_ctxs(ioctx, idb->desc_list, nbufs,
  				sg, sg_cnt);
diff --cc drivers/infiniband/ulp/srpt/ib_srpt.h
index d9061aa65c1a8,78bba741489ec..0000000000000
--- a/drivers/infiniband/ulp/srpt/ib_srpt.h
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.h
@@@ -223,8 -224,9 +224,9 @@@ struct srpt_send_ioctx=20
  	struct ib_cqe		rdma_cqe;
  	enum srpt_command_state	state;
  	struct se_cmd		cmd;
+ 	u32			buf_len;
 -	u8			n_rdma;
 -	u8			n_rw_ctx;
 +	int			n_rdma;
 +	int			n_rw_ctx;
  	bool			queue_status_only;
  	u8			sense_data[TRANSPORT_SENSE_BUFFER];
  };

--L0gJCgPgHGacupCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/GbIACgkQJNaLcl1U
h9Danwf7BoXnUHQeE/xQf8+E41AsJoP2HDj9QWbD7dNHuwinYw3lGdPVHqEu1yff
IMqXJwEUDKOmuieJazVZ8iiYAKXr4m2JHmWdP/iFa0VhE+X9i8sGwSFHlISEz1hR
kEMxbPXZhzs+qM3EDKz7RmzH45uyMs7RsWOsgJ2IthsSqC7RoqhgUUfWJVP/hl9a
kHhNnPZ5UlFYNmKIqJH41pZ0lFN3GZAlCzy9Jmvc/KSa3dWQhpaRW38z7FD5XwDT
A2PcURXAnVhN+2lk6ygpBLBK2+YFM9OOJ+XLeW1lY2oLu13DBBzTj76U38afa9gq
JjX2VBPmJqQQe6I3GGC5IDvaRhwIQA==
=Mm24
-----END PGP SIGNATURE-----

--L0gJCgPgHGacupCD--
