From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Having a linux-next feed tree based on net-next
Date: Fri, 18 May 2012 10:18:40 +1000
Message-ID: <20120518101840.21b7dab485dc5a86aa99aff3@canb.auug.org.au>
References: <4FB58AAE.4060900@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__18_May_2012_10_18_40_+1000_Z2pKKHG_9.j8tCnW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:33867 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965781Ab2ERASu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 May 2012 20:18:50 -0400
In-Reply-To: <4FB58AAE.4060900@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__18_May_2012_10_18_40_+1000_Z2pKKHG_9.j8tCnW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, 17 May 2012 19:33:02 -0400 Paul Gortmaker <paul.gortmaker@windriver=
.com> wrote:
>
> The commits for deleting the MCA support have a dependency
> on the net-next content from DaveM.  I checked your merge
> log and since you take the moduleh feed after merging the
> DaveM content, I don't think having the moduleh tree using
> a baseline from net-next should be an issue  Anyway just a
> heads up. If it causes you any grief, just drop the tree
> for today, and I'll feed those changes back in once DaveM's
> tree is merged to Linus' tree next week.

That should be fine since Dave never rebases his tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

P.S. interesting cc address :-)  (I removed the quoted bit- it looked
like this: "linux-next >> \"linux-next@vger.kernel.org\"")

--Signature=_Fri__18_May_2012_10_18_40_+1000_Z2pKKHG_9.j8tCnW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPtZVgAAoJEECxmPOUX5FEK2QP/jGwWqCQoGf3rNdoWFrfQ2wP
npNgRubOhfUcz/EE6LXiz+0X/ArOcdINOjHlHCYoSXCEBcd+dEaHYXnnWMrHEMT8
JDtMtPlVNK8I2ouh/4zOKvwNLSSbyLxbe20EaXl43ADvqXezV+X/ISR+etfrTsWT
ClOl68POqQJK5Bk/hdc0i+nmOquV+520TDT2Hw/baI4DxsUY8QoLco5VQToa/DLZ
u/KF0xYkvUijMir2ABOqwOOSr8N7kZd8IrjfN6RDIEka5Mkc5GzoCI4Xd8KV3d57
PvJ0OKZYY87OGU0W8dm5eN1k8bst+wlfeR8KDyyQKz7/9obRD8DZ+pvfnOyhCTtV
zinC1hxW6LqFG4T+svVfPh7etv7C/aZP2L4kqHKu+8gvGImw3IK+rDVgnq1dI6ZE
PgzzPR9h53+BqLki9+viWFwVfjxvTP2dikcJjnzAb+gU4p1XA099ObVag8t6u6pt
/ZYQuM5xwZs2vSw8OLyg0U2cInMifCpB4ZaKZInkMkqeab1ZkLrAd/IIos2uzy/z
UoAOmqI3Z89x3PppSr7EA4Wh18pEFIjDmMTH4iGfoBzIpQhimiKZO2CtNlul2qjX
tF8JJjoAVfCKGQSmh1FjbaF70xy9SDQJTqpZQNL5/baqG3AMKODFD8Fp3tbai/mt
Ar/hePKLUhwOh9vXjgX3
=6X3y
-----END PGP SIGNATURE-----

--Signature=_Fri__18_May_2012_10_18_40_+1000_Z2pKKHG_9.j8tCnW--
