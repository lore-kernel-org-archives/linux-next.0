From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the boot-params tree
Date: Tue, 16 Dec 2008 00:21:02 +1100
Message-ID: <20081216002102.2db35cf2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45744 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751383AbYLONVH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 08:21:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Nicolas Pitre <nico@cam.org>, Russell King <rmk@arm.linux.org.uk>

Hi Rusty,

Today's linux-next merge of the boot-params tree got a conflict in
arch/arm/kernel/setup.c between commit
4b5f32cee0cce7b9783ced5cbeabd17aa53c51fb ("[ARM] rationalize memory
configuration code some more") from the arm tree and commit
0de5c2d9f02d2018fd671ca1015432dffa5eb338 ("param:
arch_get_boot_command_line()") from the boot-params tree.

I fixed it up as best I could (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/arm/kernel/setup.c
index 7049815,72b7aa5..0000000
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@@ -112,9 -112,9 +112,8 @@@ static struct stack stacks[NR_CPUS]
  char elf_platform[ELF_PLATFORM_SIZE];
  EXPORT_SYMBOL(elf_platform);
  
 -static struct meminfo meminfo __initdata = { 0, };
  static const char *cpu_name;
  static const char *machine_name;
- static char __initdata command_line[COMMAND_LINE_SIZE];
  
  static char default_command_line[COMMAND_LINE_SIZE] __initdata = CONFIG_CMDLINE;
  static union { char c[4]; unsigned long l; } endian_test __initdata = { { 'l', '?', '?', 'b' } };
@@@ -708,22 -700,30 +705,30 @@@ void __init arch_get_boot_command_line(
  	if (mdesc->fixup)
  		mdesc->fixup(mdesc, tags, &from, &meminfo);
  
- 	if (tags->hdr.tag == ATAG_CORE) {
- 		if (meminfo.nr_banks != 0)
- 			squash_mem_tags(tags);
- 		save_atags(tags);
- 		parse_tags(tags);
- 	}
+ 	if (meminfo.nr_banks != 0)
+ 		squash_mem_tags(tags);
+ 	save_atags(tags);
+ 	parse_tags(tags);
+ 
+ 	/* This copies into boot_command_line */
+ 	parse_cmdline(from);
+ }
+ 
+ void __init setup_arch(void)
+ {
+ 	struct machine_desc *mdesc = setup_machine(machine_arch_type);
+ 
+ 	machine_name = mdesc->name;
+ 
+ 	if (mdesc->soft_reboot)
+ 		reboot_setup("s");
  
 -	init_mm.start_code = (unsigned long) &_text;
 -	init_mm.end_code   = (unsigned long) &_etext;
 -	init_mm.end_data   = (unsigned long) &_edata;
 -	init_mm.brk	   = (unsigned long) &_end;
 +	init_mm.start_code = (unsigned long) _text;
 +	init_mm.end_code   = (unsigned long) _etext;
 +	init_mm.end_data   = (unsigned long) _edata;
 +	init_mm.brk	   = (unsigned long) _end;
  
- 	memcpy(boot_command_line, from, COMMAND_LINE_SIZE);
- 	boot_command_line[COMMAND_LINE_SIZE-1] = '\0';
- 	parse_cmdline(cmdline_p, from);
 -	paging_init(&meminfo, mdesc);
 +	paging_init(mdesc);
  	request_standard_resources(&meminfo, mdesc);
  
  #ifdef CONFIG_SMP
