From: Ian Abbott <abbotti@mev.co.uk>
Subject: Re: linux-next: Tree for Jun 8 (comedi/das08.c)
Date: Fri, 8 Jun 2012 19:28:55 +0100
Message-ID: <4FD24467.5030202@mev.co.uk>
References: <20120608144358.a83215ceb8212c55d37d21d0@canb.auug.org.au> <4FD230ED.5030901@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FD230ED.5030901@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Abbott <ian.abbott@mev.co.uk>, Frank Mori Hess <fmhess@users.sourceforge.net>
List-Id: linux-next.vger.kernel.org

On 2012-06-08 18:05, Randy Dunlap wrote:
> On 06/07/2012 09:43 PM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20120607:
>
>
>
> on i386, when CONFIG_PCI is not enabled:
>
> drivers/staging/comedi/drivers/das08.c: In function 'das08_attach':
> drivers/staging/comedi/drivers/das08.c:1084:3: error: implicit declaration of function 'das08_find_pci'
> drivers/staging/comedi/drivers/das08.c:1084:8: warning: assignment makes pointer from integer without a cast
> drivers/staging/comedi/drivers/das08.c:1087:3: error: implicit declaration of function 'das08_pci_attach_common'

Sorry about that.  I think I've accidentally fixed it already in a patch 
posted to <devel@driverdev.osuosl.org>, but I'll attach it to this 
thread as well.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
