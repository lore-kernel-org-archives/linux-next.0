From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the berlin tree
Date: Wed, 23 Sep 2015 09:51:18 +1000
Message-ID: <20150923095118.0b8cb7bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>
List-Id: linux-next.vger.kernel.org

Hi Sebastian,

After merging the berlin tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/boot/dts/berlin2q.dtsi:62.24-25 syntax error
FATAL ERROR: Unable to parse input tree
drivers/clk/berlin/bg2q.c: In function 'berlin2q_clock_setup':
/home/sfr/next/next/drivers/clk/berlin/bg2q.c:359:7: error: 'CLKID_CPU' undeclared (first use in this function)
  clks[CLKID_CPU] =
       ^

Caused by commits

  23998645f6e7 ("ARM: berlin: dts: add the cpufreq-dt bindings on the BG2Q")
  ea6beeb6b2af ("clk: berlin: add cpuclk")

I have used the berlin tree from next-20150922 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
