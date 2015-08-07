From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm-soc tree
Date: Fri, 7 Aug 2015 10:33:32 +1000
Message-ID: <20150807103332.0354c71b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the arm-soc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mach-shmobile/Makefile:59: *** missing 'endif'.  Stop.

Caused by commit

  ff20775d189c ("Merge tag 'renesas-marzen-board-removal-for-v4.3' of git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas into next/cleanup")

I have used the arm-soc tree from next-20150806 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
