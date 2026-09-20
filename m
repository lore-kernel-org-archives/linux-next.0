Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499F53264D9
	for <linux-next@vger.kernel.org>; Sun, 20 Sep 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909152; cv=none; b=upoh8VtiJfKgAP3NWTUYKenuLvABmwO5WIlH8+4p6odL42GILNidC+TgVyGDS1cMC2o+j47hXf3SX2NLU1hxHGkG0p0HaYP1o9X7ctNmRf/tOLBme4duc7+cHhUwwsJ83FfmPZapqdBXk+jkXiVvKEgyifqNnDVuFVcPCFpGfIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909152; c=relaxed/simple;
	bh=X0zoaWd01k/fecOFyUt875CQ7h6jkceb7wVkzeVisIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K2sfM8YIcOr1P/VxqynTfNetmEcWZFu2MQkhU4ejq+TLUuRsXC6Vvua9109cep6BnxV4r2qdgRb/JwzrKfAeWccBRko1VLIyJK810dt6d3dQLeyjWPSkcgAA+boJESkOlDd3MxP2Ogoto7BT6F94ZqqwX3XffKQgsi2kvGse8jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F1kMWARo; arc=none smtp.client-ip=91.218.175.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F1kMWARo"
X-Envelope-To: linux-next@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X0zoaWd01k/fecOFyUt875CQ7h6jkceb7wVkzeVisIk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789909140; v=1; x=1790513940;
 b=F1kMWARoa3+eFkEhSyjSGmoGvH4Y2S14JumDfdLq5wqBXtP+HZ6MuklnN9M35Nn8kTNuz1rb
 C9Da5pMYHY4xN8aWeTFghPw7N3wcLebvLIK7zf4zB/qx9d0uXrVwJotMWzQHBdJCm7br88spQ6g
 A/78PdUuuvCz1UGFdAyYEwvc=
X-Envelope-To: linux-next@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8931bcee9d023c79;
	Sun, 20 Sep 2026 12:59:00 +0000
X-Mizu-Trace-ID: 8931bcee9d023c79
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tao Cui <cui.tao@linux.dev>,
	linux-next@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-block@vger.kernel.org,
	cuitao@kylinos.cn
Subject: next-20260917 and next-20260918: merge of the block tree breaks all zoned devices
Date: Sun, 20 Sep 2026 20:58:34 +0800
Message-ID: <20260920125846.1806521-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Stephen,

I ran into this while testing a blk-iocost series of mine (charging
zone appends as writes) against a zoned null_blk: the device simply
does not show up, whether configured through module parameters or
configfs.  null_blk prints "using native zone append" and then
add_disk() fails silently with -ENODEV.

My series only touches blk-iocost.c, and the failure reproduces on
plain linux-next, so it is not mine.  Bisecting over the tags (qemu,
"null_blk.zoned=1 null_blk.gb=1 null_blk.zone_size=64" on the command
line) narrows it down to one day:

  next-20260916: nullb0 created, /sys/block/nullb0/queue/zoned = host-managed
  next-20260917: no device, add_disk() fails
  next-20260918: same failure

The only blk-zoned.c changes between next-20260916 and next-20260917
come in through the merge of the block tree, and next-20260918 repeats
the same resolution in the same place:

  66c8b6b56c09 ("Merge branch 'for-next' of .../axboe/linux.git", 2026-09-17)
  a9ce2250a714 ("Merge branch 'for-next' of .../axboe/linux.git", 2026-09-18)

As far as I can tell the resolved disk_revalidate_capacity() matches
neither parent: it gains a

  if (args->capacity >= args->nr_zones)

check that compares a sector count against a zone count, with
args->nr_zones still 0 on the first call, so it always trips and
blk_revalidate_disk_zones() always returns -ENODEV.  The zone_sectors
power-of-two check that both parents have is gone as well.  This hits
every zoned device, not just null_blk.

Taking the axboe side of the function makes nullb0 come back on
next-20260918 here (host-managed, chunk_sectors 131072), so it looks
like the merge should just have taken that side.

Same conflict, same bad outcome twice in a row now, so tomorrow's
merge may hit it again unless the block tree has moved on in this
area.

Regards,
Tao
