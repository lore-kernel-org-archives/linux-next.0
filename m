From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree
Date: Mon, 20 Oct 2008 15:00:51 +1100
Message-ID: <20081020150051.3a3f751f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Oct_2008_15_00_51_+1100_xKQH/aui4MuvUkBr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56161 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750703AbYJTEBD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 00:01:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@enix.org>

--Signature=_Mon__20_Oct_2008_15_00_51_+1100_xKQH/aui4MuvUkBr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

Today's linux-next merge of the pci tree got a conflict in
drivers/pci/quirks.c between commit
2e532d68a2b3e2aa6b19731501222069735c741c ("{pci,pnp} quirks.c: don't use
deprecated print_fn_descriptor_symbol()") from Linus' tree and commit
9a1e6932e1129d0c6b5f06ea39282b21f892a114 ("PCI: allow quirks to be
compiled out") from the pci tree.

The former commit (which matches commit
248cb30af8bd95f1af95d54c0a9558dc2ac62a55 ("PCI: use %pF instead of
print_fn_descriptor_symbol() in quirks.c") in the pci tree) updates code
that was moved by the latter.  Since the pci tree also does that update,
I just used the pci tree version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Oct_2008_15_00_51_+1100_xKQH/aui4MuvUkBr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj8AnMACgkQjjKRsyhoI8x13gCfdEL74l0pVfa8gzO7YWth8VdV
weIAn0yI7n1HrS4UbJ0fO6PzMJNppAcl
=ibb0
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Oct_2008_15_00_51_+1100_xKQH/aui4MuvUkBr--
