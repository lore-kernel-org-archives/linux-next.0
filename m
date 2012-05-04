From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the final tree (nfs
 tree related)
Date: Fri, 4 May 2012 17:38:25 +1000
Message-ID: <20120504173825.90b41b36cf322484a136b958@canb.auug.org.au>
References: <20120504172718.738a452880ccdd61d60e33e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__4_May_2012_17_38_25_+1000_l1Cg/4xaVwYYjUlv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:38542 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751535Ab2EDHid (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 May 2012 03:38:33 -0400
In-Reply-To: <20120504172718.738a452880ccdd61d60e33e2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fred Isaman <iisaman@netapp.com>

--Signature=_Fri__4_May_2012_17_38_25_+1000_l1Cg/4xaVwYYjUlv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 4 May 2012 17:27:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the final tree, today's linux-next build (powerpc
> ppc44x_defconfig) produced these warning:

This also happens for an i386 defconfig and sparc32 defconfig ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__4_May_2012_17_38_25_+1000_l1Cg/4xaVwYYjUlv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPo4dxAAoJEECxmPOUX5FEpcMP/0zuIihsP36wgu26D8dGLOlT
oxOqUdbJEXiR9XFPQw+vTLWbCKyX4d8ndbyASmuqIYo/BpFAqX4CusrZX2VP1rSh
Km4N2YzZ+x2b5DFOkDBFmbpevwMBwuMgMk2aLeZaeWHy+n3O3WqtKk2zSwqS1myT
WwbzkIXYqlp21NYiFrKp9uSLH2AdiME9yZQ5aMDcPkeQNGFMyd02BQ3bPjytzXyT
MtWx8XW1hDKptWJ8Usguu4DNirRFje/OFlH+p+JIRaK66Klny5ouLHTe4SdcEWiz
SlCmmbaZsYozfAvEZGMQdGjcCRb1gg6DCQ+pGSORltKuALjev1z3gQdzu2US7ir1
UnrIAM5IZFvC/krznbscBck9+hmfepFhzjgCsTW+fcJJbp+cKYmWw/VWho8chcKM
gePUJp7Mxd4GHe4LTLD5RIuHE+JoVl7fUeb4/I26xG+leTgmHCqYpVWLf9ZJIvI7
QzIQyGgQMJWO/Qc4si0JlXlwzQoSU7i32y3FQUuzjxkIevMTG7PHPKJhJo0v37+v
+ZflZLy+ML8lrYt3h9LF1GWXlU0bNXO+gVDKKJP+McH0p4ChWxyMO86Z7LDnhPwt
699ErxOaDwt4eo0Cr+ZCb3I1XdDjm77501yLqGmFRf6F/q/MEb56W6hO+bC0pj8h
Oa4NGebbXtH8wqwut2R0
=y1yj
-----END PGP SIGNATURE-----

--Signature=_Fri__4_May_2012_17_38_25_+1000_l1Cg/4xaVwYYjUlv--
