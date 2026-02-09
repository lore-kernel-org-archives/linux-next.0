Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F139242D6C;
	Mon,  9 Feb 2026 02:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770604927; cv=none; b=iLmTVJd0jY1kknTmARV+ZReye0TgDXg7Tb99DP05AxMBV2PEL6ia3ZV/KVCtUuDjG5MHWCwCyuceeG6aDlmsARjnQQNh/ws1UzioZicS0pJIaRxk933+9e+GdGMrtvA2ZPnHoxIFUON/5fEA+nk6/0GWVnqT4NvfLolmujd2dbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770604927; c=relaxed/simple;
	bh=6yAWDe/F+I9TWqpUXa6hdnPFTrIA9a9Gl2PEl1OrXTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3VHlaiG48uWZrDDUO2lNuDMYdMDgFCTTVLcJH67Ltw+Zv41vjCG3Q/+N+wSia4X3j8DgvQq1nBEnqijq+AYXDUvF+6WwG1LDi1z74+2UgmKjOnQdQ4DMJNKJAfPgUQFOlz+xo55ZwQneFLLzfWfoJwUdpB4h4MFqUTcxIbyqoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7V4bE8w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7V4bE8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A0AC4CEF7;
	Mon,  9 Feb 2026 02:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770604926;
	bh=6yAWDe/F+I9TWqpUXa6hdnPFTrIA9a9Gl2PEl1OrXTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7V4bE8wQuVDbOxZCEhB7sYrhvaP7bjRx3MjGGKi7BR7Gpd+tdvPNA2sQrbE/9S7D
	 E/HOZmEcsa27di8n4fCdpAb3YrNvcduGkbMy1ELQCRpl/gefAxmG6G3494nsRcYDOC
	 NJDS1K5gn7umH4t3uXW9GWqmMWBqJcxQbx51EvIZ9GgYXT2P98M2XBvW+cwi4Hp1u6
	 TLnTU9M7f9ii8rhfAv4aInK3XpncMWSBIMnAjrKN5AhVSllQ7U992A0Ej4ND6cy6Zn
	 uKqrYuGbL2/r06scOie+gntK/H8JV/RiaGHqXDLNM3OdQxvL1cAOf/TalFhEZimSWy
	 MAW+ypAPODHiw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D03551AC57ED; Mon, 09 Feb 2026 02:42:03 +0000 (GMT)
Date: Mon, 9 Feb 2026 02:42:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leonro@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yishai Hadas <yishaih@nvidia.com>,
	Edward Srouji <edwards@nvidia.com>
Subject: Re: linux-next: build failure after merge of the vfio tree
Message-ID: <aYlJe1XKAd2MhEZE@sirena.co.uk>
References: <aYlBU4l2YoT8iaBK@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="85TVz89J1ZYzPbJk"
Content-Disposition: inline
In-Reply-To: <aYlBU4l2YoT8iaBK@sirena.co.uk>
X-Cookie: Think big.  Pollute the Mississippi.


--85TVz89J1ZYzPbJk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2026 at 02:07:15AM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the vfio tree, today's linux-next build (x86_64 allmodconfi=
g)
> failed like this:
>=20
> In file included from /tmp/next/build/include/rdma/ib_addr.h:21,
>                  from /tmp/next/build/include/rdma/rdma_cm.h:12,
>                  from /tmp/next/build/drivers/block/rnbd/rnbd-clt-sysfs.c=
:22:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/block/r=
nbd/rnbd-clt-sysfs.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/smack/smack.h:22,
>                  from /tmp/next/build/security/smack/smack_netfilter.c:19:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/=
smack_netfilter.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/smack/smack.h:22,
>                  from /tmp/next/build/security/smack/smack_access.c:13:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/=
smack_access.o] Error 1
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/selinux/include/avc.h:18,
>                  from /tmp/next/build/security/selinux/avc.c:30:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/selinu=
x/avc.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:546: drivers/block/r=
nbd] Error 2
> make[5]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/smack/smack.h:22,
>                  from /tmp/next/build/security/smack/smackfs.c:28:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/=
smackfs.o] Error 1
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/selinux/include/avc.h:18,
>                  from /tmp/next/build/security/selinux/selinuxfs.c:41:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/selinu=
x/selinuxfs.o] Error 1
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/smack/smack.h:22,
>                  from /tmp/next/build/security/smack/smack_lsm.c:47:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/=
smack_lsm.o] Error 1
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: security/smack]=
 Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: drivers/block] =
