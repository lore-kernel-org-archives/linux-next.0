From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unsigned patch on the top of the nfsd tree
Date: Thu, 4 Jun 2015 07:58:36 +1000
Message-ID: <20150604075836.3bb3b4a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/igM9/NImd+6DO32oAGPFf_2"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43066 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752111AbbFCV6n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2015 17:58:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/igM9/NImd+6DO32oAGPFf_2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed that it appears that you have leaked an unsigned debugging
patch at the top of the nsfd tree today ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/igM9/NImd+6DO32oAGPFf_2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVb3iRAAoJEMDTa8Ir7ZwVNFoP/ivCg3ctfIY9oLMQ0HxQIUkm
k75s9My1ehfz7nEz1JiN7jbueBjV76FQAOsehBFEuIWy07mndWfwQBpMUkKV8sYC
OwAxYnpgasfDPQy4CDaiuyb4h4s91C9ciW/y7eWGdywb2Am+ZglYYtsoTQmc/f+d
GH0q02z1iBstPTil65IzXsvktlIv6P4ZOI5HAN/2yqvm+GpvAuqS2/Jfi7X7rfR8
EEIjt3cmuwPTIVI9m8ZgkDRAPYHciFia3HCfRwfaXgutiCqBXfuVevkQ+61iOAUf
RR5luv/ZapAUoPOjpveW9Jq3Y/hcCd2Gprq1+xrrbDNW6OldDmuqjq4Z8IZstPAr
hSksLV0Ri7RtwalQUiK7F0LN95ZpFb3FUpc1+OIMeGl/4G2mOC4bbvpb/aeGgKTB
Wo3b+/8MrFgy0NLIy1tS7MTWHrrsnSeZ07IgXlrqGvj5qA6cxqFWXNoyRtmEHwHc
pJyvswg6CTYTmOVJIfjPGy7Gbf23tDoTCRbLAUXZsfjVmjYecczXyazaQAFy9YGC
Xhx47GHqJbZA7TuPM0FyCojlCo9Pb0JI7lj61xTIlq3tmslejPeH9lfim1qiGvhu
p7i6EbPFeKDNnvzGu648/bxnW9DNYnGo6Tbx70aNBvJJilVobMuVuy4wtlfHVsXi
Z+6ySMfJGmo0qngr4Zsl
=xm7K
-----END PGP SIGNATURE-----

--Sig_/igM9/NImd+6DO32oAGPFf_2--
