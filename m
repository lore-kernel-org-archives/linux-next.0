From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma-leon tree
Date: Fri, 13 May 2016 13:09:23 -0400
Message-ID: <65242a2a-70c5-496f-295f-c1974a94b57c@redhat.com>
References: <20160513100807.05177f21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CRhx6TIIHk38459CB2XOnu4rWvJgJ4FDr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52680 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753129AbcEMRJZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 May 2016 13:09:25 -0400
In-Reply-To: <20160513100807.05177f21@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Leon Romanovsky <leon@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CRhx6TIIHk38459CB2XOnu4rWvJgJ4FDr
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 05/12/2016 08:08 PM, Stephen Rothwell wrote:
> Hi Leon,
>=20
> After merging the rdma-leon tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> ERROR: ".rdma_addr_size" [drivers/infiniband/core/rdma_ucm.ko] undefine=
d!
> ERROR: ".rdma_addr_register_client" [drivers/infiniband/core/rdma_cm.ko=
] undefined!
> ERROR: ".rdma_addr_size" [drivers/infiniband/core/rdma_cm.ko] undefined=
!
> ERROR: ".rdma_addr_unregister_client" [drivers/infiniband/core/rdma_cm.=
ko] undefined!
> ERROR: ".rdma_translate_ip" [drivers/infiniband/core/rdma_cm.ko] undefi=
ned!
> ERROR: ".rdma_copy_addr" [drivers/infiniband/core/rdma_cm.ko] undefined=
!
> ERROR: ".rdma_resolve_ip" [drivers/infiniband/core/rdma_cm.ko] undefine=
d!
> ERROR: ".rdma_addr_cancel" [drivers/infiniband/core/rdma_cm.ko] undefin=
ed!
> ERROR: ".rdma_resolve_ip_route" [drivers/infiniband/core/ib_sa.ko] unde=
fined!
> ERROR: ".addr_init" [drivers/infiniband/core/ib_core.ko] undefined!
> ERROR: ".rdma_addr_find_l2_eth_by_grh" [drivers/infiniband/core/ib_core=
=2Eko] undefined!
> ERROR: ".addr_cleanup" [drivers/infiniband/core/ib_core.ko] undefined!
>=20
> I don't know what has caused this,

This was, I think, a botched merge between a fix in Leon's
topic/fix-core and topic/rdma-rw-api, but I could be wrong.

> but the rdma-leon tree shares a lot
> of patches (but not commits) with the rdma tree and so needs to be
> cleaned up. Please sort out your work flow.

This is an entirely separate issue.  Leon based all of his topic
branches on Linus' 4.6-rc7.  Even though I already have my initial
for-next tag available (it's based on 4.6-rc6 + my k.o/for-4.6-rc branch
to pick up a few commits that were after 4.6-rc6) and it has a number of
already commited for 4.7 patches on it.  He then committed a bunch of
those same patches in his topic branches and then merged them together
to make the branch you pulled.  That is an entirely broken workflow.  He
must base his topic branches, and his final branch, on my for-next tag
and that way exclude the patches I've already taken from the ones he is
testing.  I'm not sure he's aware of that, but as of this email, he
certainly is now.

> I have dropped the rdma-leon tree for today.
>=20


--=20
Doug Ledford <dledford@redhat.com>
              GPG KeyID: 0E572FDD



--CRhx6TIIHk38459CB2XOnu4rWvJgJ4FDr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJXNgpDAAoJELgmozMOVy/d+ukP/RaqgmV9AireRFdChyE2AwEv
g5QhbKrf8QIoLKaLOG6A0jMwA49pey4j2omTMvjoSuhE/D3fApemIv1TOGSpLGiI
gIrnCK8ieH1Md568W7TihdWxbd8uceDFiDVhnzwmL89DvdJUFSQdCNBKhLw8ioBw
RRMpdfLNgWk3JyGTdFplz+R7amtGpZVbhZT5HkSOpwke6sb53QIcmewR118HUOPi
0L+F2C+wzH1NzNr2caJeK9WsM/Bi8iYn29Kn1WA7SOqFi6f+d31cwvYJcY3rJiyE
rdjWDwtBAYKwZw+vyMn6DsguFgcjhNkwywiJcAUMV8pe/gvx6aD/NIRqxM1jrFvi
Lre0ey6ltY9HVT8TZhgVzYQCSOYniZCnqKzHifiXnw+y/1d7AUN8Qmyg1GkomX/c
E3JNStbvMl8lELv/GRXapBzewbjlKLeFE1SbJ8rXQzyACLvzno67/BR+JgJrSJ33
OZqho2bHU7j48RHegvd+8r9VbXI7U5rMzO1siuy5sPpF8zFjtRN+pNSLZe3W8V4C
6cdVDmdiv4nnzyvPYoDEMdFG0/T2KugSVY3KzKMj45EiYaUO+jWqpt8ZminbLoCw
PHeGxNqMEvvM38Cm7mvmR8QmY/TZTYtiPH6ifT4Z2QDgvX6fH9oSjv5e32W86t24
aFYBzaxSkMY47UTD4eih
=mm+V
-----END PGP SIGNATURE-----

--CRhx6TIIHk38459CB2XOnu4rWvJgJ4FDr--