Error 2
> make[4]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/lsm_audit.c:28:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:289: security/lsm_au=
dit.o] Error 1
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/apparmor/include/audit.h:1=
6,
>                  from /tmp/next/build/security/apparmor/audit.c:15:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparm=
or/audit.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/apparmor/include/audit.h:1=
6,
>                  from /tmp/next/build/security/apparmor/include/policy.h:=
23,
>                  from /tmp/next/build/security/apparmor/include/policy_ns=
=2Eh:19,
>                  from /tmp/next/build/security/apparmor/include/cred.h:19,
>                  from /tmp/next/build/security/apparmor/capability.c:19:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparm=
or/capability.o] Error 1
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/apparmor/include/audit.h:1=
6,
>                  from /tmp/next/build/security/apparmor/task.c:19:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparm=
or/task.o] Error 1
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/selinux/include/avc.h:18,
>                  from /tmp/next/build/security/selinux/hooks.c:99:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/selinu=
x/hooks.o] Error 1
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: security/selinu=
x] Error 2
> In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
>                  from /tmp/next/build/security/apparmor/include/audit.h:1=
6,
>                  from /tmp/next/build/security/apparmor/apparmorfs.c:30:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparm=
or/apparmorfs.o] Error 1
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: security/apparm=
or] Error 2
> In file included from /tmp/next/build/net/devlink/devl_internal.h:17,
>                  from /tmp/next/build/net/devlink/core.c:11:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: net/devlink/cor=
e.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/net/devlink/devl_internal.h:17,
>                  from /tmp/next/build/net/devlink/netlink.c:10:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: net/devlink/net=
link.o] Error 1
> In file included from /tmp/next/build/net/devlink/devl_internal.h:17,
>                  from /tmp/next/build/net/devlink/dev.c:10:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: net/devlink/dev=
=2Eo] Error 1
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: net/devlink] Er=
ror 2
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: security] Error=
 2
> make[3]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/lib/dynamic_debug.c:40:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:289: lib/dynamic_deb=
ug.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/fs/smb/client/smbdirect.h:14,
>                  from /tmp/next/build/fs/smb/client/cifs_debug.c:25:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/client/c=
ifs_debug.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/fs/smb/client/smbdirect.h:14,
>                  from /tmp/next/build/fs/smb/client/connect.c:45:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/client/c=
onnect.o] Error 1
> In file included from /tmp/next/build/fs/smb/client/smbdirect.h:14,
>                  from /tmp/next/build/fs/smb/client/file.c:35:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/client/f=
ile.o] Error 1
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:546: fs/smb/client] =
Error 2
> make[5]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/fs/smb/server/transport_rdma.c:18:
> /tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_p=
hys_vec' declared inside parameter list will not be visible outside of this=
 definition or declaration [-Werror]
>  2509 |                              struct dma_buf_phys_vec *phys_vec,
>       |                                     ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/server/t=
ransport_rdma.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
> make[5]: *** [/tmp/next/build/scripts/Makefile.build:546: fs/smb/server] =
Error 2
> make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: fs/smb] Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: lib] Error 2
> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: net] Error 2
> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: fs] Error 2
> make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: drivers] Error 2
> make[2]: *** [/tmp/next/build/Makefile:2086: .] Error 2
> make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> Command exited with non-zero status 2
> 9192.96user 710.88system 1:31.98elapsed 10766%CPU (0avgtext+0avgdata 1476=
624maxresident)k
> 0inputs+0outputs (2743major+125416372minor)pagefaults 0swaps
>=20
> Caused by commit
>=20
>   b703b31ea8cd22 (types: reuse common phys_vec type instead of DMABUF ope=
n=E2=80=91coded variant)
>=20
> interacting with commit:
>=20
>   e6738fe6cad448 (RDMA/uverbs: Add DMABUF object type and operations)
>=20
> from the rdma tree.  I have reverted the latter commit (it being the new
> one), really a semantic fixup should be applied - I will try to revisit
> tomorrow.

Actually, no - just no -next today since stuff seems to go wrong with
that revert.  I will try again tomorrow.

--85TVz89J1ZYzPbJk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmJSXsACgkQJNaLcl1U
h9AzaAf2OFQPGsObCpiwTOy+hMy3GScHrWzHJ3snbXBv+u5BQJe999Ufvyzuzw89
GSOyEdKU6/ZmClxT0mVYl4WzC0lMTcv6X8VdeAc+dLSNS9rspdxKziZ03Ej7uzEo
vdHysp+2qJk6FF6EFycNwymiibhZQPU+aJFXOC+EMlMcpKZfUv36wHJhwVhzCkqa
UWS47dv88AhQbhtXg71BQ9EVUTEFN35ezEQ2A9dJpnYPp1s8SZpSi7+t6yFPNDo0
3eD3UDbZAjsyT6USv38lK+QPY/ZJVIUAuUwx7XyEhVgZjfZVS3QYQ6TNpBI6HN1/
quDhQMDUVJp9mcLODqylumGMYa2P
=pKcv
-----END PGP SIGNATURE-----

--85TVz89J1ZYzPbJk--
