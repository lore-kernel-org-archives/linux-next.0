From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 20 (drivers/memory/jz4780_nemc)
Date: Fri, 20 Jul 2018 09:28:14 -0700
Message-ID: <bb6cccb4-5e5c-b5dc-170d-f878af1374f1@infradead.org>
References: <20180720183212.6bc3477a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720183212.6bc3477a@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alex Smith <alex.smith@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
List-Id: linux-next.vger.kernel.org

On 07/20/2018 01:32 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180719:
> 

on i386 or x86_64:

when CONFIG_OF is not enabled, COMPILE_TEST is set:

../drivers/memory/jz4780-nemc.c: In function 'jz4780_nemc_num_banks':
../drivers/memory/jz4780-nemc.c:72:3: error: implicit declaration of function 'of_read_number' [-Werror=implicit-function-declaration]
   bank = of_read_number(prop, 1);
   ^

<linux/of.h> does not have a stub for of_read_number() when CONFIG_OF is not set
(it has no way to return an error).


-- 
~Randy
