From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Fri, 9 Dec 2016 11:34:50 +1100
Message-ID: <20161209113450.76b304d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51251 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754021AbcLIAew (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Dec 2016 19:34:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from include/linux/byteorder/big_endian.h:4:0,
                 from arch/powerpc/include/uapi/asm/byteorder.h:13,
                 from include/asm-generic/bitops/le.h:5,
                 from arch/powerpc/include/asm/bitops.h:279,
                 from include/linux/bitops.h:36,
                 from include/linux/kernel.h:10,
                 from include/linux/skbuff.h:17,
                 from include/linux/if_ether.h:23,
                 from include/linux/etherdevice.h:25,
                 from drivers/net/ethernet/intel/i40e/i40e_main.c:27:
drivers/net/ethernet/intel/i40e/i40e_main.c: In function 'i40e_sync_vsi_filters':
include/uapi/linux/byteorder/big_endian.h:34:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
 #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
                          ^
include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__cpu_to_le16'
 #define cpu_to_le16 __cpu_to_le16
                     ^
drivers/net/ethernet/intel/i40e/i40e_main.c:2200:5: note: in expansion of macro 'cpu_to_le16'
     cpu_to_le16((u16)I40E_AQC_MM_ERR_NO_RES);
     ^

Introduced by commit

  ac9e23901441 ("i40e: refactor i40e_update_filter_state to avoid passing aq_err")

-- 
Cheers,
Stephen Rothwell
