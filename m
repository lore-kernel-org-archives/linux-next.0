From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH -next] kmemleak: fix kconfig for crc32 build error
Date: Fri, 06 Nov 2009 23:12:30 +0000
Message-ID: <1257549150.19025.2.camel@pc1117.cambridge.arm.com>
References: <20091106181330.80bca052.sfr@canb.auug.org.au>
	 <4AF4B259.8030506@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760100AbZKFXMm@vger.kernel.org>
In-Reply-To: <4AF4B259.8030506@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 2009-11-06 at 15:33 -0800, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> kmemleak uses crc32 functions so it needs to select CRC32.
> Fixes build error:
> 
> kmemleak.c:(.text+0x7ce62): undefined reference to `crc32_le'

Thanks for the patch. I'll included it in my kmemleak branch.

-- 
Catalin
