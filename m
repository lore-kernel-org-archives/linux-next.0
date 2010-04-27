From: Konrad Rzeszutek Wilk <konrad@kernel.org>
Subject: Re: linux-next: April 27 (iscsi_ibft)
Date: Tue, 27 Apr 2010 19:01:21 -0400
Message-ID: <20100427230121.GA31743@andromeda.dapyr.net>
References: <80edf231-ef31-4f21-ab1b-1a21fda35809@default>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <80edf231-ef31-4f21-ab1b-1a21fda35809@default>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, Peter Jones <pjones@redhat.com>, Konrad Rzeszutek Wilk <konrad@kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Apr 27, 2010 at 09:13:16AM -0700, Randy Dunlap wrote:
> when CONFIG_ACPI is not enabled:
> 
> drivers/firmware/iscsi_ibft_find.c:112: error: dereferencing pointer to incomplete type
> drivers/firmware/iscsi_ibft_find.c:112: error: dereferencing pointer to incomplete type
> drivers/firmware/iscsi_ibft_find.c:112: warning: type defaults to 'int' in declaration of 'type name'
> drivers/firmware/iscsi_ibft_find.c:112: error: dereferencing pointer to incomplete type
> drivers/firmware/iscsi_ibft_find.c:112: warning: type defaults to 'int' in declaration of 'type name'

Yikes.

Randy, thank you for spotting this and sending an e-mail my way.

It is all b/c we now use the 'struct acpi_table_ibft *ibft_addr' which
is gone when !CONFIG_ACPI.

Peter, if we did in an #ifdef !CONFIG_ACPI in iscsi_ibft.h and included
a copy of the old ibft_struct that should work.

Or we make the code dependent on CONFIG_ACPI (in the Kconfig
file).

Peter, Randy: Which option do you think makes more sense?
