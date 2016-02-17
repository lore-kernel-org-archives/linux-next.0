From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: linux-next: Tree for Feb 17
Date: Wed, 17 Feb 2016 09:37:44 -0800
Message-ID: <56C4AFE8.6020101@caviumnetworks.com>
References: <20160217163921.42aeff6a@canb.auug.org.au> <20160217115248.GA4294@sudip-pc>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160217115248.GA4294@sudip-pc>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <david.daney@cavium.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, kernel-testers@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 02/17/2016 03:52 AM, Sudip Mukherjee wrote:
> On Wed, Feb 17, 2016 at 04:39:21PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20160216:
>
> since last few days build of mips cavium_octeon_defconfig is failing
> with the error:
> arch/mips/include/asm/octeon/cvmx.h:60:39: fatal error:
> 	asm/octeon/cvmx-ciu3-defs.h: No such file or directory
>

When Ralf applied the patches, he missed this one:

https://www.linux-mips.org/cgi-bin/mesg.cgi?a=linux-mips&i=1455044413-9823-4-git-send-email-ddaney.cavm%40gmail.com

This is PATCH 3/8 and if applied in  the proper order, it should fix 
this problem.

Ralf: It looks like you should consider re-spinning  mips-for-linux-next 
to include this patch.

David.


> caused by commit:
> dfb354bef1fa ("MIPS: OCTEON: Add model checking support for cn73xx, cnf75xx and cn78xx")
>
> The #include for the header file is added but the header file is not in
> the tree.
>
> regards
> sudip
>
