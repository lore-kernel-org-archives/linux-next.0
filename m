From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb-gadget tree with the
 usb.current tree
Date: Thu, 28 May 2015 18:36:17 +1000
Message-ID: <20150528183617.432ba4f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1MQPKj=csR+3Qnk8sKCoOps"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44590 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751651AbbE1IgY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 May 2015 04:36:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felipe Balbi <balbi@ti.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, Hans de Goede <hdegoede@redhat.com>

--Sig_/1MQPKj=csR+3Qnk8sKCoOps
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Felipe,

Today's linux-next merge of the usb-gadget tree got a conflict in
drivers/usb/musb/musb_core.c between commit da96cfc13335 ("usb: musb:
fix order of conditions for assigning end point operations") from the
usb.current tree and commit 47a82730b54c ("usb: musb: Fix platform code
being unable to override ep access ops") from the usb-gadget tree.

I fixed it up (they are the same patch apart from whitespace and the
comments - I used the comments from the usb-gadget tree) and can carry
the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/1MQPKj=csR+3Qnk8sKCoOps
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZtOGAAoJEMDTa8Ir7ZwVDI8QAJOYoMMyWOfI8sPoTrxKwlLq
Eenj3OR8SSn96ydqydSkDjf+uqWgFc8RgnQ9gWVhBEMr2iDbK+9he/8nWr48FjZp
EC6E7mV1gSRriuOYxrPpzKPw4gDuxKM1CIiZfuXYs8kv2uhYPTi3GrcKsv6DaScq
HBmPNB4wmWcEcrPjnGitbLNdFaAzi4DMOzuPwKhFuE+USJ5uV7YOSPWlGf9yrzJM
zWLYV9ZIqASP2jJzXHisN5l8x9+/egcjJzCcOjEiD21XW+VbmQcprMy4b+MXzw2X
bR53HmHWT/6OzBwBASjPrGe3sKB9/TU5WOrO5Nm1aNG3uQ8FKsJK2fvFt8gV1I4C
LvPA3B9KuONqMXKuAMbHqbPvSRfmSnLwkPB7TUUKEivcHYHOCJIKu/nTWM3EnJ6G
/dqIAqkYpIRySiPM3+ZkNeG8T0vCU/j29azwah18C760g9KrYPGl+WlBdJ3TinKy
MPulstb6Kbud07VxzZeyNOWpLAyMyBwt1+9STCT5mms7gvH92ixDZPMBlWA3Qcec
KJTNkqr/2a/anc6D2GsJ1YCLr+L6qA5topFUH1YcsDVPreMGR/FpGARMaCqlvBl+
UdpCSPEN6X/NrUlbBxg6ZRzrX501bTardFPgf+gJoDlvh1fLgnOXb2w+OohqAxmg
W+rVIqJXCFiGRwjVzxfK
=Bd/1
-----END PGP SIGNATURE-----

--Sig_/1MQPKj=csR+3Qnk8sKCoOps--
