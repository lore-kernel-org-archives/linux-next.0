From: Peter Jones <pjones@redhat.com>
Subject: Re: linux-next: April 27 (iscsi_ibft)
Date: Mon, 03 May 2010 12:01:25 -0400
Message-ID: <4BDEF355.8050504@redhat.com>
References: <80edf231-ef31-4f21-ab1b-1a21fda35809@default> <20100427230121.GA31743@andromeda.dapyr.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:22755 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932986Ab0ECQBa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 May 2010 12:01:30 -0400
In-Reply-To: <20100427230121.GA31743@andromeda.dapyr.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad@kernel.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Linux-Kernel <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On 04/27/2010 07:01 PM, Konrad Rzeszutek Wilk wrote:
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

Or we make that one structure be defined whether CONFIG_ACPI is enabled
or not.

-- 
        Peter

For some reason it has always seemed to me that the term software 
engineering contains some very optimistic assumptions about the 
nature of reality.
