From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Jun 20
Date: Mon, 20 Jun 2016 22:59:20 +0100
Message-ID: <57686738.70900@gmail.com>
References: <20160620160537.3ea30484@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160620160537.3ea30484@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org
List-Id: linux-next.vger.kernel.org

On Monday 20 June 2016 07:05 AM, Stephen Rothwell wrote:
> Hi all,
>
> Changes since 20160617:

I just started trying gcc 6.1.0 for mips and mips allmodconfig is 
failing with the error:

{standard input}: Assembler messages:
{standard input}:147: Error: number (0x9000000080000000) larger than 32 bits

{standard input}:176: Error: number (0x9000000080000000) larger than 32 bits

{standard input}:198: Error: number (0x9000000080000000) larger than 32 bits

make[3]: *** [arch/mips/mm/sc-ip22.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [arch/mips/mm] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [arch/mips] Error 2
make[1]: *** Waiting for unfinished jobs....

build log can be seen at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/138824794

regards
sudip
