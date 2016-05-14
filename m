From: Guenter Roeck <private@roeck-us.net>
Subject: next: Build errors due to 'MIPS: Add probing & defs for VZ & guest
 features'
Date: Sat, 14 May 2016 08:19:50 -0700
Message-ID: <57374216.10307@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>
List-Id: linux-next.vger.kernel.org

James,

your patch 'MIPS: Add probing & defs for VZ & guest features' causes build errors
in -next when using gcc 4.7.4 / binutils 2.24. This affects almost all mips builds.

{standard input}: Assembler messages:
{standard input}:3306: Warning: Tried to set unrecognized symbol: virt
{standard input}:3307: Error: Unrecognized opcode `mfgc0 $3,$16,0'

and lots of similar messages when building arch/mips/kernel/cpu-probe.o.

Build is fine with gcc 5.2.0 and binutils 2.5.

Bisect log is attached.

Guenter

---
Bisect log:

# bad: [7fd1a8676b7f573be6aa8072e8fa1d4f1bbf8ea7] Add linux-next specific files for 20160513
# good: [44549e8f5eea4e0a41b487b63e616cb089922b99] Linux 4.6-rc7
git bisect start 'HEAD' 'v4.6-rc7'
# bad: [d573c57f72f32687ed2d11ba60ee5e6f5746ccde] Merge remote-tracking branch 'crypto/master'
git bisect bad d573c57f72f32687ed2d11ba60ee5e6f5746ccde
# bad: [cea0bc891cbcb9cd57a95c0fe03cb16ce3716125] Merge branch 'jdelvare-hwmon/master'
git bisect bad cea0bc891cbcb9cd57a95c0fe03cb16ce3716125
# good: [ffa24f116d6f3925e0eebcd4d4ae30d9ac237459] Merge remote-tracking branch 'tegra/for-next'
git bisect good ffa24f116d6f3925e0eebcd4d4ae30d9ac237459
# bad: [cb4699056080a4a094be6080e10c692af0794d93] Merge remote-tracking branch 'btrfs-kdave/for-next'
git bisect bad cb4699056080a4a094be6080e10c692af0794d93
# bad: [9f2e34d4ff5756624948fe7976866749664793c7] Merge remote-tracking branch 'mips/mips-for-linux-next'
git bisect bad 9f2e34d4ff5756624948fe7976866749664793c7
# good: [fe33223366b2c02394274395f4ac43e48c453654] MIPS: Separate XPA CPU feature into LPA and MVH
git bisect good fe33223366b2c02394274395f4ac43e48c453654
# good: [5eae0ba2589f767b5c9c14e662f972084b4a46d7] Merge remote-tracking branch 'arm64/for-next/core'
git bisect good 5eae0ba2589f767b5c9c14e662f972084b4a46d7
# bad: [9ca0b767b011347402eb083f887629b27c8eda54] Merge branch '4.6-fixes' into mips-for-linux-next
git bisect bad 9ca0b767b011347402eb083f887629b27c8eda54
# good: [128639395b2ceacc6a56a0141d0261012bfe04d3] MIPS: Adjust set_pte() SMP fix to handle R10000_LLSC_WAR
git bisect good 128639395b2ceacc6a56a0141d0261012bfe04d3
# good: [6768a2c2e1310acb3e8e8e63a6e2caa146d19d0e] MIPS: BMIPS: BMIPS4380 and BMIPS5000 support RIXI
git bisect good 6768a2c2e1310acb3e8e8e63a6e2caa146d19d0e
# good: [c1b01a9f21daaf269d77683a4f91f423254f0c3e] MIPS: Add perf counter feature
git bisect good c1b01a9f21daaf269d77683a4f91f423254f0c3e
# bad: [354d36f4304a14aced7e4ffb0d27038cd19b532f] MIPS: Add probing & defs for VZ & guest features
git bisect bad 354d36f4304a14aced7e4ffb0d27038cd19b532f
# good: [b7c0199bf7404e87839ad633e699370ed397d548] MIPS: Add register definitions for VZ ASE registers
git bisect good b7c0199bf7404e87839ad633e699370ed397d548
# good: [cf5c5ac39a33127caa3e4e97f52754a6feede8fd] MIPS: Add guest CP0 accessors
git bisect good cf5c5ac39a33127caa3e4e97f52754a6feede8fd
# first bad commit: [354d36f4304a14aced7e4ffb0d27038cd19b532f] MIPS: Add probing & defs for VZ & guest features
