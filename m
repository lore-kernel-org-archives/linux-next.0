From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [linux-next] "x86, realmode: Move ACPI wakeup to unified realmode
 code" commit breaks ia64
Date: Tue, 29 May 2012 18:46:28 -0400
Message-ID: <20120529224628.GB16055@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-ia64-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-ia64-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Len Brown <len.brown@intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-ia64@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

This commit: c9b77ccb52a5c77233b0e557b7d4417b00ef4012 in linux-next

    x86, realmode: Move ACPI wakeup to unified realmode code

causes breakage on itanic:

  drivers/acpi/sleep.c:28:26: fatal error: asm/realmode.h: No such file or directory

Full log at:
	http://kisskb.ellerman.id.au/kisskb/buildresult/6395679/

Have a look if you can please.

Thanks,
Paul.

