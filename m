From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad rebase of the rdma-leon tree
Date: Thu, 5 Jan 2017 09:34:53 +1100
Message-ID: <20170105093453.71ff8281@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philippe Reynes <tremyfr@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Leon,

In rebasing the rdma-leon tree, you have cherry-picked several patches
that were in the net-next tree:

Commit 8e4881aa == 90af6fea  net: mdio: add mdio45_ethtool_ksettings_get
Commit e938ed15 == 9aee5260  net: sfc: falcon: use new api ethtool_{get|set}_link_ksettings
Commit 41a65f70 == fae73a50  net: dec: de2104x: use new api ethtool_{get|set}_link_ksettings
Commit 6711a87a == acbf8e3c  net: dec: uli526x: use new api ethtool_{get|set}_link_ksettings
Commit 453e5f3d == edffccbc  net: dec: winbond-840: use new api ethtool_{get|set}_link_ksettings
Commit 90222550 == 8c2863a7  net: dlink: dl2k: use new api ethtool_{get|set}_link_ksettings
Commit 88c513d4 == c9abb356  net: dlink: sundance: use new api ethtool_{get|set}_link_ksettings
Commit fd90095d == ba141e8e  net: emulex: benet: use new api ethtool_{get|set}_link_ksettings
Commit 9da12b64 == 4c8dff9c  net: faraday: ftmac100: use new api ethtool_{get|set}_link_ksettings
Commit 0a0a8d6b == 98192246  net: fealnx: use new api ethtool_{get|set}_link_ksettings

(The first SHA1s above are in the net-next tree.)

-- 
Cheers,
Stephen Rothwell
