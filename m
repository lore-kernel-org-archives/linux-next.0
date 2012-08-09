From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Aug 9 (staging/csr)
Date: Thu, 09 Aug 2012 12:11:44 -0700
Message-ID: <50240B70.3000800@xenotime.net>
References: <20120809131317.3d289a0b98a13c72001154fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120809131317.3d289a0b98a13c72001154fb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On 08/08/2012 08:13 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120807:
> 



(on i386)

ERROR: "register_inetaddr_notifier" [drivers/staging/csr/csr_wifi.ko] undefined!
ERROR: "unregister_inetaddr_notifier" [drivers/staging/csr/csr_wifi.ko] undefined!

when CONFIG_INET is not enabled.

CSR_WIFI probably should depend on INET.


-- 
~Randy
