From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: April 27 (iscsi_ibft)
Date: Wed, 28 Apr 2010 08:26:11 -0700
Message-ID: <4BD85393.8020400@oracle.com>
References: <80edf231-ef31-4f21-ab1b-1a21fda35809@default> <20100427230121.GA31743@andromeda.dapyr.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:48466 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755251Ab0D1P22 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Apr 2010 11:28:28 -0400
In-Reply-To: <20100427230121.GA31743@andromeda.dapyr.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad@kernel.org>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, Peter Jones <pjones@redhat.com>, linux-next@vger.kernel.org

On 04/27/10 16:01, Konrad Rzeszutek Wilk wrote:
> On Tue, Apr 27, 2010 at 09:13:16AM -0700, Randy Dunlap wrote:
>> when CONFIG_ACPI is not enabled:
>>
>> drivers/firmware/iscsi_ibft_find.c:112: error: dereferencing pointer to incomplete type
>> drivers/firmware/iscsi_ibft_find.c:112: error: dereferencing pointer to incomplete type
>> drivers/firmware/iscsi_ibft_find.c:112: warning: type defaults to 'int' in declaration of 'type name'
>> drivers/firmware/iscsi_ibft_find.c:112: error: dereferencing pointer to incomplete type
>> drivers/firmware/iscsi_ibft_find.c:112: warning: type defaults to 'int' in declaration of 'type name'
> 
> Yikes.
> 
> Randy, thank you for spotting this and sending an e-mail my way.
> 
> It is all b/c we now use the 'struct acpi_table_ibft *ibft_addr' which
> is gone when !CONFIG_ACPI.
> 
> Peter, if we did in an #ifdef !CONFIG_ACPI in iscsi_ibft.h and included
> a copy of the old ibft_struct that should work.
> 
> Or we make the code dependent on CONFIG_ACPI (in the Kconfig
> file).
> 
> Peter, Randy: Which option do you think makes more sense?

I think that you and Peter know more about that than I do.
I'd go for the Kconfig dependency.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
