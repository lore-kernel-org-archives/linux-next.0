From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the file-locks tree
Date: Wed, 21 Jun 2017 10:30:38 +1000
Message-ID: <20170621103038.2b04a922@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeff Layton <jlayton@poochiereds.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>
List-Id: linux-next.vger.kernel.org

Hi Jeff,

After merging the file-locks tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

mm/page-writeback.c: In function 'write_one_page':
mm/page-writeback.c:2380:15: warning: unused variable 'ret2' [-Wunused-variable]
  int ret = 0, ret2;
               ^

Introduced by commit

  4118ba44fa2c ("mm: clean up error handling in write_one_page")

-- 
Cheers,
Stephen Rothwell
