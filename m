From: Matteo Croce <mcroce@redhat.com>
Subject: Re: linux-next: Tree for May 30 (firmware_loader)
Date: Fri, 31 May 2019 02:52:32 +0200
Message-ID: <1D63F878-8B7D-4BE4-9FB7-F523C7F473BE@redhat.com>
References: <20190530162132.6081d246@canb.auug.org.au> <28716a14-772d-bc82-5111-34cd38cfda54@infradead.org> <20190531100646.212b065f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531100646.212b065f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On May 31, 2019 2:06:46 AM GMT+02:00, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
> 
> On Thu, 30 May 2019 09:10:13 -0700 Randy Dunlap
> <rdunlap@infradead.org> wrote:
> >
> > on i386 or x86_64:
> > when CONFIG_PROC_SYSCTL is not set/enabled:
> > 
> > ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x1c):
> undefined reference to `sysctl_vals'
> > ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x20):
> undefined reference to `sysctl_vals'
> > ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x40):
> undefined reference to `sysctl_vals'
> > ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x44):
> undefined reference to `sysctl_vals'
> 
> Caused by commit
> 
>   6a33853c5773 ("proc/sysctl: add shared variables for range check")
> 
> Added some more cc's

Hi,

Probably the whole firmware_config_table declaration should be under #ifdef CONFIG_PROC_SYSCTL?

I'll look into it, thanks.
-- 
Matteo Croce
per aspera ad upstream
