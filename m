From: Len Brown <lenb@kernel.org>
Subject: Re: [SFI-devel] linux-next: manual merge of the sfi tree with the acpi
 tree
Date: Fri, 28 Aug 2009 19:47:34 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.0908281946220.27023@localhost.localdomain>
References: <20090817180610.0de34cab.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173017pub.verizon.net ([206.46.173.17]:54095 "EHLO
	vms173017pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961AbZH1XsE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2009 19:48:04 -0400
In-reply-to: <20090817180610.0de34cab.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: sfi-devel@simplefirmware.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 17 Aug 2009, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the sfi tree got a conflict in
> drivers/acpi/tables.c between commit
> 44043a4299724bb386ac7915a57a18b176e9df07 ("ACPI: check acpi_disabled in
> acpi_table_parse()") from the acpi tree and commit
> 55ec50ee899aa3199c126bb4b740abb9a4ab51df ("ACPI: check acpi_disabled in
> acpi_table_parse() and acpi_table_parse_entries()") from the sfi tree.
> 
> I used the sfi tree version.

thanks.
this should be fixed now, and both trees should again include
the identical commits where they overlap.

-Len Brown, Intel Open Source Technology Center
