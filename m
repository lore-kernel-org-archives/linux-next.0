From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: next-20081209: fails to build IA64 allyesconfig
Date: Tue, 9 Dec 2008 17:22:48 +0300
Message-ID: <a4423d670812090622h668b597ah7e4c9b4c5a1cbb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-ia64-owner@vger.kernel.org
To: "Luck, Tony" <tony.luck@intel.com>, linux-ia64@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

  GEN     include/linux/bounds.h
  CC      arch/ia64/kernel/asm-offsets.s
In file included from include/linux/bitops.h:17,
                 from include/linux/kernel.h:15,
                 from include/linux/sched.h:52,
                 from arch/ia64/kernel/asm-offsets.c:9:
/home/alexb/linux-2.6/arch/ia64/include/asm/bitops.h: In function 'set_bit':
/home/alexb/linux-2.6/arch/ia64/include/asm/bitops.h:47: error:
implicit declaration of function 'BUILD_BUG_ON'
