From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Tree for Dec 9
Date: Wed, 9 Dec 2015 17:59:44 +0900
Message-ID: <20151209085944.GA462@swordfish>
References: <20151209181920.32a38404@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:33559 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752642AbbLII6m (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2015 03:58:42 -0500
Content-Disposition: inline
In-Reply-To: <20151209181920.32a38404@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>

Hello,

On (12/09/15 18:19), Stephen Rothwell wrote:
> 
> Changes since 20151208:
> 

corrupts low memory:

[   60.459441] Corrupted low memory at ffff880000001000 (1000 phys) = 00000001
[   60.459445] Corrupted low memory at ffff880000001008 (1008 phys) = ffffffff81a816b8
[   60.459446] Corrupted low memory at ffff880000001020 (1020 phys) = ffffffff817e509f
[   60.459448] Corrupted low memory at ffff880000001028 (1028 phys) = ffff880037962098
[   60.459449] Corrupted low memory at ffff880000001030 (1030 phys) = ffffffff8180ce74
[   60.459450] Corrupted low memory at ffff880000001038 (1038 phys) = ffff880037962d48
[   60.459452] Corrupted low memory at ffff880000001058 (1058 phys) = 01adad40
[   60.459453] Corrupted low memory at ffff880000001060 (1060 phys) = ffffffff81620b20
[   60.459454] Corrupted low memory at ffff880000001070 (1070 phys) = 00001000
[   60.459456] Corrupted low memory at ffff880000001080 (1080 phys) = ffffffff81a816a0
[   60.459457] Corrupted low memory at ffff880000001088 (1088 phys) = 21eb81240152
[   60.459458] Corrupted low memory at ffff880000001098 (1098 phys) = 00000001
[   60.459459] Corrupted low memory at ffff8800000010a0 (10a0 phys) = ffffffff81a816e8
[   60.459461] Corrupted low memory at ffff8800000010b8 (10b8 phys) = ffffffff817e509f
[   60.459462] Corrupted low memory at ffff8800000010c0 (10c0 phys) = ffff880037962098
[   60.459463] Corrupted low memory at ffff8800000010c8 (10c8 phys) = ffffffff8180715d
[   60.459465] Corrupted low memory at ffff8800000010d0 (10d0 phys) = ffff880037962169
[   60.459466] Corrupted low memory at ffff8800000010e0 (10e0 phys) = ffff880000001168
[   60.459467] Corrupted low memory at ffff8800000010f0 (10f0 phys) = 56a89f6d
[   60.459469] Corrupted low memory at ffff8800000010f8 (10f8 phys) = ffffffff81620b20
[   60.459470] Corrupted low memory at ffff880000001108 (1108 phys) = 00001000
[   60.459471] Corrupted low memory at ffff880000001118 (1118 phys) = ffffffff81a816d0
[   60.459473] Corrupted low memory at ffff880000001120 (1120 phys) = 21ec81240152
[   60.459474] Corrupted low memory at ffff880000001130 (1130 phys) = 00000001
[   60.459475] Corrupted low memory at ffff880000001138 (1138 phys) = ffffffff81a81718
[   60.459476] Corrupted low memory at ffff880000001150 (1150 phys) = ffffffff817e509f
[   60.459478] Corrupted low memory at ffff880000001158 (1158 phys) = ffff880037962098
[   60.459479] Corrupted low memory at ffff880000001160 (1160 phys) = ffffffff81806d8f
[   60.459480] Corrupted low memory at ffff880000001168 (1168 phys) = ffff8800000010d0
[   60.459482] Corrupted low memory at ffff880000001188 (1188 phys) = 5436156b
[   60.459483] Corrupted low memory at ffff880000001190 (1190 phys) = ffffffff81620b20
[   60.459484] Corrupted low memory at ffff8800000011a0 (11a0 phys) = 00001000
[   60.459486] Corrupted low memory at ffff8800000011b0 (11b0 phys) = ffffffff81a81700
[   60.459487] Corrupted low memory at ffff8800000011b8 (11b8 phys) = 21ed81a40152
[   60.459488] Corrupted low memory at ffff8800000011c8 (11c8 phys) = 00000001
[   60.459490] Corrupted low memory at ffff8800000011d0 (11d0 phys) = ffffffff81a81748
[   60.459491] Corrupted low memory at ffff8800000011e8 (11e8 phys) = ffffffff817e509f
[   60.459492] Corrupted low memory at ffff8800000011f0 (11f0 phys) = ffff880037962098
[   60.459494] Corrupted low memory at ffff8800000011f8 (11f8 phys) = ffffffff817d21d8
[   60.459495] Corrupted low memory at ffff880000001200 (1200 phys) = ffff880000001298
[   60.459496] Corrupted low memory at ffff880000001220 (1220 phys) = 137e7407
[   60.459498] Corrupted low memory at ffff880000001228 (1228 phys) = ffffffff81620b20
[   60.459499] Corrupted low memory at ffff880000001238 (1238 phys) = 00001000
[   60.459500] Corrupted low memory at ffff880000001248 (1248 phys) = ffffffff81a81730
[   60.459501] Corrupted low memory at ffff880000001250 (1250 phys) = 21ee81a40152
[   60.459503] Corrupted low memory at ffff880000001260 (1260 phys) = 00000001
[   60.459504] Corrupted low memory at ffff880000001268 (1268 phys) = ffffffff81a81778
[   60.459505] Corrupted low memory at ffff880000001280 (1280 phys) = ffffffff817e509f
[   60.459507] Corrupted low memory at ffff880000001288 (1288 phys) = ffff880037962098
[   60.459508] Corrupted low memory at ffff880000001290 (1290 phys) = ffffffff81807164
[   60.459509] Corrupted low memory at ffff880000001298 (1298 phys) = ffff880037962299
[   60.459511] Corrupted low memory at ffff8800000012a0 (12a0 phys) = ffff880037962ae8
[   60.459512] Corrupted low memory at ffff8800000012a8 (12a8 phys) = ffff880000001200
[   60.459513] Corrupted low memory at ffff8800000012b8 (12b8 phys) = 1ed682f4
[   60.459515] Corrupted low memory at ffff8800000012c0 (12c0 phys) = ffffffff81620b20
[   60.459516] Corrupted low memory at ffff8800000012d0 (12d0 phys) = 00001000
[   60.459517] Corrupted low memory at ffff8800000012e0 (12e0 phys) = ffffffff81a81760
[   60.459518] Corrupted low memory at ffff8800000012e8 (12e8 phys) = 21ef81a40152
[   60.459520] Corrupted low memory at ffff8800000012f8 (12f8 phys) = 0000000a
[   60.459521] Corrupted low memory at ffff880000001320 (1320 phys) = ffff88013338b260
[   60.459522] Corrupted low memory at ffff880000001328 (1328 phys) = ffff88003793b028
[   60.459524] Corrupted low memory at ffff880000001330 (1330 phys) = ffff88013338b330
[   60.459525] Corrupted low memory at ffff880000001350 (1350 phys) = 5b866adb
[   60.459526] Corrupted low memory at ffff880000001358 (1358 phys) = 00000001
[   60.459528] Corrupted low memory at ffff880000001360 (1360 phys) = ffff880000001460
[   60.459529] Corrupted low memory at ffff880000001368 (1368 phys) = ffff88013302d500
[   60.459530] Corrupted low memory at ffff880000001378 (1378 phys) = ffff880037988410
[   60.459532] Corrupted low memory at ffff880000001380 (1380 phys) = 21f041ed0011
[   60.459533] Corrupted low memory at ffff880000001390 (1390 phys) = 00000003
[..]
[   60.465181] Corrupted low memory at ffff88000000ff48 (ff48 phys) = 720072007200720
[   60.465182] Corrupted low memory at ffff88000000ff50 (ff50 phys) = 720072007200720
[   60.465183] Corrupted low memory at ffff88000000ff58 (ff58 phys) = 720072007200720
[   60.465185] Corrupted low memory at ffff88000000ff60 (ff60 phys) = 720072007200720
[   60.465186] Corrupted low memory at ffff88000000ff68 (ff68 phys) = 720072007200720
[   60.465188] Corrupted low memory at ffff88000000ff70 (ff70 phys) = 720072007200720
[   60.465189] Corrupted low memory at ffff88000000ff78 (ff78 phys) = 720072007200720

	-ss
