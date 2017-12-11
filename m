From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the device-mapper tree
Date: Mon, 11 Dec 2017 13:05:34 +1100
Message-ID: <20171211130534.6ab6e415@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the device-mapper tree, today's linux-next build (powerp
ppc64_defconfig) produced this warning:

drivers/md/dm.c: In function '__send_changing_extent_only':
drivers/md/dm.c:1365:45: warning: 'ti' may be used uninitialized in this function [-Wmaybe-uninitialized]
  num_bios = get_num_bios ? get_num_bios(ti) : 0;
                                             ^

Introduced by commit

  aecefd4919de ("dm: fix __send_changing_extent_only() to send first bio and chain remainder")

This looks particularly bad :-(
-- 
Cheers,
Stephen Rothwell
