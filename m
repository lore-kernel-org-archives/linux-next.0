From: Jens Axboe <axboe@kernel.dk>
Subject: Re: Boot failure on Arndale with next-20131105
Date: Tue, 05 Nov 2013 14:25:00 -0700
Message-ID: <5279622C.8040509@kernel.dk>
References: <CAHbNUh1Cw3bc4WR0VcD1H_eKYqGBtv_215_euh6mwTbZ41ejUw@mail.gmail.com> <1451170.jb5zbRXgpt@amdc1227> <52792D13.70704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:39979 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755159Ab3KEVZV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2013 16:25:21 -0500
In-Reply-To: <52792D13.70704@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Tushar Behera <tushar.behera@linaro.org>
Cc: linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Chris Mason <chris.mason@fusionio.com>

On 11/05/2013 10:38 AM, Stephen Warren wrote:
> I note that compiling next-20131105 generates quite a few warnings re=
:
> uninitialized variables. Reverting the commit doesn't solve those.
>=20
>> block/blk-merge.c: In function =91blk_bio_map_sg=92:
>> block/blk-merge.c:133:8: warning: =91bvprv.bv_len=92 may be used uni=
nitialized in this function [-Wmaybe-uninitialized]
>> block/blk-merge.c:233:23: note: =91bvprv.bv_len=92 was declared here
>> block/blk-merge.c:133:8: warning: =91bvprv.bv_offset=92 may be used =
uninitialized in this function [-Wmaybe-uninitialized]
>> block/blk-merge.c:233:23: note: =91bvprv.bv_offset=92 was declared h=
ere
>> block/blk-merge.c:133:8: warning: =91bvprv.bv_page=92 may be used un=
initialized in this function [-Wmaybe-uninitialized]
>> block/blk-merge.c:233:23: note: =91bvprv.bv_page=92 was declared her=
e
>> block/blk-merge.c: In function =91blk_rq_map_sg=92:
>> block/blk-merge.c:133:8: warning: =91bvprv.bv_page=92 may be used un=
initialized in this function [-Wmaybe-uninitialized]
>> block/blk-merge.c:171:23: note: =91bvprv.bv_page=92 was declared her=
e
>> block/blk-merge.c:133:8: warning: =91bvprv.bv_offset=92 may be used =
uninitialized in this function [-Wmaybe-uninitialized]
>> block/blk-merge.c:171:23: note: =91bvprv.bv_offset=92 was declared h=
ere
>> block/blk-merge.c:133:8: warning: =91bvprv.bv_len=92 may be used uni=
nitialized in this function [-Wmaybe-uninitialized]
>> block/blk-merge.c:171:23: note: =91bvprv.bv_len=92 was declared here
>> block/blk-merge.c: In function =91attempt_merge=92:
>> block/blk-merge.c:108:7: warning: =91end_bv.bv_offset=92 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
>> block/blk-merge.c:89:17: note: =91end_bv.bv_offset=92 was declared h=
ere
>> block/blk-merge.c:108:7: warning: =91end_bv.bv_page=92 may be used u=
ninitialized in this function [-Wmaybe-uninitialized]
>> block/blk-merge.c:89:17: note: =91end_bv.bv_page=92 was declared her=
e
>> block/blk-merge.c:108:7: warning: =91end_bv.bv_len=92 may be used un=
initialized in this function [-Wmaybe-uninitialized]
>> block/blk-merge.c:89:17: note: =91end_bv.bv_len=92 was declared here

Looks like an incomplete merge. The patch to silence those warnings
(which aren't bugs, BTW) is definitely in my for-next branch.

--=20
Jens Axboe
