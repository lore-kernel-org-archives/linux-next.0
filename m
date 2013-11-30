From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 29 (sfi)
Date: Fri, 29 Nov 2013 17:41:41 -0800
Message-ID: <52994255.4000800@infradead.org>
References: <20131129134535.f886fbf966dcfea00178a1b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:55602 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072Ab3K3Blp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Nov 2013 20:41:45 -0500
In-Reply-To: <20131129134535.f886fbf966dcfea00178a1b7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, sfi-devel@simplefirmware.org

On 11/28/13 18:45, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20131128:
> 

on x86_64:

when CONFIG_ACPI is not enabled:

  CC      drivers/sfi/sfi_acpi.o
drivers/sfi/sfi_acpi.c: In function 'sfi_acpi_parse_xsdt':
drivers/sfi/sfi_acpi.c:105:12: error: dereferencing pointer to incomplete type
drivers/sfi/sfi_acpi.c:105:12: error: invalid application of 'sizeof' to incomplete type 'struct acpi_table_header'
drivers/sfi/sfi_acpi.c:107:32: error: dereferencing pointer to incomplete type
drivers/sfi/sfi_acpi.c: In function 'sfi_acpi_get_table':
drivers/sfi/sfi_acpi.c:133:12: error: dereferencing pointer to incomplete type
drivers/sfi/sfi_acpi.c:133:12: error: invalid application of 'sizeof' to incomplete type 'struct acpi_table_header'
drivers/sfi/sfi_acpi.c:135:32: error: dereferencing pointer to incomplete type
drivers/sfi/sfi_acpi.c: In function 'sfi_acpi_table_show':
drivers/sfi/sfi_acpi.c:195:12: error: dereferencing pointer to incomplete type
drivers/sfi/sfi_acpi.c: In function 'sfi_acpi_sysfs_init':
drivers/sfi/sfi_acpi.c:207:12: error: dereferencing pointer to incomplete type
drivers/sfi/sfi_acpi.c:207:12: error: invalid application of 'sizeof' to incomplete type 'struct acpi_table_header'
drivers/sfi/sfi_acpi.c:210:35: error: dereferencing pointer to incomplete type
make[3]: *** [drivers/sfi/sfi_acpi.o] Error 1



-- 
~Randy
