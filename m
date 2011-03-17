From: Philipp Reisner <philipp.reisner@linbit.com>
Subject: Re: linux-next: build failure after merge of the final tree (block tree  related)
Date: Thu, 17 Mar 2011 15:01:32 +0100
Message-ID: <201103171501.32703.philipp.reisner@linbit.com>
References: <20110311175830.29a387b2.sfr@canb.auug.org.au> <20110317103131.6c6be7a5.sfr@canb.auug.org.au> <4D81DFA4.7000204@kernel.dk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail09.linbit.com ([212.69.161.110]:47371 "EHLO
	mail09.linbit.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779Ab1CQOBj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Mar 2011 10:01:39 -0400
In-Reply-To: <4D81DFA4.7000204@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>

Am Donnerstag, 17. M=E4rz 2011, um 11:17:08 schrieb Jens Axboe:
> On 2011-03-17 00:31, Stephen Rothwell wrote:
> > Hi Jens,
> >=20
> > On Fri, 11 Mar 2011 08:12:38 +0100 Jens Axboe <axboe@kernel.dk> wro=
te:
> >> On 2011-03-11 07:58, Stephen Rothwell wrote:
> >>> After merging the final tree, today's linux-next build (powerpc
> >>> allyesconfig) failed like this:
> >>>=20
> >>> drivers/char/tpm/tpm_tis.c:96: warning: 'is_itpm' defined but not=
 used
> >>> drivers/block/drbd/drbd_bitmap.c: In function '__bm_change_bits_t=
o':
> >>> drivers/block/drbd/drbd_bitmap.c:1287: error: implicit declaratio=
n of
> >>> function 'generic___test_and_set_le_bit'
> >>> drivers/block/drbd/drbd_bitmap.c:1289: error: implicit declaratio=
n of
> >>> function 'generic___test_and_clear_le_bit'
> >>> drivers/block/drbd/drbd_bitmap.c: In function 'drbd_bm_test_bit':
> >>> drivers/block/drbd/drbd_bitmap.c:1438: error: implicit declaratio=
n of
> >>> function 'generic_test_le_bit'
> >>>=20
> >>> Caused by commit 4b0715f09655 ("drbd: allow petabyte storage on 6=
4bit
> >>> arch").
> >>=20
> >>> I have applied this patch for today (surely there is a better way=
):
> >> Thanks for not dropping it, I'll let the drbd guys send in a prope=
r fix
> >> and get it committed.
> >=20
> > Ping?
>=20
> Lars, please send me a fix for this ASAP. It's holding up the block
> merge.

Hi Jens,

Please use Stephen's patch for the merge. It is perfectly valid.

Lars is in the progress of preparing a suggestion for a much
broader cleanup/fix for the little-endian bitops topic.

But that should not delay the the block merge, nor is it necessary
for the drbd updates. He plans to have that ready by tomorrow.

Best,
 Phil
--=20
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.
