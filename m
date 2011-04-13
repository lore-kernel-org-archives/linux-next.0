From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net tree
Date: Wed, 13 Apr 2011 12:03:23 +1000
Message-ID: <20110413120323.36030bcf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Apr_2011_12_03_23_+1000_H_DZn3DE2uRT4Dhe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55221 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932802Ab1DMCDf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Apr 2011 22:03:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Pirko <jpirko@redhat.com>

--Signature=_Wed__13_Apr_2011_12_03_23_+1000_H_DZn3DE2uRT4Dhe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/infiniband/ulp/iser/iser_initiator.o: In function `vlan_untag':
iser_initiator.c:(.opd+0x0): multiple definition of `vlan_untag'
drivers/infiniband/ulp/iser/iser_verbs.o:iser_verbs.c:(.opd+0x0): first def=
ined here
drivers/infiniband/ulp/iser/iser_initiator.o: In function `.vlan_untag':
iser_initiator.c:(.text+0x0): multiple definition of `.vlan_untag'
drivers/infiniband/ulp/iser/iser_verbs.o:iser_verbs.c:(.text+0x0): first de=
fined here

and on and on ... (lota and lots :-()

Probably caused by commit bcc6d4790361 ("net: vlan: make non-hw-accel rx
path similar to hw-accel") which added a "non-static" inline version of
vlan_untag() to include/linux/if_vlan.h.

I have used the net tree from next-20110412 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Apr_2011_12_03_23_+1000_H_DZn3DE2uRT4Dhe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNpQRrAAoJEDMEi1NhKgbsiQAH+gME5MYnISZrQ+ELgP+Dbd5Q
hAP/vgDcMcOlOTHj02HkOyBvkiUvGytmIxdfSSPCriSW7FxhmP6c5ImV6e/KaC1t
abmFg2CzMkTx3oSp0kDRTeoi5jd5qv+9gmyJujzS7b/LL66eKHW0JnSang3PtPr3
oHm99mJzpyWnjJ1DqZt2lrGuGAbnkTE0xrx4X1tUPr1gXmydTAT6cD1cr6/5WBXt
eaVJxVFPjo/mu6cpSfrt34/byewFLNZkES6CN42oHmk+96gs0LQRJaC+e3dX4Teg
VGJH1Cx1AmM7dX4eLaqEM9jnSs3+s3tPU+uR5Wo02roNy5n4yeczcQQYapumffE=
=89rN
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Apr_2011_12_03_23_+1000_H_DZn3DE2uRT4Dhe--
