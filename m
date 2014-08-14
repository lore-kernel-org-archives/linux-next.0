From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 14 (mm/memory_hotplug.c and drivers/base/memory.c)
Date: Thu, 14 Aug 2014 08:02:22 -0700
Message-ID: <53ECCF7E.2090305@infradead.org>
References: <20140814152749.24d43663@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20140814152749.24d43663@canb.auug.org.au>
Sender: owner-linux-mm@kvack.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On 08/13/14 22:27, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add code intended for v3.18 until after v3.17-rc1 is
> released.
> 
> Changes since 20140813:
> 

on x86_64:

drivers/built-in.o: In function `show_zones_online_to':
memory.c:(.text+0x13f306): undefined reference to `test_pages_in_a_zone'

in drivers/base/memory.c

when CONFIG_MEMORY_HOTREMOVE is not enabled.

The function implementation in mm/memory_hotplug.c is only built if
CONFIG_MEMORY_HOTREMOVE is enabled.


-- 
~Randy

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
