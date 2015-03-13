From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the virtio tree
Date: Fri, 13 Mar 2015 15:31:57 +1100
Message-ID: <20150313153157.2709e561@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SQEHmU.bmuS/fLtoPq1_v1m"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47619 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750740AbbCMEcH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Mar 2015 00:32:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/SQEHmU.bmuS/fLtoPq1_v1m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the virtio tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

net/9p/trans_virtio.c: In function 'p9_virtio_remove':
net/9p/trans_virtio.c:662:7: warning: unused variable 'inuse' [-Wunused-var=
iable]
  bool inuse;
       ^

Introduced by commit 1991755689ad ("9p/trans_virtio: fix hot-unplug").

Some of the whitespace is mucked up in that commit as well (some
leading tabs, some leading spaces)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/SQEHmU.bmuS/fLtoPq1_v1m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVAmhCAAoJEMDTa8Ir7ZwVW2MP/0hwK7ceH15ijCumY0U8h9Up
a+Si6//swyEiml26OL4GMHRv7KNBO/52ia/oJovraXkVmOSE92L5Ct7eAl14wah0
HILn2EPyrH1hXk+pth63MKNcBbyyCjqPpL+g7NpV9UMXKX470sw4hKpA/pxWyoUy
DhbdrN1Vl8GhBwds5826oXwq7HPuM1Rqq/cpBUaNn+yGGtCS9/5cqrQB7vfhIII7
KWXkofdtLX+320/HkS6qJL3/9FyTC25Q2HQXQZ4gANceLJ7hFwaIeAX+Rxnw7Zjk
bGQP0yOrsCX5W1BU5wjJ/YZG82gGIqYMJ++NB1z1t6pzdXMcIU4SjQoH2V2rZzUF
pQBqP5y8Py8YmPeHLTMhweshR2aap2l9FDtsmbiIDyVEvS8KAAKJIaUoS5s6OBfh
27V4YkPG/0bUn0iZ/LG1WTb4mX4mw7RRHrW5A3JQMZHsctwRw5+iHzWb3mmdYPoP
ac25Za2hldPhDSf18rHvJgO7Pjvn7a9Y27tnibaEsM+s1YAqs0wJe/5ZL1lH+kG+
4AZG7g23diGWXqzGDAGYpIG7pjEIVNvLcQXdl7Y68BhM07hVfni/pl5wxUDHcf+6
KmAP/rNAuMdgEQSFjcavFZWmLlyFqb5pCp3V6lv89G3iAZJBtWx9VJK/HEtUzyY8
LbHBPPaIoGPHLTGkInHU
=SKut
-----END PGP SIGNATURE-----

--Sig_/SQEHmU.bmuS/fLtoPq1_v1m--
