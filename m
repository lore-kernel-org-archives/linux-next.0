From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nvdimm tree
Date: Mon, 9 Apr 2018 13:16:19 +1000
Message-ID: <20180409131619.0bc5fb45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5hwoHcGrw4QE8IXDvwO3B+y"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5hwoHcGrw4QE8IXDvwO3B+y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

After merging the nvdimm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "of_node_to_nid" [drivers/nvdimm/of_pmem.ko] undefined!

Caused by commit

  717197608952 ("libnvdimm: Add device-tree based driver")

X86 seems to not have a version of of_node_to_nid() even though CONFIG_OF
and CONFIG_NUMA are both 'y' in this build.

I have used the nvdimm tree from next-20180406 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/5hwoHcGrw4QE8IXDvwO3B+y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrK2wQACgkQAVBC80lX
0GyZoQf+KEOKWub2lWSqItFYQpcFmrCVWdp/5A+I3QG4GTZvq1e1MDVmgZVcgOS8
uRlkOMLWBiHVDeP2vH//UraJiMc+8kEFNNUKVQ7waEdZeBZ8ocidZVobQ4CghAL+
1DbbBNwoGaDB6fAR5UfYEboz6mtGnR65bS0jbLyyHs3jLEiKjlWgQAE80aaHB5Ts
aWoIKefZGolth+lxkH5z1dzMDc141pzTfCwI6XwjVtN+lXQ1SavGFW/kzSI47roK
MFXf7qkL+qjGjXDwJ0FEvB4XiAECpWYHOI0FqLg0P/IKVx5fx8gc8VwXUF2oVmuF
D5ey9piew20WD2BW07c2NJKlB4bnZA==
=E15y
-----END PGP SIGNATURE-----

--Sig_/5hwoHcGrw4QE8IXDvwO3B+y--
