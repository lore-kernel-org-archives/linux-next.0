From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the virtio tree
Date: Wed, 18 Mar 2015 12:47:34 +1100
Message-ID: <20150318124734.629c0954@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/30TbwrL9JmdlnmWgxWax4UP"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49048 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753598AbbCRBrl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2015 21:47:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

--Sig_/30TbwrL9JmdlnmWgxWax4UP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the virtio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/virtio/virtio_mmio.c:250:12: error: redefinition of 'vm_generation'
 static u32 vm_generation(struct virtio_device *vdev)
            ^
drivers/virtio/virtio_mmio.c:240:12: note: previous definition of 'vm_gener=
ation' was here
 static u32 vm_generation(struct virtio_device *vdev)
            ^

Caused by the bad merge of commits 87e7bf1450c9 ("virtio_mmio:
generation support") from Linus' tree and cf02b2c2d1a1 ("virtio_mmio:
generation support") from the virtio tree.

I fixed it up by removing the second version of that function.

Could the virtio tree should be cleaned up to match what was sent to
Linus, please?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/30TbwrL9JmdlnmWgxWax4UP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCNk8AAoJEMDTa8Ir7ZwVaLwP/2BGa83+n00AQASrKhTj1ccU
MXjGacg0XEf7CpZ7Yk940W+xx23C8V6RG/dPuCvLj6PbJeZQTsB/piNwm+TS8Lkc
EkvwoFBedZbdU3viD0XUc0f/5P1tIBTfO4Xvpx0JJPd0E77HlQAC1p4A+xj+fEAF
FX8l9Kec08yYfUNTIqCVeQGG5t86P+fIy2BrYpUdNh+z7+SHK1fQBgEoTkq6JDjm
+6mZqOWTIq15hMfuO9syPf/7qeGs7HrV4O2RMcYxkjNIUgt6ldwHTix2G04tNbWV
KFIkeLJKd3Uu2hSlt1QP060ShXLwzJiHD3zBXpLcp6n57aZyo+u8l3XY5fKJa3ly
NdemFNUM+/rX+NNtQN0NP8Tb2qXSQDnTOHcKkQDaREZ6Osea02kUyEZATeTrCFNX
+4G5f2HndoY38ki1v60V9NUgDOgYvEgctJVLlWsPWaDHJsXB3qOTSOTNj5tNDiRR
DFGfnS1/Se+voQ4P+ugczGN51b/8sZ9Yfwz2qdQ60W8NS76VTLuA3Npg9Cp/0Onw
mobjMP2v+cOdsRnm5SCh2Qhj9YCyMwIHM+upHyw+LsL3pcvCXlklpF4Pisoeahtl
CiFNuxDCcJpvDAd/HIsV3A7iWRNcD1jGJ2AbkQsVTn+t1Aen8duQuN0NoMHQjPMo
SXmc/uqYFUviK863Wes8
=otG/
-----END PGP SIGNATURE-----

--Sig_/30TbwrL9JmdlnmWgxWax4UP--
