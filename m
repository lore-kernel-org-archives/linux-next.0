From: Jiang Liu <jiang.liu@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 09 Feb 2015 10:53:05 +0800
Message-ID: <54D82111.9090003@linux.intel.com>
References: <20150209132642.0d61b6ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:39777 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759065AbbBICxL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2015 21:53:11 -0500
In-Reply-To: <20150209132642.0d61b6ed@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>



On 2015/2/9 10:26, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from drivers/of/of_pci.c:1:0:
> drivers/of/of_pci.c: In function 'of_pci_get_host_bridge_resources':
> include/linux/list.h:447:43: error: dereferencing pointer to incomplete type
>   for (pos = list_first_entry(head, typeof(*pos), member); \
>                                            ^
> include/linux/kernel.h:799:18: note: in definition of macro 'container_of'
>   const typeof( ((type *)0)->member ) *__mptr = (ptr); \
>                   ^
> include/linux/list.h:363:2: note: in expansion of macro 'list_entry'
>   list_entry((ptr)->next, type, member)
>   ^
> include/linux/list.h:447:13: note: in expansion of macro 'list_first_entry'
>   for (pos = list_first_entry(head, typeof(*pos), member); \
>              ^
> drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
>   list_for_each_entry(window, resources, list)
>   ^
> include/linux/kernel.h:799:48: warning: initialization from incompatible pointer type
>   const typeof( ((type *)0)->member ) *__mptr = (ptr); \
>                                                 ^
> include/linux/list.h:352:2: note: in expansion of macro 'container_of'
>   container_of(ptr, type, member)
>   ^
> include/linux/list.h:363:2: note: in expansion of macro 'list_entry'
>   list_entry((ptr)->next, type, member)
>   ^
> include/linux/list.h:447:13: note: in expansion of macro 'list_first_entry'
>   for (pos = list_first_entry(head, typeof(*pos), member); \
>              ^
> drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
>   list_for_each_entry(window, resources, list)
>   ^
> include/linux/list.h:447:43: error: dereferencing pointer to incomplete type
>   for (pos = list_first_entry(head, typeof(*pos), member); \
>                                            ^
> include/linux/kernel.h:800:3: note: in definition of macro 'container_of'
>   (type *)( (char *)__mptr - offsetof(type,member) );})
>    ^
> include/linux/list.h:363:2: note: in expansion of macro 'list_entry'
>   list_entry((ptr)->next, type, member)
>   ^
> include/linux/list.h:447:13: note: in expansion of macro 'list_first_entry'
>   for (pos = list_first_entry(head, typeof(*pos), member); \
>              ^
> drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
>   list_for_each_entry(window, resources, list)
>   ^
> In file included from include/linux/compiler-gcc.h:106:0,
>                  from include/linux/compiler.h:54,
>                  from include/linux/linkage.h:4,
>                  from include/linux/kernel.h:6,
>                  from drivers/of/of_pci.c:1:
> include/linux/list.h:447:43: error: dereferencing pointer to incomplete type
>   for (pos = list_first_entry(head, typeof(*pos), member); \
>                                            ^
> include/linux/compiler-gcc4.h:14:53: note: in definition of macro '__compiler_offsetof'
>  #define __compiler_offsetof(a,b) __builtin_offsetof(a,b)
>                                                      ^
> include/linux/kernel.h:800:29: note: in expansion of macro 'offsetof'
>   (type *)( (char *)__mptr - offsetof(type,member) );})
>                              ^
> include/linux/list.h:352:2: note: in expansion of macro 'container_of'
>   container_of(ptr, type, member)
>   ^
> include/linux/list.h:363:2: note: in expansion of macro 'list_entry'
>   list_entry((ptr)->next, type, member)
>   ^
> include/linux/list.h:447:13: note: in expansion of macro 'list_first_entry'
>   for (pos = list_first_entry(head, typeof(*pos), member); \
>              ^
> drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
>   list_for_each_entry(window, resources, list)
>   ^
> In file included from include/linux/kobject.h:20:0,
>                  from include/linux/of.h:21,
>                  from drivers/of/of_pci.c:3:
> include/linux/list.h:448:11: error: dereferencing pointer to incomplete type
>        &pos->member != (head);     \
>            ^
> drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
>   list_for_each_entry(window, resources, list)
>   ^
> In file included from drivers/of/of_pci.c:1:0:
> include/linux/list.h:393:40: error: dereferencing pointer to incomplete type
>   list_entry((pos)->member.next, typeof(*(pos)), member)
>                                         ^
> include/linux/kernel.h:799:18: note: in definition of macro 'container_of'
>   const typeof( ((type *)0)->member ) *__mptr = (ptr); \
>                   ^
> include/linux/list.h:393:2: note: in expansion of macro 'list_entry'
>   list_entry((pos)->member.next, typeof(*(pos)), member)
>   ^
> include/linux/list.h:449:13: note: in expansion of macro 'list_next_entry'
>        pos = list_next_entry(pos, member))
>              ^
> drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
>   list_for_each_entry(window, resources, list)
>   ^
> include/linux/list.h:393:18: error: dereferencing pointer to incomplete type
>   list_entry((pos)->member.next, typeof(*(pos)), member)
>                   ^
> include/linux/kernel.h:799:49: note: in definition of macro 'container_of'
>   const typeof( ((type *)0)->member ) *__mptr = (ptr); \
>                                                  ^
> include/linux/list.h:393:2: note: in expansion of macro 'list_entry'
>   list_entry((pos)->member.next, typeof(*(pos)), member)
>   ^
> include/linux/list.h:449:13: note: in expansion of macro 'list_next_entry'
>        pos = list_next_entry(pos, member))
>              ^
> drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
>   list_for_each_entry(window, resources, list)
>   ^
> include/linux/list.h:393:40: error: dereferencing pointer to incomplete type
>   list_entry((pos)->member.next, typeof(*(pos)), member)
>                                         ^
> include/linux/kernel.h:800:3: note: in definition of macro 'container_of'
>   (type *)( (char *)__mptr - offsetof(type,member) );})
>    ^
> include/linux/list.h:393:2: note: in expansion of macro 'list_entry'
>   list_entry((pos)->member.next, typeof(*(pos)), member)
>   ^
> include/linux/list.h:449:13: note: in expansion of macro 'list_next_entry'
>        pos = list_next_entry(pos, member))
>              ^
> drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
>   list_for_each_entry(window, resources, list)
>   ^
> In file included from include/linux/compiler-gcc.h:106:0,
>                  from include/linux/compiler.h:54,
>                  from include/linux/linkage.h:4,
>                  from include/linux/kernel.h:6,
>                  from drivers/of/of_pci.c:1:
> include/linux/list.h:393:40: error: dereferencing pointer to incomplete type
>   list_entry((pos)->member.next, typeof(*(pos)), member)
>                                         ^
> include/linux/compiler-gcc4.h:14:53: note: in definition of macro '__compiler_offsetof'
>  #define __compiler_offsetof(a,b) __builtin_offsetof(a,b)
>                                                      ^
> include/linux/kernel.h:800:29: note: in expansion of macro 'offsetof'
>   (type *)( (char *)__mptr - offsetof(type,member) );})
>                              ^
> include/linux/list.h:352:2: note: in expansion of macro 'container_of'
>   container_of(ptr, type, member)
>   ^
> include/linux/list.h:393:2: note: in expansion of macro 'list_entry'
>   list_entry((pos)->member.next, typeof(*(pos)), member)
>   ^
> include/linux/list.h:449:13: note: in expansion of macro 'list_next_entry'
>        pos = list_next_entry(pos, member))
>              ^
> drivers/of/of_pci.c:229:2: note: in expansion of macro 'list_for_each_entry'
>   list_for_each_entry(window, resources, list)
>   ^
> drivers/of/of_pci.c:230:15: error: dereferencing pointer to incomplete type
>    kfree(window->res);
>                ^
> 
> Caused by commit 14d76b68f281 ("PCI: Use common resource list
> management code instead of private implementation") interacting with
> commit d2be00c0fb5a ("of/pci: Free resources on failure in
> of_pci_get_host_bridge_resources()") from the pci tree.
> 
> I applied the following merge fix patch (which may need more work?).
Hi Stephen,
	Thanks for fixing it and there should no more work needed.
Regards!
Gerry

> Someone needs to remember to tell Linus about this fix (or similar)
> when these trees get merged.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 9 Feb 2015 13:08:24 +1100
> Subject: [PATCH] of/pci: fix up for "PCI: Use common resource list management
>  code instead of private implementation"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/of/of_pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 60dc36c865b5..110fece2ff53 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -140,7 +140,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>  			unsigned char busno, unsigned char bus_max,
>  			struct list_head *resources, resource_size_t *io_base)
>  {
> -	struct pci_host_bridge_window *window;
> +	struct resource_entry *window;
>  	struct resource *res;
>  	struct resource *bus_range;
>  	struct of_pci_range range;
> @@ -226,7 +226,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>  conversion_failed:
>  	kfree(res);
>  parse_failed:
> -	list_for_each_entry(window, resources, list)
> +	resource_list_for_each_entry(window, resources)
>  		kfree(window->res);
>  	pci_free_resource_list(resources);
>  	kfree(bus_range);
> 
