From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
Date: Mon, 8 Aug 2016 19:30:57 -0400
Message-ID: <a11851f5-067e-7b6d-6121-06e597381125@redhat.com>
References: <20160808115827.6dd7fa6f@canb.auug.org.au>
 <6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
 <20160809075315.07a86b32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="A18aSWdURSMiE4duaEhHGaePo4RBm1LuQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33918 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750979AbcHHXbJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Aug 2016 19:31:09 -0400
In-Reply-To: <20160809075315.07a86b32@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Moni Shoua <monis@mellanox.com>, Kamal Heib <kamalh@mellanox.com>, Amir Vadai <amirv@mellanox.com>, Haggai Eran <haggaie@mellanox.com>, Leon Romanovsky <leon@kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--A18aSWdURSMiE4duaEhHGaePo4RBm1LuQ
Content-Type: multipart/mixed; boundary="pMqPPJkVGNS0kNWV4leRdCJgu3b6LOq2g"
From: Doug Ledford <dledford@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Moni Shoua <monis@mellanox.com>, Kamal Heib <kamalh@mellanox.com>,
 Amir Vadai <amirv@mellanox.com>, Haggai Eran <haggaie@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>
Message-ID: <a11851f5-067e-7b6d-6121-06e597381125@redhat.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
References: <20160808115827.6dd7fa6f@canb.auug.org.au>
 <6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
 <20160809075315.07a86b32@canb.auug.org.au>
In-Reply-To: <20160809075315.07a86b32@canb.auug.org.au>

--pMqPPJkVGNS0kNWV4leRdCJgu3b6LOq2g
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 8/8/2016 5:53 PM, Stephen Rothwell wrote:
> Hi Doug,
>=20
> On Mon, 8 Aug 2016 11:37:33 -0400 Doug Ledford <dledford@redhat.com> wr=
ote:
>>
>> On 8/7/2016 9:58 PM, Stephen Rothwell wrote:
>>>
>>> With Linus' tree, today's linux-next build (powerpc allyesconfig) fai=
led
>>> like this:
>>>
>>> drivers/infiniband/sw/built-in.o:(.opd+0x1698): multiple definition o=
f `copy_data'
>>> drivers/infiniband/hw/built-in.o:(.opd+0xe5f8): first defined here
>>> drivers/infiniband/sw/built-in.o:(.opd+0x1320): multiple definition o=
f `rxe_av_from_attr'
>>> drivers/infiniband/hw/built-in.o:(.opd+0xe280): first defined here =20
>>
>> This looks very suspicious.  I think you are picking up two copies of
>> the rxe code.  One from Linus tree and one from probably Leon's tree.
>=20
> Actually the second copy is from your tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/dledford/rdma.git#for-ne=
xt),
> Leon's trees are empty (relative to Linus' tree).  I guess when you
> rebased and squashed things, you forgot to reset your for-next tag, so
> I got the old version of your tree as well as the rebased version via
> Linus' tree.
>=20

Doh!  My apologies, that would certainly explain it.  I'll reset my
for-next tag.


--=20
Doug Ledford <dledford@redhat.com>
    GPG Key ID: 0E572FDD


--pMqPPJkVGNS0kNWV4leRdCJgu3b6LOq2g--

--A18aSWdURSMiE4duaEhHGaePo4RBm1LuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJXqRYxAAoJELgmozMOVy/d8EEQAL+NCj0egB2le1mkNo97jJ41
vjr9y7WcFJndEOVCgBr9eCFM1ev2IIJGYujzDrH3dgeqfxI3gZDZuM4gXzLAyE9G
tvCloIwfbMjNneOFbWk+xIY/CXzcoAQ6MM6zLQD3JpRClbRn5y+XWZn4pFh0BxfY
cxOu1Xx1IEg6izDRx2fjy2JcvfulBl7irknXXBvZ4pCNaHjReeJE0V/A5XudzHin
V8Ur+fv5Q2E36SwUE9Ozbl4hdOYAqj4CmvxvqPfDoqoHMR8vAVtTK9aDXJzSEDXu
WyqcuVQmjIvKkAepyGyRe944e4lRJH3vxkQvWRa/Js74c8jVo0wAtXVgqcp3FBz9
r6Z6WMf4fxmcjiWhmX0uWJJE1vhFGxl5T3HWzVVpupwppXu0rmsipkdBb3Z5d9OF
VFDGLcMO5zHBB2KLyYBM/N04TluOJxRHuUVGlVDCwgvkpDFdgJyyqDHdaUfR7PD4
3S+88r/5DejVY5hAZQABomJ1ZP/AcnFX/NSx5PYshgSlYXRLdQokr4kJ85vgHxTc
WZx182OYSJl5cals5SBT6dYLkShvzMg5AHofuV6FhURwU/cWWJRS0i5VRgDJ1Zzl
hNNJFSG5tXKM5jjHyWTS+oJDD762b/xJr1Qe5cvXOyV18dgOofsUNjq2KyCQ6BCQ
+fhfYTm/LkLY2T2gwmfk
=5RuT
-----END PGP SIGNATURE-----

--A18aSWdURSMiE4duaEhHGaePo4RBm1LuQ--
