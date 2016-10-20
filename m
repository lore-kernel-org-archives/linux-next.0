From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net tree
Date: Fri, 21 Oct 2016 09:27:10 +1100
Message-ID: <20161021092710.1b56a35b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the net tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: "kexec_in_progress" [drivers/net/dsa/bcm_sf2.ko] undefined!

Caused by commit

  2399d6143f85 ("net: dsa: bcm_sf2: Prevent GPHY shutdown for kexec'd kernels")

I used the version of the net tree from next-20161020 for today.

-- 
Cheers,
Stephen Rothwell
