Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF42421019E;
	Mon,  9 Feb 2026 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770602838; cv=none; b=uKsIHK+pmRxIwasU6hrwEEvPllO6+wNAHAzzVYKsqkQW8BbPopeTnuqofp+itF1ItYAgDZ1uvWNVL8E20Y76rePGWhpGfcZhZ8XPCtbLFQgOSYd0ZHOl6pJrYh5am8R03lyS/oYDfwekBMozv7QW8oeoNUqyW3kPyrlPaL9blhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770602838; c=relaxed/simple;
	bh=6BT4yEH8vI5HxnZmzYGHLZmNJJaezGpQBhzfGDc+VbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryiAQ/+NPlQo4EsDIio84Zgj3IaxA+wkkRbNBJGe+NEClN35x5Q69CB4jdCHW3lHY3Fm9lHhPTpcVOW6soxKze432rOnVmN7SXpKNlugj6B0QHJ0MCvQSNNz2vgY8saKc51NGXBE5fRl/SseKe0eyrg7ZxeoLlf6NKb5JtRakig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvbkKrI7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvbkKrI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02788C4CEF7;
	Mon,  9 Feb 2026 02:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770602838;
	bh=6BT4yEH8vI5HxnZmzYGHLZmNJJaezGpQBhzfGDc+VbE=;
	h=Date:From:To:Cc:Subject:From;
	b=PvbkKrI7BOnuQelSooj6OWhLiqHTewsdwfdiNmPndS+JuhDKr8yC/mNcBFL3f/pBD
	 c5ZByqjBcT0WQel15QAYj0YSjnVSLg9FPSEM0Tn16BBEEoAFrIb+xPTegx0d/PL4Z5
	 3f3hZijlMkYEr9BOq91pI0u1INdWpfI93XORr2L7jc37vx6DDdqlBh6LrnOziNt3F/
	 wo0pXWNinm+T6YrNC/1sxG8rOsxjiIhbrg6+wJtoDhc5HwJW99uatmJrlSE6qIY13r
	 M4Unewv4ir/1ZAZwQUvqBbe3JQu1RbIsTXbt51sTXua516E+TdkK9OGBWOR4W3lucE
	 WRqsK9NxJqxgg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 732FA1AC57ED; Mon, 09 Feb 2026 02:07:15 +0000 (GMT)
Date: Mon, 9 Feb 2026 02:07:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leonro@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfio tree
Message-ID: <aYlBU4l2YoT8iaBK@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2D6QphPPVQWn4mEi"
Content-Disposition: inline


--2D6QphPPVQWn4mEi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfio tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from /tmp/next/build/include/rdma/ib_addr.h:21,
                 from /tmp/next/build/include/rdma/rdma_cm.h:12,
                 from /tmp/next/build/drivers/block/rnbd/rnbd-clt-sysfs.c:2=
2:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/block/rnb=
d/rnbd-clt-sysfs.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/smack/smack.h:22,
                 from /tmp/next/build/security/smack/smack_netfilter.c:19:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/sm=
ack_netfilter.o] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/smack/smack.h:22,
                 from /tmp/next/build/security/smack/smack_access.c:13:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/sm=
ack_access.o] Error 1
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/selinux/include/avc.h:18,
                 from /tmp/next/build/security/selinux/avc.c:30:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/selinux/=
avc.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[5]: *** [/tmp/next/build/scripts/Makefile.build:546: drivers/block/rnb=
d] Error 2
make[5]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/smack/smack.h:22,
                 from /tmp/next/build/security/smack/smackfs.c:28:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/sm=
ackfs.o] Error 1
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/selinux/include/avc.h:18,
                 from /tmp/next/build/security/selinux/selinuxfs.c:41:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/selinux/=
selinuxfs.o] Error 1
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/smack/smack.h:22,
                 from /tmp/next/build/security/smack/smack_lsm.c:47:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/smack/sm=
ack_lsm.o] Error 1
make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: security/smack] E=
rror 2
make[4]: *** Waiting for unfinished jobs....
make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: drivers/block] Er=
ror 2
make[4]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/lsm_audit.c:28:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[4]: *** [/tmp/next/build/scripts/Makefile.build:289: security/lsm_audi=
t.o] Error 1
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/apparmor/include/audit.h:16,
                 from /tmp/next/build/security/apparmor/audit.c:15:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparmor=
/audit.o] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/apparmor/include/audit.h:16,
                 from /tmp/next/build/security/apparmor/include/policy.h:23,
                 from /tmp/next/build/security/apparmor/include/policy_ns.h=
:19,
                 from /tmp/next/build/security/apparmor/include/cred.h:19,
                 from /tmp/next/build/security/apparmor/capability.c:19:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparmor=
