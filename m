From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Fri, 25 Mar 2011 13:08:51 +0900
Message-ID: <AANLkTimZb9x7-5maMU-jibxLdq1pW=CVE4ABXsX6jJRN@mail.gmail.com>
References: <20110325143049.2e65091f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:49522 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831Ab1CYEIw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Mar 2011 00:08:52 -0400
In-Reply-To: <20110325143049.2e65091f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>, Andrew Morton <akpm@linux-foundation.org>

2011/3/25 Stephen Rothwell <sfr@canb.auug.org.au>:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 25 Mar 2011 14:27:57 +1100
> Subject: [PATCH] drbd: update for bitop api changes
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> =A0drivers/block/drbd/drbd_bitmap.c | =A0 12 ++++++------
> =A01 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/dr=
bd_bitmap.c
> index f0ae63d..eb925fa 100644
> --- a/drivers/block/drbd/drbd_bitmap.c
> +++ b/drivers/block/drbd/drbd_bitmap.c

Please remove "#include <asm-generic/bitops/le.h>" from this file.

> @@ -1184,10 +1184,10 @@ static unsigned long __bm_find_next(struct dr=
bd_conf *mdev, unsigned long bm_fo,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p_addr =3D __bm_map_pi=
dx(b, bm_bit_to_page_idx(b, bm_fo), km);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (find_zero_bit)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D g=
eneric_find_next_zero_le_bit(p_addr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D f=
ind_next_zero_bit_le(p_addr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0PAGE_SIZE*8, bm_fo & BITS_PER_PAGE_MASK);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D g=
eneric_find_next_le_bit(p_addr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D f=
ind_next_bit_le(p_addr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0PAGE_SIZE*8, bm_fo & BITS_PER_PAGE_MASK);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__bm_unmap(p_addr, km)=
;
> @@ -1287,9 +1287,9 @@ static int __bm_change_bits_to(struct drbd_conf=
 *mdev, const unsigned long s,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0last_page_nr =3D page_=
nr;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (val)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c +=3D (0 =3D=3D generi=
c___test_and_set_le_bit(bitnr & BITS_PER_PAGE_MASK, p_addr));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c +=3D (0 =3D=3D __test=
_and_set_bit_le(bitnr & BITS_PER_PAGE_MASK, p_addr));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c -=3D (0 !=3D generic_=
__test_and_clear_le_bit(bitnr & BITS_PER_PAGE_MASK, p_addr));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c -=3D (0 !=3D __test_a=
nd_clear_bit_le(bitnr & BITS_PER_PAGE_MASK, p_addr));
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0if (p_addr)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__bm_unmap(p_addr, km);
> @@ -1438,7 +1438,7 @@ int drbd_bm_test_bit(struct drbd_conf *mdev, co=
nst unsigned long bitnr)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bm_print_lock_info(mdev);
> =A0 =A0 =A0 =A0if (bitnr < b->bm_bits) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p_addr =3D bm_map_pidx(b, bm_bit_to_pa=
ge_idx(b, bitnr));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D generic_test_le_bit(bitnr & BITS_=
PER_PAGE_MASK, p_addr) ? 1 : 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D test_bit_le(bitnr & BITS_PER_PAGE=
_MASK, p_addr) ? 1 : 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bm_unmap(p_addr);
> =A0 =A0 =A0 =A0} else if (bitnr =3D=3D b->bm_bits) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i =3D -1;
> @@ -1482,7 +1482,7 @@ int drbd_bm_count_bits(struct drbd_conf *mdev, =
const unsigned long s, const unsi
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ERR_IF (bitnr >=3D b->bm_bits) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(DEV, "bitnr=3D=
%lu bm_bits=3D%lu\n", bitnr, b->bm_bits);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c +=3D (0 !=3D generic_=
test_le_bit(bitnr - (page_nr << (PAGE_SHIFT+3)), p_addr));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c +=3D (0 !=3D test_bit=
_le(bitnr - (page_nr << (PAGE_SHIFT+3)), p_addr));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0if (p_addr)
> --
> 1.7.4.1
>
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
