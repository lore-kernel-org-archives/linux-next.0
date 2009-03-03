From: Andy Grover <andy.grover@oracle.com>
Subject: Re: linux-next: net tree build failure
Date: Mon, 02 Mar 2009 19:22:55 -0800
Message-ID: <49ACA28F.5090906@oracle.com>
References: <20090302180514.9b07c7d9.sfr@canb.auug.org.au>	<20090302.014958.31955182.davem@davemloft.net> <20090303125525.1cb0baf9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:33670 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753971AbZCCDXW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2009 22:23:22 -0500
In-Reply-To: <20090303125525.1cb0baf9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi Dave,
> 
> On Mon, 02 Mar 2009 01:49:58 -0800 (PST) David Miller <davem@davemloft.net> wrote:
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Mon, 2 Mar 2009 18:05:14 +1100
>>
>>> Today's linux-next build (powerpc allyesconfig) failed like this:
>>>
>>> net/rds/cong.c: In function 'rds_cong_set_bit':
>>> net/rds/cong.c:284: error: implicit declaration of function 'generic___set_le_bit'
>>> net/rds/cong.c: In function 'rds_cong_clear_bit':
>>> net/rds/cong.c:298: error: implicit declaration of function 'generic___clear_le_bit'
>>> net/rds/cong.c: In function 'rds_cong_test_bit':
>>> net/rds/cong.c:309: error: implicit declaration of function 'generic_test_le_bit'
>> I've fixed this up as follows:
> 
> I was actually wondering if this was some API that powerpc had not
> implemented (most other architectures include asm-generic/bitops/le.h in
> their asm/bitops.h via asm-generic/bitops/ext2-non-atomic.h or
> asm-generic/bitops/minix-le.h) or whether RDS should be using some other
> API (since this is the first use of those functions outside the headers
> above).

My 2c,

I think the correct solution is for all archs to define 
generic_*_le_bit. In addition ext2_*_bit callers (there are a bunch 
besides ext2!) should be fixed.

Some examples:

include/linux/reiserfs_fs.h:#define reiserfs_test_and_set_le_bit 
ext2_set_bit
fs/udf/balloc.c:#define udf_clear_bit(nr, addr) ext2_clear_bit(nr, addr)
fs/ext4/ext4.h:#define ext4_set_bit                     ext2_set_bit

And this one:

lib/find_next_bit.c:static inline unsigned long ext2_swabp(const 
unsigned long *

^^^ cargo cult ext2 prefixing???

Regards -- Andy
