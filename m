From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 30 (firmware_loader)
Date: Thu, 30 May 2019 09:10:13 -0700
Message-ID: <28716a14-772d-bc82-5111-34cd38cfda54@infradead.org>
References: <20190530162132.6081d246@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530162132.6081d246@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
List-Id: linux-next.vger.kernel.org

On 5/29/19 11:21 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190529:
> 

on i386 or x86_64:
when CONFIG_PROC_SYSCTL is not set/enabled:

ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x1c): undefined reference to `sysctl_vals'
ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x20): undefined reference to `sysctl_vals'
ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x40): undefined reference to `sysctl_vals'
ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x44): undefined reference to `sysctl_vals'


-- 
~Randy