/capability.o] Error 1
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/apparmor/include/audit.h:16,
                 from /tmp/next/build/security/apparmor/task.c:19:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparmor=
/task.o] Error 1
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/selinux/include/avc.h:18,
                 from /tmp/next/build/security/selinux/hooks.c:99:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/selinux/=
hooks.o] Error 1
make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: security/selinux]=
 Error 2
In file included from /tmp/next/build/include/linux/lsm_audit.h:25,
                 from /tmp/next/build/security/apparmor/include/audit.h:16,
                 from /tmp/next/build/security/apparmor/apparmorfs.c:30:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: security/apparmor=
/apparmorfs.o] Error 1
make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: security/apparmor=
] Error 2
In file included from /tmp/next/build/net/devlink/devl_internal.h:17,
                 from /tmp/next/build/net/devlink/core.c:11:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: net/devlink/core.=
o] Error 1
make[5]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/net/devlink/devl_internal.h:17,
                 from /tmp/next/build/net/devlink/netlink.c:10:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: net/devlink/netli=
nk.o] Error 1
In file included from /tmp/next/build/net/devlink/devl_internal.h:17,
                 from /tmp/next/build/net/devlink/dev.c:10:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:289: net/devlink/dev.o=
] Error 1
make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: net/devlink] Erro=
r 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: security] Error 2
make[3]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/lib/dynamic_debug.c:40:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[4]: *** [/tmp/next/build/scripts/Makefile.build:289: lib/dynamic_debug=
=2Eo] Error 1
make[4]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/fs/smb/client/smbdirect.h:14,
                 from /tmp/next/build/fs/smb/client/cifs_debug.c:25:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/client/cif=
s_debug.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/fs/smb/client/smbdirect.h:14,
                 from /tmp/next/build/fs/smb/client/connect.c:45:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/client/con=
nect.o] Error 1
In file included from /tmp/next/build/fs/smb/client/smbdirect.h:14,
                 from /tmp/next/build/fs/smb/client/file.c:35:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/client/fil=
e.o] Error 1
make[5]: *** [/tmp/next/build/scripts/Makefile.build:546: fs/smb/client] Er=
ror 2
make[5]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/fs/smb/server/transport_rdma.c:18:
/tmp/next/build/include/rdma/ib_verbs.h:2509:37: error: 'struct dma_buf_phy=
s_vec' declared inside parameter list will not be visible outside of this d=
efinition or declaration [-Werror]
 2509 |                              struct dma_buf_phys_vec *phys_vec,
      |                                     ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: fs/smb/server/tra=
nsport_rdma.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [/tmp/next/build/scripts/Makefile.build:546: fs/smb/server] Er=
ror 2
make[4]: *** [/tmp/next/build/scripts/Makefile.build:546: fs/smb] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: lib] Error 2
make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: net] Error 2
make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: fs] Error 2
make[3]: *** [/tmp/next/build/scripts/Makefile.build:546: drivers] Error 2
make[2]: *** [/tmp/next/build/Makefile:2086: .] Error 2
make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Command exited with non-zero status 2
9192.96user 710.88system 1:31.98elapsed 10766%CPU (0avgtext+0avgdata 147662=
4maxresident)k
0inputs+0outputs (2743major+125416372minor)pagefaults 0swaps

Caused by commit

  b703b31ea8cd22 (types: reuse common phys_vec type instead of DMABUF open=
=E2=80=91coded variant)

interacting with commit:

  e6738fe6cad448 (RDMA/uverbs: Add DMABUF object type and operations)

=66rom the rdma tree.  I have reverted the latter commit (it being the new
one), really a semantic fixup should be applied - I will try to revisit
tomorrow.

--2D6QphPPVQWn4mEi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmJQVIACgkQJNaLcl1U
h9ALAwf+Iodb6aLpbK+2wEt9NcljljjUB9xGW/v+RS1nElplwW95J6z2rmW8+C88
+IVBGYSqe5gQSJXhwLydjDxz1aff7s/rrITFWVUIowMbNTUiAeCKLM0WMnTuET8Q
Cb9p50pZiK1p2Vap1FCJl3W/VuNjuRDEpnq1FQsdyZbhkZ3dwakPu6FPJTQTVnpI
o97dIP/j5Irzq/P+XRLziHU0pFUF0Yy/U80+4YltPm62XDDe1YhkBipK0NBXAtTe
ROijtAIQHRFguwHsLHKCG8M+jSst6Ejjd6XTX5zPhApAqrh766cAE+S538xK9ZO2
BBt7p075lnvtU/zrW1gjM9RHhubUyA==
=DPqz
-----END PGP SIGNATURE-----

--2D6QphPPVQWn4mEi--
