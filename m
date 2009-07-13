From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the reiserfs-bkl tree with Linus' tree
Date: Mon, 13 Jul 2009 11:51:14 +1000
Message-ID: <20090713115114.a871ea68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41994 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752237AbZGMBvS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Jul 2009 21:51:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?IkZyw6lkw6lyaWMgV2Vpc2JlY2tlciI=?= <fweisbec@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>

Hi Fr=C3=A9d=C3=A9ric,

Today's linux-next merge of the reiserfs-bkl tree got a conflict in
fs/reiserfs/journal.c between commit
8aa7e847d834ed937a9ad37a0f2ad5b8584c1ab0 ("Fix congestion_wait()
sync/async vs read/write confusion") from Linus' tree and commit
e533d8da923c77ed58940309c401584bffda75e0 ("reiserfs: kill-the-BKL") fro=
m
the reiserfs-bkl tree.

Just context changes.  I fixed it up as best I could (see below) and ca=
n
carry the fix for a while.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/reiserfs/journal.c
index 9062220,86c1ff4..0000000
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@@ -996,8 -984,13 +984,13 @@@ static int reiserfs_async_progress_wait
  {
  	DEFINE_WAIT(wait);
  	struct reiserfs_journal *j =3D SB_JOURNAL(s);
- 	if (atomic_read(&j->j_async_throttle))
+=20
+ 	if (atomic_read(&j->j_async_throttle)) {
+ 		reiserfs_write_unlock(s);
 -		congestion_wait(WRITE, HZ / 10);
 +		congestion_wait(BLK_RW_ASYNC, HZ / 10);
+ 		reiserfs_write_lock(s);
+ 	}
+=20
  	return 0;
  }
 =20
