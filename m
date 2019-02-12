From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 12 (chrome/wilco_ec/)
Date: Tue, 12 Feb 2019 15:31:58 -0800
Message-ID: <341fc51d-aa50-6f8e-1c03-e6a0edfe4905@infradead.org>
References: <20190212175059.1ea4c16c@canb.auug.org.au>
 <94edf49b-6b37-2dac-a2db-ad454b105fd1@infradead.org>
 <CAHX4x87=Myx45wBYtFY=rwz8jVmYY-tYVQjnzod-V8HaWJSy+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHX4x87=Myx45wBYtFY=rwz8jVmYY-tYVQjnzod-V8HaWJSy+g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>
List-Id: linux-next.vger.kernel.org

On 2/12/19 3:26 PM, Nick Crews wrote:
> Hi Randy,
> 
> This looks like we have a bad dependency structure in our Kconfig. I'll figure it out, and then where should I send the patch?

AFAICT, all drivers/platform/chrome/ patches go to its maintainers (& to
linux-kernel@vger.kernel.org):

CHROME HARDWARE PLATFORM SUPPORT
M:	Benson Leung <bleung@chromium.org>
M:	Enric Balletbo i Serra <enric.balletbo@collabora.com>
S:	Maintained
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
F:	drivers/platform/chrome/


> Nick
> 
> On Tue, Feb 12, 2019 at 9:44 AM Randy Dunlap <rdunlap@infradead.org <mailto:rdunlap@infradead.org>> wrote:
> 
>     On 2/11/19 10:50 PM, Stephen Rothwell wrote:
>     > Hi all,
>     >
>     > Changes since 20190211:
>     >
> 
> 
>     on i386 or x86_64:
> 
>     ld: drivers/platform/chrome/wilco_ec/core.o: in function `wilco_ec_remove':
>     core.c:(.text+0x46): undefined reference to `cros_ec_lpc_mec_destroy'
>     ld: drivers/platform/chrome/wilco_ec/core.o: in function `wilco_ec_probe':
>     core.c:(.text+0x285): undefined reference to `cros_ec_lpc_mec_init'
>     ld: core.c:(.text+0x39a): undefined reference to `cros_ec_lpc_mec_destroy'
>     ld: drivers/platform/chrome/wilco_ec/mailbox.o: in function `wilco_ec_transfer':
>     mailbox.c:(.text+0x26): undefined reference to `cros_ec_lpc_io_bytes_mec'
>     ld: mailbox.c:(.text+0x47): undefined reference to `cros_ec_lpc_io_bytes_mec'
>     ld: mailbox.c:(.text+0x242): undefined reference to `cros_ec_lpc_io_bytes_mec'
> 
> 
>     Full randconfig file is attached.
> 
>     -- 
>     ~Randy
> 


-- 
~Randy
