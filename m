From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm tree with the kvm tree
Date: Tue, 18 Jun 2013 10:16:24 +1000
Message-ID: <20130618101624.00ad644cbfb29bd1ebe358ca@canb.auug.org.au>
References: <20130617180735.c10c058469ce0633c65225a4@canb.auug.org.au>
	<51BEFFD4.6090904@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__18_Jun_2013_10_16_24_+1000_j+=FsB=nXL.Fgksi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:50995 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751549Ab3FRAQ2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Jun 2013 20:16:28 -0400
In-Reply-To: <51BEFFD4.6090904@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Xiao Guangrong <xiaoguangrong@linux.vnet.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Chinner <dchinner@redhat.com>, Glauber Costa <glommer@openvz.org>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@redhat.com>

--Signature=_Tue__18_Jun_2013_10_16_24_+1000_j+=FsB=nXL.Fgksi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Xiao,

On Mon, 17 Jun 2013 20:23:48 +0800 Xiao Guangrong <xiaoguangrong@linux.vnet=
.ibm.com> wrote:
>
> On 06/17/2013 04:07 PM, Stephen Rothwell wrote:
>=20
> > - 		prepare_zap_oldest_mmu_page(kvm, &invalid_list);
> > + 		freed +=3D prepare_zap_oldest_mmu_page(kvm, &invalid_list);
>=20
> It seems this change is not needed? and "freed" is not defined in mmu_shr=
ink().
> Right?

That same patch in the akpm tree renames "mmu_shrink" to
"mmu_shrink_scan" and declares "freed" ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__18_Jun_2013_10_16_24_+1000_j+=FsB=nXL.Fgksi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJRv6bYAAoJEECxmPOUX5FEvbwQAJ/3AjnBJxfjamVgPGnXOcVG
Ni8RzME5HUemdf39HNFRl4wWqkW8qswgi7180GpyxEKKjTNg5ht6MsIfw2ISrJfG
JLQPIViohurU4tlkArN65kGNxicL9ZJ/KHt5CmLMiardSZMoD36WBBSYNHxoxLOk
cSlxzfRWwrh4ICiYdObAmdUQx8WzHw7BIcafvmzitcsOzjMRIELNDcV2gv3TsFAu
AG2S3kUYHoaXem4YHTPKXOTplR5c9IZthXpYJIqdLM6tFVh2XR17K2S1UqHRA8vT
pEaWoYDPgb2M9RrE4xW9ohO3HkBBGPw81JtVC+sVkfdytzOtGC3SHtVzAmkcRySG
9Rkwkk8GFsHOHnAYZhUfjma5nOxWz/0gXsomkOHVWSp8Up9Q3nJ+QRnrmaOkkQo4
CvTKr9OSIM8iXWSh/2GhpLxSBorp31ZsBbRU+fSlLD1UBQujjziW8gJF+nPp+ZJR
U2rpHKmb/fntaVqCQXnmiiF+20lMmxS5qjAIvz9RZo6yJyH9OgKsBZJAvrwsV0uV
5V7dMDILrPjpeP+a633QWD/U9sDRsnftOcLDQMh7HA8o420sLUmdGB1GvAJHnpIv
iYkqA9kaqoptOyJWkpH8Vv/kRkpDvID0hCClpxKFWdS0wsrTOtzRi6fUcbAZSbiw
cqGBhX2LJnOUzY7plMse
=6Z3Z
-----END PGP SIGNATURE-----

--Signature=_Tue__18_Jun_2013_10_16_24_+1000_j+=FsB=nXL.Fgksi--
